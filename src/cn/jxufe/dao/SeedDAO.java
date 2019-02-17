package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.Seed;

/**
 * 
* @ClassName: SeedDAO  
* @Description: 种子清单接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface SeedDAO extends JpaRepository<Seed, Long>,PagingAndSortingRepository<Seed,Long>{
	/**
	 * 
	* @Title: findByCaptionContaining  
	* @Description: 通过种子名称查询种子列表
	* @param @param caption
	* @param @param page
	* @param @return    参数  
	* @return Page<Seed>    返回类型  
	* @throws
	 */
	public Page<Seed> findByCaptionContaining(String caption,Pageable page);
	/**
	 * 
	* @Title: findByCId  
	* @Description: 通过种子cId查询种子列表
	* @param @param cId
	* @param @return    参数  
	* @return List<Seed>    返回类型  
	* @throws
	 */
	public List<Seed> findByCId(int cId);
}
