package cn.jxufe.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.Lands;
/**
 * 
* @ClassName: LandsDAO  
* @Description: 用户土地接口 
* @author lbq  
* @date 2018年6月5日  
*
 */
public interface LandsDAO extends JpaRepository<Lands, Long>,PagingAndSortingRepository<Lands,Long>{
	public List<Lands> findByUsername(String username);
}
