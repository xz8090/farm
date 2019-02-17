package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.CodeCropStatusDAO;
import cn.jxufe.entity.CodeCropStatus;
import cn.jxufe.service.CodeCropStatusService;
/**
 * 
* @ClassName: CodeCropStatusImp  
* @Description: 种子生长阶段映射的实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Service
public class CodeCropStatusImp implements CodeCropStatusService{
	@Autowired
	CodeCropStatusDAO codeCropStatusDAO;
    @Override
    public Iterable<CodeCropStatus> findALl() {
        return codeCropStatusDAO.findAll();
    }
}
