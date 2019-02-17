package cn.jxufe.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.LandsView;
/**
 * 
* @ClassName: LandsViewDAO  
* @Description: 种子、土地、作物状态等表合成的视图表接口 
* @author lbq  
* @date 2018年6月5日  
*
 */
public interface LandsViewDAO extends JpaRepository<LandsView, Long>,PagingAndSortingRepository<LandsView,Long>{
	public List<LandsView> findByUsername(String username);
}
