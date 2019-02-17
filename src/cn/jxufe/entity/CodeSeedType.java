package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: CodeSeedType  
* @Description: 种子类型映射的实体类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Entity
@Table(name="T_CodeSeedType")
public class CodeSeedType  extends EntityID{
    private static final long serialVersionUID = 6710754697122731159L;
    private String code;
    private String caption;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
}