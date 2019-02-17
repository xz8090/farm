package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.CropsGrow;
/**
 * 
* @ClassName: CropsGrowService  
* @Description: 作物生长阶段信息Service接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface CropsGrowService {
	public EasyUIData<?> findSome(int cId,Pageable pageable);
	public EasyUIData<?> findAll(Pageable pageable);
	public Message delete(CropsGrow cropsGrow);
	public Message save(CropsGrow cropsGrow);
	public CropsGrow findByCIdAndGrowStep(int cId,int growStep);
}
