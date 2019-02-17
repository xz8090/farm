package cn.jxufe.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: LandsView  
* @Description: 用户土地视图实体类 
* @author lbq  
* @date 2018年6月5日  
*
 */
@Entity
@Table(name="LandsView")
public class LandsView  extends EntityID{
    private static final long serialVersionUID = 6710754697122731159L;
    private int landType;
    private String username;
    private int cId;
    private int growStep;
    private int haspest;
    private String startTime;
    private int residueNum;
    private int status;
    private String landCaption;
    private String nickname;
    private int exp;
    private int score;
	private int money;
	private String headimg;
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
	public String getLandCaption() {
		return landCaption;
	}
	public void setLandCaption(String landCaption) {
		this.landCaption = landCaption;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getHeadimg() {
		return headimg;
	}
	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
	
}