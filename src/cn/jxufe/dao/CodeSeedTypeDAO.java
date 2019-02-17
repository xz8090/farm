package cn.jxufe.dao;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.CodeSeedType;
/**
 * 
* @ClassName: CodeSeedTypeDAO  
* @Description: 种子类型映射的接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface CodeSeedTypeDAO extends PagingAndSortingRepository<CodeSeedType,Long>{

}
