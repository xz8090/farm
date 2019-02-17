package cn.jxufe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.SeedBag;
import cn.jxufe.entity.User;
import cn.jxufe.service.SeedBagService;
import cn.jxufe.service.Seed_land_TypeViewService;
import cn.jxufe.service.ShopViewService;
import cn.jxufe.service.UserService;
/**
 * 
* @ClassName: ShopController  
* @Description: 商店控制类，包裹，商店种子信息，包裹信息，及一些数据库视图的操作 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("shop")
public class ShopController {
	@Autowired
	private SeedBagService seedBagService;
	@Autowired
	private ShopViewService shopViewService;
	@Autowired
	private UserService userService;
	@Autowired
	private Seed_land_TypeViewService seed_land_TypeViewService;
	/**
	 * 
	* @Title: grid  
	* @Description: 商店视图跳转地址
	* @param @return    参数  
	* @return String    返回类型  
	* @throws
	 */
	@RequestMapping(value = "grid")
	public String grid() {
		return "shop/grid";
	}
	/**
	 * 
	* @Title: seeds  
	* @Description: 商店种子信息，查询数据库视图表，可获得类型代码对应的中文解释
	* @param @param pageRequest
	* @param @return    参数  
	* @return EasyUIData<?>    返回类型  
	* @throws
	 */
	@RequestMapping(value="seeds",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  EasyUIData<?> seeds(EasyUIDataPageRequest pageRequest){
		System.out.println("=======seeds=======");
        List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));       
        return seed_land_TypeViewService.findAll(pageable);
    }
	/**
	 * 
	* @Title: save  
	* @Description: 保存种子到包裹，判断啊包裹是否存在种子，是选择增加种子信息还是更改种子信息，以及判断金币数量是否符合购买
	* @param @param session
	* @param @param seedBag
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
	@RequestMapping(value="saveBag",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(HttpSession session,@RequestBody SeedBag seedBag){  
		System.out.println("===========正在保存seedBag==============");
		System.out.println(seedBag.getUsername()+","+seedBag.getcId());
		Message message=new Message();
		if(seedBag.getUsername()==null || seedBag.getUsername()==""){
			message.setCode(-10);
			message.setMsg("购买失败,请先登录！");
			return message;
		}
		else {
			int userMoney=shopViewService.findMoney(seedBag.getUsername());
			int seedPrice=shopViewService.findPrice(seedBag.getcId());
			if(userMoney-seedPrice < 0){
				message.setCode(-10);
				message.setMsg("购买失败,金币不足！");
				return message;
			}else{
				//更新用户金币
				User user=new User();
				user.setUsername(seedBag.getUsername());
				user.setMoney(userMoney-seedPrice);
				userService.update(session,user);
				//更新包裹或者插入数据到包裹
				int num=ifExistSeed(seedBag.getUsername(),seedBag.getcId());
				System.out.println(seedBag.getUsername()+":金币（"+userMoney+"）种子("+num+")");
				//num为0，表示需要插入数据，否则更新数据，包裹种子加1
				if(num==0) {
					seedBag.setNum(1);
					return seedBagService.update(seedBag);
				}
				else {
					seedBag.setNum(num+1);
					return seedBagService.update(seedBag);
				}
			}
		}
		
    }
	/**
	 * 
	* @Title: ifExistSeed  
	* @Description: 判断包裹是否存在该种子，用户名username和种子cId确定唯一包裹内种子
	* @param @param username
	* @param @param cId
	* @param @return    参数  
	* @return int    返回类型  
	* @throws
	 */
	@RequestMapping("ifExistSeed")
	@ResponseBody
	public int ifExistSeed(@RequestParam(defaultValue="") String username,@RequestParam(defaultValue="") int cId){ 
		System.out.println("ifExistSeed");
		return seedBagService.findByUsernameAndCId(username, cId);
	}
	/**
	 * 
	* @Title: gridData  
	* @Description: 获得用户username包裹内所有购买的种子信息，前台页面对应tools2.jsp
	* @param @param session
	* @param @param pageRequest
	* @param @param model
	* @param @return    参数  
	* @return EasyUIData<?>    返回类型  
	* @throws
	 */
	@RequestMapping(value="gridData",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  EasyUIData<?> gridData(HttpSession session,EasyUIDataPageRequest pageRequest,Model model){
		System.out.println("===========shop/gridData==============");
        List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));       
        String username=((User)session.getAttribute("curUser")).getUsername();
        System.out.println("username:"+username);
        return shopViewService.findSome(username,pageable);
    }
	 @RequestMapping(value="updateBag",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public void updateBag(HttpSession session,@RequestParam(defaultValue="0") int cId,@RequestParam(defaultValue="0") int addNum){
	   	System.out.println("========user/updateBag=======");
	   	String username=((User)session.getAttribute("curUser")).getUsername();
	   	shopViewService.updateBag(username, cId, addNum);
	 }

}
