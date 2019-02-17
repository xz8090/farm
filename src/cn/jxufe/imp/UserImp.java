package cn.jxufe.imp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
/**
 * 
* @ClassName: UserImp  
* @Description: 用户清单实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Service
public class UserImp implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public EasyUIData<User> findSome(String username, Pageable pageable) {
		Page<User> page = userDAO.findByUsernameContaining(username, pageable);
		EasyUIData<User> easyUIData = new EasyUIData<User>();
		easyUIData.setTotal(page.getTotalElements());
		easyUIData.setRows(page.getContent());
		return easyUIData;
	}

	@Override
	public Message save(HttpSession session,User user) {

		Message message = new Message();
		try {
			setCurUser(session,user);
			userDAO.save(user);
			message.setCode(0);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}

	@Override
	public Message delete(User user) {

		Message message = new Message();
		try {
			userDAO.delete(user);
			message.setCode(0);
			message.setMsg("删除成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("删除失败");
		}
		return message;
	}

	@Override
	public Iterable<User> findALl() {
		return userDAO.findAll();
	}

	@Override
	public Message setCurUser(HttpSession session, User user) {
		System.out.println("setCurUser");
		Message message = new Message();
		try {
			session.setAttribute("curUser", user);
			message.setCode(0);
			message.setMsg("当前用户已设定为：" + user.getUsername() + "[" + user.getNickname() + "]");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存session失败");
		}
		return message;
	}

	@Override
	public Message update(HttpSession session,User user) {
		Message message = new Message();
		try {
			List<User> userList=userDAO.findByUsername(user.getUsername());
			int newMoey=user.getMoney();
			user=userList.get(0);
			user.setMoney(newMoey);
			setCurUser(session,user);
			userDAO.save(user);
			message.setCode(0);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}

	@Override
	public int findMoney(String username) {
		try {
			List<User> userList=userDAO.findByUsername(username);
			if(userList.size()>0) return userList.get(0).getMoney();
			else return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public Message updateESM(HttpSession session,String username, int addExp, int addScore, int addMoney) {
		Message message = new Message();
		try {
			List<User> userList=userDAO.findByUsername(username);
			User user=userList.get(0);
			System.out.println("更新用户经验金币积分："+user.getExp()+","+user.getMoney()+","+user.getScore());
			user.setExp(user.getExp()+addExp);
			user.setScore(user.getScore()+addScore);
			user.setMoney(user.getMoney()+addMoney);
			userDAO.save(user);
			setCurUser(session,user);
			message.setCode(0);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}
}
