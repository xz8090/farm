package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
/**
 * 
* @ClassName: ShopViewService  
* @Description: 商店视图Service接口  
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface ShopViewService {
	public int findMoney(String username);
	public int findPrice(int cId);
	public EasyUIData<?> findSome(String username,Pageable page);
	public void updateBag(String username,int cId,int addNum);
}
