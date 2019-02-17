package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.ShopView;
/**
 * 
* @ClassName: ShopViewDAO  
* @Description: 种子包裹、用户、种子表合成的视图表接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface ShopViewDAO extends JpaRepository<ShopView, Long>,PagingAndSortingRepository<ShopView,Long>{
	/**
	 * 
	* @Title: findByUsernameContaining  
	* @Description: 用过用户名模糊查询
	* @param @param username
	* @param @param pageable
	* @param @return    参数  
	* @return Page<ShopView>    返回类型  
	* @throws
	 */
	public Page<ShopView> findByUsername(String username,Pageable pageable);
	/**
	 * 
	* @Title: findByUsername  
	* @Description: 通过用户名精确查询
	* @param @param username
	* @param @return    参数  
	* @return List<ShopView>    返回类型  
	* @throws
	 */
	public List<ShopView> findByUsername(String username);
	/**
	 * 
	* @Title: findByCId  
	* @Description: 通过种子cId精确查询
	* @param @param cId
	* @param @return    参数  
	* @return List<ShopView>    返回类型  
	* @throws
	 */
	public List<ShopView> findByCId(int cId);
}
