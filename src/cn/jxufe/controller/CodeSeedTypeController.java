package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.entity.CodeSeedType;
import cn.jxufe.service.CodeSeedTypeService;
/**
 * 
* @ClassName: CodeSeedTypeController  
* @Description: 种子类型控制类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("codeSeedType")
public class CodeSeedTypeController {
	@Autowired
    private CodeSeedTypeService codeSeedTypeService;
	/**
	 * 
	* @Title: data  
	* @Description: 获得所有种子类型代码对应的中文解释
	* @param @return
	* @param @throws Exception    参数  
	* @return Iterable<CodeSeedType>    返回类型  
	* @throws
	 */
    @RequestMapping(value="/data",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Iterable<CodeSeedType> data() throws Exception {
        return codeSeedTypeService.findALl();        
    }
}
