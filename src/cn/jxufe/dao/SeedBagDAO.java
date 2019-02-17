package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.SeedBag;

/**
 * 
* @ClassName: SeedBagDAO  
* @Description: 种子包裹接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface SeedBagDAO extends JpaRepository<SeedBag, Long>,PagingAndSortingRepository<SeedBag,Long>{
	/**
	 * 
	* @Title: findByUsernameAndCId  
	* @Description: 通过用户名username和种子cId查找该用户拥有的种子数量
	* @param @param username
	* @param @param cId
	* @param @return    参数  
	* @return List<SeedBag>    返回类型  
	* @throws
	 */
	public List<SeedBag> findByUsernameAndCId(String username,int cId);
}
