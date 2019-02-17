package cn.jxufe.controller;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.jxufe.bean.Message;
import cn.jxufe.utils.FileSaver;
/**
 * 
* @ClassName: FileController  
* @Description: 文件上传类，主要用于用户头像上传 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Controller
@RequestMapping("file")
public class FileController {
	/**
	 * 
	* @Title: saveHeadImg  
	* @Description: 文件上传位置及文件保存操作
	* @param @param request
	* @param @param uploadFile
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
    @RequestMapping(value="saveHeadImg",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message saveHeadImg(HttpServletRequest request,@RequestParam("filePathName") MultipartFile uploadFile){
    	return FileSaver.save("images/headImages/", request, uploadFile);
    }
}