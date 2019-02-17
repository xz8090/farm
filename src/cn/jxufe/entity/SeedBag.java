package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: SeedBag  
* @Description: 种子包裹实体类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Entity
@Table(name="T_seedBag")
public class SeedBag  extends EntityID{
    private static final long serialVersionUID = 6710754697122731159L;
    private int cId;
    private String username;
    private int num;
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}