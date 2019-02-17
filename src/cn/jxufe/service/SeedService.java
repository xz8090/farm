package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Seed;
/**
 * 
* @ClassName: SeedService  
* @Description: 种子清单Service接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface SeedService {
	public EasyUIData<?> findSome(String caption,Pageable page);
	public EasyUIData<?> findAll(Pageable pageable);
	public Message delete(Seed seed);
	public Message save(Seed seed);
}
