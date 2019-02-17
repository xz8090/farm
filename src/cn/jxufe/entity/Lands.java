package cn.jxufe.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: Lands  
* @Description: 用户土地实体类 
* @author lbq  
* @date 2018年6月5日  
*
 */
@Entity
@Table(name="T_Lands")
public class Lands  extends EntityID{
    private static final long serialVersionUID = 6710754697122731159L;
    private int landType;
    private String username;
    private int cId;
    private int growStep;//生长阶段
    private int haspest;
    private String startTime;
    private int residueNum;//剩余季度
    private int status;//是否可操作
	public int getLandType() {
		return landType;
	}
	public void setLandType(int landType) {
		this.landType = landType;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getGrowStep() {
		return growStep;
	}
	public void setGrowStep(int growStep) {
		this.growStep = growStep;
	}
	public int getHaspest() {
		return haspest;
	}
	public void setHaspest(int haspest) {
		this.haspest = haspest;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getResidueNum() {
		return residueNum;
	}
	public void setResidueNum(int residueNum) {
		this.residueNum = residueNum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}