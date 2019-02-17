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
import cn.jxufe.entity.Lands;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
/**
 * 
* @ClassName: UserController  
* @Description: 用户信息控制类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 
	* @Title: select  
	* @Description: 选择用户视图的地址
	* @param @return    参数  
	* @return String    返回类型  
	* @throws
	 */
	@RequestMapping(value = "/select")
	public String select() {
		return "user/select";
	}
	/**
	 * 
	* @Title: findALl  
	* @Description: 获得数据库所有用户数据
	* @param @return
	* @param @throws Exception    参数  
	* @return Iterable<User>    返回类型  
	* @throws
	 */
	@RequestMapping(value="getAllUser",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Iterable<User> findALl() throws Exception{
          return userService.findALl();
    } 
	/**
	 * 
	* @Title: setCurUser  
	* @Description: 将选择的用户存入到本地session里
	* @param @param session
	* @param @param user
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
	@RequestMapping(value="setCurUser",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE )
	@ResponseBody
	public Message setCurUser(HttpSession session, @RequestBody User user){
		System.out.println("Select User:"+user.getUsername());
		return userService.setCurUser(session, user);
	}
	/**
	 * 
	* @Title: grid  
	* @Description: 用户页面视图地址
	* @param @return    参数  
	* @return String    返回类型  
	* @throws
	 */
	@RequestMapping(value = "grid")
	public String grid() {
		return "user/grid";
	}
	/**
	 * 
	* @Title: gridData  
	* @Description: 获得用户信息清单，包括用户查询，参数为username默认为空
	* @param @param pageRequest
	* @param @param username
	* @param @return    参数  
	* @return EasyUIData<?>    返回类型  
	* @throws
	 */
	@RequestMapping(value="/gridData",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  EasyUIData<?> gridData(EasyUIDataPageRequest pageRequest,@RequestParam(defaultValue="") String username){
        System.out.println("username:"+username);
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));       
        return userService.findSome(username,pageable);
    }
	/**
	 * 
	* @Title: save  
	* @Description: 保存新增或者修改后的用户信息
	* @param @param user
	* @param @param model
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(HttpSession session,User user){       
        return userService.save(session,user);
    }
	/**
	 * 
	* @Title: delete  
	* @Description: 删除用户数据
	* @param @param user
	* @param @param model
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
    @RequestMapping(value="delete",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message delete(User user,Model model){     
        return userService.delete(user);
    }
    
    @RequestMapping(value="updateESM",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message update(HttpSession session,@RequestParam(defaultValue="0") int addExp,@RequestParam(defaultValue="0") int addScore,@RequestParam(defaultValue="0") int addMoney){
    	System.out.println("========user/updateESM=======");
    	String username=((User)session.getAttribute("curUser")).getUsername();
        return userService.updateESM(session,username, addExp, addScore, addMoney);
    }
}
