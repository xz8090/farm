package cn.jxufe.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Seed;
import cn.jxufe.service.SeedService;
/**
 * 
* @ClassName: SeedController  
* @Description: 种子信息控制类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("seed")
public class SeedController {
	@Autowired
	private SeedService seedService;
	/**
	 * 
	* @Title: grid  
	* @Description: 视图跳转地址
	* @param @return    参数  
	* @return String    返回类型  
	* @throws
	 */
	@RequestMapping(value = "grid")
	public String grid() {
		return "seed/grid";
	}
	/**
	 * 
	* @Title: gridData  
	* @Description: 通过种子名称获取所有种子信息，默认为空
	* @param @param pageRequest
	* @param @param caption
	* @param @return    参数  
	* @return EasyUIData<?>    返回类型  
	* @throws
	 */
	@RequestMapping(value="gridData",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  EasyUIData<?> gridData(EasyUIDataPageRequest pageRequest,@RequestParam(defaultValue="") String caption){
        System.out.println("caption:"+caption);
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));       
        return seedService.findSome(caption,pageable);
    }
	/**
	 * 
	* @Title: save  
	* @Description: 获取种子信息
	* @param @param seed
	* @param @param model
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(Seed seed,Model model){       
        return seedService.save(seed);
    }
	/**
	 * 
	* @Title: delete  
	* @Description: 删除种子信息
	* @param @param seed
	* @param @param model
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
    @RequestMapping(value="delete",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message delete(Seed seed,Model model){     
        return seedService.delete(seed);
    }
}
