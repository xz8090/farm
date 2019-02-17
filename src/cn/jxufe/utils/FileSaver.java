package cn.jxufe.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import cn.jxufe.bean.Message;
/**
 * 
* @ClassName: FileSaver  
* @Description: 文件上传类 
* @author lbq  
* @date 2018年6月1日  
*
 */
public class FileSaver {
	/**
	 * 
	* @Title: CreateMultilayerFile  
	* @Description: 先判断该文件目录是否存在不存在先创建，否则直接保存图片
	* @param @param dir
	* @param @return    参数  
	* @return boolean    返回类型  
	* @throws
	 */
	private static boolean CreateMultilayerFile(String dir)  
	{  
	    try {  
	           File dirPath = new File(dir);  
	           if (!dirPath.exists()) {  
	               dirPath.mkdirs();  
	           }  
	       } catch (Exception e) {  
	          System.out.println("创建多层目录操作出错: "+e.getMessage());  
	           e.printStackTrace();  
	           return false;  
	       }  
	    return true;  
	}
	/**
	 * 
	* @Title: save  
	* @Description: 文件保存到服务器上
	* @param @param fileUrl
	* @param @param request
	* @param @param uploadFile
	* @param @return    参数  
	* @return Message    返回类型  
	* @throws
	 */
	public static Message save(String fileUrl, HttpServletRequest request, MultipartFile uploadFile) {
		Message message = new Message();
		try {
			// 判断文件是否为空
			if (!uploadFile.isEmpty()) {
				
				try {
					String relativePath="upload/"+fileUrl + uploadFile.getOriginalFilename();
					// 文件保存路径  
	                String filePath = request.getSession().getServletContext().getRealPath("/") + relativePath;
	                if(CreateMultilayerFile(filePath)==true) {  
	                	System.out.println(filePath);
						// 转存文件
						uploadFile.transferTo(new File(filePath));
						message.setCode(0);
						message.setMsg(relativePath);
	                }
	                
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}
}
