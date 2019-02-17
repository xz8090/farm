package cn.jxufe.bean;
/**
 * 
* @ClassName: Message  
* @Description: 消息、错误码提示类 
* @author lbq  
* @date 2018年6月1日  
*
 */
public class Message {
	private int code;
	private String msg;
	/**
	 * 
	* @Title: getCode  
	* @Description: 错误码
	* @param @return    参数  
	* @return int    返回类型  
	* @throws
	 */
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	/**
	 * 
	* @Title: getMsg  
	* @Description: 错误消息
	* @param @return    参数  
	* @return String    返回类型  
	* @throws
	 */
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
