package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.CodeSeedTypeDAO;
import cn.jxufe.entity.CodeSeedType;
import cn.jxufe.service.CodeSeedTypeService;
/**
 * 
* @ClassName: CodeSeedTypeImp  
* @Description: 种子类型映射的实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Service
public class CodeSeedTypeImp implements CodeSeedTypeService{
	@Autowired
	CodeSeedTypeDAO codeSeedTypeDAO;
    @Override
    public Iterable<CodeSeedType> findALl() {
        return codeSeedTypeDAO.findAll();
    }
}
