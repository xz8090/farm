package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.entity.CodeLandRequire;
import cn.jxufe.service.CodeLandRequireService;
/**
 * 
* @ClassName: CodeLandRequireController  
* @Description: 土地类型控制类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("codeLandRequire")
public class CodeLandRequireController {
	@Autowired
    private CodeLandRequireService codeLandRequireService;
	/**
	 * 
	* @Title: data  
	* @Description: 获得所有土地类型代码对应的中文解释
	* @param @return
	* @param @throws Exception    参数  
	* @return Iterable<CodeLandRequire>    返回类型  
	* @throws
	 */
    @RequestMapping(value="/data",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Iterable<CodeLandRequire> data() throws Exception {
        return codeLandRequireService.findALl();        
    }
}
