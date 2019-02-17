package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.CodeLandRequireDAO;
import cn.jxufe.entity.CodeLandRequire;
import cn.jxufe.service.CodeLandRequireService;
/**
 * 
* @ClassName: CodeLandRequireImp  
* @Description: 土地类型映射的实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Service
public class CodeLandRequireImp implements CodeLandRequireService{
	@Autowired
	CodeLandRequireDAO codeLandRequireDAO;
    @Override
    public Iterable<CodeLandRequire> findALl() {
        return codeLandRequireDAO.findAll();
    }
}
