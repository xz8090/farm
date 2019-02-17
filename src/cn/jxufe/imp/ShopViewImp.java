package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.dao.SeedBagDAO;
import cn.jxufe.dao.SeedDAO;
import cn.jxufe.dao.ShopViewDAO;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.Seed;
import cn.jxufe.entity.SeedBag;
import cn.jxufe.entity.ShopView;
import cn.jxufe.entity.User;
import cn.jxufe.service.ShopViewService;
/**
 * 
* @ClassName: ShopViewImp  
* @Description: 商店视图实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Service
public class ShopViewImp implements ShopViewService {
	@Autowired
	private ShopViewDAO shopViewDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private SeedDAO seedDAO;
	@Autowired
	private SeedBagDAO seedBagDAO;
	
	@Override
	public int findMoney(String username) {
		try {
			List<User> userList=userDAO.findByUsername(username);
			System.out.println(userList.size()+","+userList.get(0).getMoney());
			if(userList.size()>0) return userList.get(0).getMoney();
			else return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int findPrice(int cId) {
		try {
			List<Seed> userList=seedDAO.findByCId(cId);
			if(userList.size()>0) return userList.get(0).getPrice();
			else return 0;
		} catch (Exception e) {
			return 0;
		}
	}
		
	@Override
	public EasyUIData<ShopView> findSome(String username,Pageable pageable) {
		Page<ShopView> page = shopViewDAO.findByUsername(username, pageable);
		EasyUIData<ShopView> easyUIData = new EasyUIData<ShopView>();
		easyUIData.setTotal(page.getTotalElements());
		easyUIData.setRows(page.getContent());
		return easyUIData;
	}

	@Override
	public void updateBag(String username, int cId, int addNum) {
		try {
			List<SeedBag> seedBagList=seedBagDAO.findByUsernameAndCId(username, cId);
			SeedBag seedBag=seedBagList.get(0);
			int num=seedBag.getNum();
			System.out.println("种子cId="+cId+"拥有"+num+"种子");
			if(num>0) seedBag.setNum(num+addNum);
			seedBagDAO.save(seedBag);
			System.out.println("更新收纳袋成功！");
		} catch (Exception e) {
			System.out.println("更新收纳袋失败！");
		}
		
	}
}
