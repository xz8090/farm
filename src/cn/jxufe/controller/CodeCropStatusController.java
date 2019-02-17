package cn.jxufe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.entity.CodeCropStatus;
import cn.jxufe.service.CodeCropStatusService;
/**
 * 
* @ClassName: CodeCropStatusController  
* @Description: 种子所处阶段控制类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("codeCropStatus")
public class CodeCropStatusController {
	@Autowired
    private CodeCropStatusService codeCropStatusService;
	/**
	 * 
	* @Title: data  
	* @Description: 获得所有种子生长阶段代码对应的中文解释
	* @param @return
	* @param @throws Exception    参数  
	* @return Iterable<CodeCropStatus>    返回类型  
	* @throws
	 */
    @RequestMapping(value="/data",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Iterable<CodeCropStatus> data() throws Exception {
        return codeCropStatusService.findALl();        
    }
}
