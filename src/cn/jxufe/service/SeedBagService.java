package cn.jxufe.service;


import cn.jxufe.bean.Message;
import cn.jxufe.entity.SeedBag;
/**
 * 
* @ClassName: SeedBagService  
* @Description: 种子包裹Service接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface SeedBagService {
	public Message delete(SeedBag seedBag);
	public Message save(SeedBag seedBag);
	public Message update(SeedBag seedBag);
	public int findByUsernameAndCId(String username,int cId);
}
