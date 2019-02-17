package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.CropsGrowDAO;
import cn.jxufe.entity.CropsGrow;
import cn.jxufe.entity.Seed_land_TypeView;
import cn.jxufe.service.CropsGrowService;
/**
 * 
* @ClassName: CropsGrowImp  
* @Description: 作物生长阶段信息实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Service
public class CropsGrowImp implements CropsGrowService {
	@Autowired
	private CropsGrowDAO cropsGrowDAO;

	@Override
	public EasyUIData<CropsGrow> findSome(int cId,Pageable pageable) {
        Page<CropsGrow> page = cropsGrowDAO.findByCId(cId,pageable);
        EasyUIData<CropsGrow> easyUIData = new EasyUIData<CropsGrow>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
    }
	@Override
	public EasyUIData<?> findAll(Pageable pageable) {
		Page<CropsGrow> page = cropsGrowDAO.findAll(pageable);
		EasyUIData<CropsGrow> easyUIData = new EasyUIData<CropsGrow>();
		easyUIData.setTotal(page.getTotalElements());
		easyUIData.setRows(page.getContent());
		return easyUIData;
	}

	@Override
	public Message delete(CropsGrow cropsGrow) {
		Message message = new Message();
		try {
			cropsGrowDAO.delete(cropsGrow);
			message.setCode(0);
			message.setMsg("删除成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("删除失败");
		}
		return message;
	}

	@Override
	public Message save(CropsGrow cropsGrow) {
		Message message = new Message();
		try {
			cropsGrowDAO.save(cropsGrow);
			message.setCode(0);
			message.setMsg("保存成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}
	@Override
	public CropsGrow findByCIdAndGrowStep(int cId, int growStep) {
		CropsGrow cropsGrow=new CropsGrow();
		try {
			List<CropsGrow> cropsGrowList=cropsGrowDAO.findByCIdAndGrowStep(cId, growStep);
			if(cropsGrowList.size()>0) cropsGrow=cropsGrowList.get(0);
		} catch (Exception e) {
			System.out.println("未找到该种子");
		}
		System.out.println("cropsGrow.getGrowCaption():"+cropsGrow.getGrowCaption());
		return cropsGrow;
	}
}
