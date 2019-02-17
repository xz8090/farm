package cn.jxufe.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Lands;
import cn.jxufe.entity.LandsView;
/**
 * 
* @ClassName: LandsViewService  
* @Description: 土地视图Service接口  
* @author lbq  
* @date 2018年6月5日  
*
 */
public interface LandsViewService {
	public List<LandsView> findByUsername(String username);
	public Message save(Lands lands);
	public EasyUIData<?> findAll(Pageable page);
}
