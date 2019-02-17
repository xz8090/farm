package cn.jxufe.controller;


import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Lands;
import cn.jxufe.entity.LandsView;
import cn.jxufe.entity.Seed_land_TypeView;
import cn.jxufe.entity.User;
import cn.jxufe.service.LandsViewService;
import cn.jxufe.service.Seed_land_TypeViewService;
import cn.jxufe.utils.JsonDateValueProcessor;
import net.sf.json.JsonConfig;

/**
 * 
* @ClassName: LandController  
* @Description: 土地信息控制类 
* @author lbq  
* @date 2018年6月3日  
*
 */
@Controller
@RequestMapping("land")
public class LandController {
	@Autowired
	private LandsViewService landsViewService;
	@Autowired
	private Seed_land_TypeViewService seed_land_TypeViewService;
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
		return "land/grid";
	}
	
	/**
	 * 
	* @Title: getLands  
	* @Description: 先判断是否存在该用户名为username的土地没有就创建，否则返回空所有土地属性
	* @param @param username
	* @param @return    参数  
	* @return int    返回类型  
	* @throws
	 */
	@RequestMapping(value="getLands",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<LandsView> getLands(HttpSession session){ 
		String username=((User)session.getAttribute("curUser")).getUsername();
		System.out.println("getLands:"+username);
		return landsViewService.findByUsername(username);
	}
	
	@RequestMapping(value="getSeeds",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Seed_land_TypeView getSeeds(@RequestParam(defaultValue="0") int cId,@RequestParam(defaultValue="0") int growStep){
		System.out.println("cId:"+cId);
		return seed_land_TypeViewService.findByCIdAndGrowStep(cId, growStep);
	}
	
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(@RequestBody Lands lands,HttpSession session){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		String username=((User)session.getAttribute("curUser")).getUsername();
		lands.setUsername(username);
        return landsViewService.save(lands);
      
    }
}
