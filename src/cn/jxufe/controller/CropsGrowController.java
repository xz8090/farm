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
import cn.jxufe.entity.CropsGrow;
import cn.jxufe.service.CropsGrowService;
/**
 * 
* @ClassName: CropsGrowController  
* @Description: 作物生长控制类，包含生长阶段，图片位置等信息 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("cropsGrow")
public class CropsGrowController {
	@Autowired
	private CropsGrowService cropsGrowService;
	/**
	 * 
	* @Title: grid  
	* @Description: 跳转到该视图地址
	* @param @return    参数  
	* @return String    返回类型  
	* @throws
	 */
	@RequestMapping(value = "grid")
	public String grid() {
		return "cropsGrow/grid";
	}
	/**
	 * 
	* @Title: gridData  
	* @Description: 通过cId查询获取该种子生长状态信息，默认为0
	* @param @param pageRequest
	* @param @param cId
	* @param @param model
	* @param @return    参数  
	* @return EasyUIData<?>    返回类型  
	* @throws
	 */
	@RequestMapping(value="gridData",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<?> gridData(EasyUIDataPageRequest pageRequest,@RequestParam(defaultValue="0") int cId,Model model){
        System.out.println(cId);
		List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if(pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC,pageRequest.getSort()));
        }else {
            orders.add(new Sort.Order(Direction.DESC,pageRequest.getSort()));
        }
        Pageable pageable = new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));       
        return cropsGrowService.findSome(cId,pageable);
    }
	/**
	 * 
	* @Title: save  
	* @Description: 保存种子状态信息
	* @param @param cropsGrow
	* @param @param cId
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(CropsGrow cropsGrow,@RequestParam(defaultValue="0") int cId){
		cropsGrow.setcId(cId);
        return cropsGrowService.save(cropsGrow);
    }
	/**
	 * 
	* @Title: delete  
	* @Description: 删除种子状态信息
	* @param @param cropsGrow
	* @param @param model
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
    @RequestMapping(value="delete",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message delete(CropsGrow cropsGrow,Model model){     
        return cropsGrowService.delete(cropsGrow);
    }
    
    @RequestMapping(value="getSeeds",produces=MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public CropsGrow getSeeds(@RequestParam(defaultValue="0") int cId,@RequestParam(defaultValue="0") int growStep){
		System.out.println("cId:"+cId+" growStep:"+growStep);
		return cropsGrowService.findByCIdAndGrowStep(cId, growStep);
	}
}