package cn.jxufe.dao;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.CodeCropStatus;
/**
 * 
* @ClassName: CodeCropStatusDAO  
* @Description: 作物状态映射的接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface CodeCropStatusDAO extends PagingAndSortingRepository<CodeCropStatus,Long>{

}
