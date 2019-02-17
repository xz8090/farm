package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: Seed  
* @Description: 种子清单实体类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Entity
@Table(name="T_Seed")
public class Seed  extends EntityID{
    private static final long serialVersionUID = 6710754697122731159L;
    private int cId;
    private String caption;
    private int harvestNum;
    private int cropLevel;
    private int type;
    private int exp;
    private int matureTime;
    private int output;
    private int price;
    private int price4UnitSale;
    private int landRequirement;
    private int score;
    private String tip;
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public int getHarvestNum() {
		return harvestNum;
	}
	public void setHarvestNum(int harvestNum) {
		this.harvestNum = harvestNum;
	}
	public int getCropLevel() {
		return cropLevel;
	}
	public void setCropLevel(int cropLevel) {
		this.cropLevel = cropLevel;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public int getMatureTime() {
		return matureTime;
	}
	public void setMatureTime(int matureTime) {
		this.matureTime = matureTime;
	}
	public int getOutput() {
		return output;
	}
	public void setOutput(int output) {
		this.output = output;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice4UnitSale() {
		return price4UnitSale;
	}
	public void setPrice4UnitSale(int price4UnitSale) {
		this.price4UnitSale = price4UnitSale;
	}
	public int getLandRequirement() {
		return landRequirement;
	}
	public void setLandRequirement(int landRequirement) {
		this.landRequirement = landRequirement;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
}