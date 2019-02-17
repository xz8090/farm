package cn.jxufe.imp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.LandsDAO;
import cn.jxufe.dao.LandsViewDAO;
import cn.jxufe.entity.Lands;
import cn.jxufe.entity.LandsView;
import cn.jxufe.entity.SeedBag;
import cn.jxufe.service.LandsViewService;
/**
 * 
* @ClassName: LandsViewImp  
* @Description: 商店视图实现类 
* @author lbq  
* @date 2018年6月5日  
*
 */
@Service
public class LandsViewImp implements LandsViewService {
	@Autowired
	private LandsViewDAO landsViewDAO;
	@Autowired
	private LandsDAO landsDAO;

	@Override
	public EasyUIData<?> findAll(Pageable pageable) {
		Page<LandsView> page = landsViewDAO.findAll(pageable);
		EasyUIData<LandsView> easyUIData = new EasyUIData<LandsView>();
		easyUIData.setTotal(page.getTotalElements());
		easyUIData.setRows(page.getContent());
		return easyUIData;
	}
	
	@Override
	public Message save(Lands lands) {
		Message message = new Message();
		try {
			landsDAO.save(lands);
			message.setCode(0);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}
	/**
	 * 通过用户名查找土地，没有结果则创建新土地
	 */
	@Override
	public List<LandsView> findByUsername(String username) {
		List<LandsView> landView = landsViewDAO.findByUsername(username);
		//没有记录
		if(landView.size()==0) {
			createLands(username);
		}
		return landsViewDAO.findByUsername(username);
	}
	public int landnum=6;
	public void createLands(String username) {
		Lands lands=new Lands();
		int landCode[]= {0,3,2,5};//普通土地，黑土地，红土地，金土地的code代码
		for(int j=0;j<landCode.length;j++) {
			for(int i=0;i<landnum;i++) {
				try {
					lands.setLandType(landCode[j]);
					lands.setUsername(username);
					landsDAO.save(lands);
				}catch(Exception e) {
					System.out.println("创建新土地失败！");
				}
			}
		}
	}
}
