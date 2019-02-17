package cn.jxufe.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
/**
 * 
* @ClassName: EntityID  
* @Description: 唯一标识码 
* @author lbq  
* @date 2018年6月1日  
*
 */
@MappedSuperclass
public class EntityID implements Serializable{
	protected static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(nullable = false, updatable = false,columnDefinition="long default 0")
	private long id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	
}
