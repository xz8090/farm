package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.CropsGrow;
/**
 * 
* @ClassName: CropsGrowDAO  
* @Description: 种子生长阶段接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface CropsGrowDAO extends JpaRepository<CropsGrow, Long>,PagingAndSortingRepository<CropsGrow,Long>{
	/**
	 * 
	* @Title: findByCId  
	* @Description: 通过种子cId查询所有种子生长状态信息
	* @param @param cId
	* @param @param page
	* @param @return    参数  
	* @return Page<CropsGrow>    返回类型  
	* @throws
	 */
	public Page<CropsGrow> findByCId(int cId,Pageable page);
	public List<CropsGrow> findByCIdAndGrowStep(int cId,int growStep);
}
