package cn.jxufe.service;

import cn.jxufe.entity.CodeCropStatus;
/**
 * 
* @ClassName: CodeCropStatusService  
* @Description: 种子生长阶段映射的Service接口 
* @author lbq  
* @date 2018年6月1日  
*
 */
public interface CodeCropStatusService {
    public Iterable<CodeCropStatus> findALl();
}