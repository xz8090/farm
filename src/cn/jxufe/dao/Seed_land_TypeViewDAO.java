package cn.jxufe.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.Seed_land_TypeView;
/**
 * 
* @ClassName: Seed_land_TypeViewDAO  
* @Description: 种子表，土地类型表，种子类型表合成的视图接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface Seed_land_TypeViewDAO extends JpaRepository<Seed_land_TypeView, Long>,PagingAndSortingRepository<Seed_land_TypeView,Long>{
	public Page<Seed_land_TypeView> findByGrowStep(int growStep,Pageable page);
	public List<Seed_land_TypeView> findByCId(int cId);
	public List<Seed_land_TypeView> findByCIdAndGrowStep(int cId,int growStep);
}
