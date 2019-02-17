package cn.jxufe.service;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.User;
/**
 * 
* @ClassName: UserService  
* @Description: 用户清单Service接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface UserService {
	public EasyUIData<?> findSome(String username,Pageable page);
	public Iterable<User> findALl();
	public Message delete(User user);
	public Message save(HttpSession session,User user);
	public Message update(HttpSession session,User user);
	public Message updateESM(HttpSession session,String username,int addExp,int addScore,int addMoney);
	public int findMoney(String username);
	public Message setCurUser(HttpSession session, User user);
}
