package cn.jxufe.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.Seed_land_TypeView;
/**
 * 
* @ClassName: Seed_land_TypeViewService  
* @Description: 种子、土地类型、种子类型视图表的Service接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface Seed_land_TypeViewService {
	public EasyUIData<?> findAll(Pageable pageable);
	public Seed_land_TypeView findByCId(int cId);
	public Seed_land_TypeView findByCIdAndGrowStep(int cId,int growStep);
}
