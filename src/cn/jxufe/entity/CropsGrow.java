package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: CropsGrow  
* @Description: 作物生长阶段信息实体类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Entity
@Table(name="T_CropsGrow")
public class CropsGrow  extends EntityID{
    private static final long serialVersionUID = 6710754697122731159L;
    private int cId;
    private int growTime;
    private int growStep;
    private String growCaption;
    private int insect;
    private int width;
    private int height;
    private int offsetX;
    private int offsetY;
    private int status;
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getGrowTime() {
		return growTime;
	}
	public void setGrowTime(int growTime) {
		this.growTime = growTime;
	}
	public int getGrowStep() {
		return growStep;
	}
	public void setGrowStep(int growStep) {
		this.growStep = growStep;
	}
	public String getGrowCaption() {
		return growCaption;
	}
	public void setGrowCaption(String growCaption) {
		this.growCaption = growCaption;
	}
	public int getInsect() {
		return insect;
	}
	public void setInsect(int insect) {
		this.insect = insect;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getOffsetX() {
		return offsetX;
	}
	public void setOffsetX(int offsetX) {
		this.offsetX = offsetX;
	}
	public int getOffsetY() {
		return offsetY;
	}
	public void setOffsetY(int offsetY) {
		this.offsetY = offsetY;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}