package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.User;
/**
 * 
* @ClassName: UserDAO  
* @Description: 用户清单接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface UserDAO extends JpaRepository<User, Long>,PagingAndSortingRepository<User,Long>{
	/**
	 * 
	* @Title: findByUsernameContaining  
	* @Description: 通过用户名模糊查询
	* @param @param username
	* @param @param page
	* @param @return    参数  
	* @return Page<User>    返回类型  
	* @throws
	 */
	public Page<User> findByUsernameContaining(String username,Pageable page);
	/**
	 * 
	* @Title: findByUsername  
	* @Description: 通过用户名精确查询
	* @param @param username
	* @param @return    参数  
	* @return List<User>    返回类型  
	* @throws
	 */
	public List<User> findByUsername(String username);
}
