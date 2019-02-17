package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.dao.Seed_land_TypeViewDAO;
import cn.jxufe.entity.Seed_land_TypeView;
import cn.jxufe.service.Seed_land_TypeViewService;
/**
 * 
* @ClassName: Seed_land_TypeViewImp  
* @Description: 种子、土地类型、种子类型视图表的实现类 
* @author lbq  
* @date 2018年6月1日
* */
@Service
public class Seed_land_TypeViewImp implements Seed_land_TypeViewService {
	@Autowired
	private Seed_land_TypeViewDAO seed_land_TypeViewDAO;
	@Override
	public EasyUIData<?> findAll(Pageable pageable) {
		Page<Seed_land_TypeView> page = seed_land_TypeViewDAO.findByGrowStep(0,pageable);
		EasyUIData<Seed_land_TypeView> easyUIData = new EasyUIData<Seed_land_TypeView>();
		easyUIData.setTotal(page.getTotalElements());
		easyUIData.setRows(page.getContent());
		return easyUIData;
	}
	@Override
	public Seed_land_TypeView findByCId(int cId) {
		Seed_land_TypeView seed_land_TypeView=new Seed_land_TypeView();
		try {
			List<Seed_land_TypeView> Seed_land_TypeViewList=seed_land_TypeViewDAO.findByCId(cId);
			if(Seed_land_TypeViewList.size()>0) seed_land_TypeView=Seed_land_TypeViewList.get(0);
		} catch (Exception e) {
			System.out.println("未找到该种子");
		}
		System.out.println("seed_land_TypeView.getCaption():"+seed_land_TypeView.getCaption());
		return seed_land_TypeView;
	}
	@Override
	public Seed_land_TypeView findByCIdAndGrowStep(int cId, int growStep) {
		Seed_land_TypeView seed_land_TypeView=new Seed_land_TypeView();
		try {
			List<Seed_land_TypeView> seed_land_TypeViewList=seed_land_TypeViewDAO.findByCIdAndGrowStep(cId, growStep);
			if(seed_land_TypeViewList.size()>0) seed_land_TypeView=seed_land_TypeViewList.get(0);
		} catch (Exception e) {
			System.out.println("未找到该种子");
		}
		System.out.println("seed_land_TypeView.getGrowCaption():"+seed_land_TypeView.getGrowCaption());
		return seed_land_TypeView;
	}
}
