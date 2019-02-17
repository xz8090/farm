package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.SeedBagDAO;
import cn.jxufe.entity.SeedBag;
import cn.jxufe.service.SeedBagService;
/**
 * 
* @ClassName: SeedBagImp  
* @Description: 种子包裹实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Service
public class SeedBagImp implements SeedBagService {
	@Autowired
	private SeedBagDAO seedBagDAO;
	
	@Override
	public Message delete(SeedBag seedBag) {
		Message message = new Message();
		try {
			seedBagDAO.delete(seedBag);
			message.setCode(0);
			message.setMsg("删除成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("删除失败");
		}
		return message;
	}

	@Override
	public Message save(SeedBag seedBag) {
		Message message = new Message();
		try {
			seedBagDAO.save(seedBag);
			message.setCode(0);
			message.setMsg("购买成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("购买失败");
		}
		return message;
	}

	@Override
	public int findByUsernameAndCId(String username, int cId) {
		try {
			List<SeedBag> seedBagList = seedBagDAO.findByUsernameAndCId(username, cId);
			System.out.println(username+"背包中的"+cId+"数量是："+seedBagList.size());
			if(seedBagList.size()>0) return seedBagList.get(0).getNum();
			else return 0;
		} catch (Exception e) {
			System.out.println("查询包裹失败！");
			return 0;
		}
	}

	/**
	 * 如果数据库有数据，更新种子收纳袋
	 */
	@Override
	public Message update(SeedBag seedBag) {
		Message message = new Message();
		try {
			List<SeedBag> seedBagList = seedBagDAO.findByUsernameAndCId(seedBag.getUsername(), seedBag.getcId());
			long id=0;
			if(seedBagList.size()>0) id=seedBagList.get(0).getId();
			seedBag.setId(id);
			seedBagDAO.save(seedBag);
			message.setCode(0);
			message.setMsg("购买成功");
		} catch (Exception e) {
			message.setCode(-10);
			message.setMsg("购买失败");
		}
		return message;
	}
}
