package cn.jxufe.service;

import cn.jxufe.entity.CodeSeedType;
/**
 * 
* @ClassName: CodeSeedTypeService  
* @Description: 种子类型映射的Service接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface CodeSeedTypeService {
    public Iterable<CodeSeedType> findALl();
}