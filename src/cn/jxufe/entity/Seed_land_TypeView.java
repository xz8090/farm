package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: Seed_land_TypeView  
* @Description: 种子、土地类型、种子类型视图表的实体类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Entity
@Table(name="seed_land_TypeView")
public class Seed_land_TypeView  extends EntityID{
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
    private String seedTypeCode;
    private String seedTypeCaption;
    private String landTypeCode;
    private String landTypeCaption;
    private int growTime;
    private int growStep;
    private String growCaption;
    private int insect;
    private int width;
    private int height;
    private int offsetX;
    private int offsetY;
    private int status;
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
	public String getSeedTypeCode() {
		return seedTypeCode;
	}
	public void setSeedTypeCode(String seedTypeCode) {
		this.seedTypeCode = seedTypeCode;
	}
	public String getSeedTypeCaption() {
		return seedTypeCaption;
	}
	public void setSeedTypeCaption(String seedTypeCaption) {
		this.seedTypeCaption = seedTypeCaption;
	}
	public String getLandTypeCode() {
		return landTypeCode;
	}
	public void setLandTypeCode(String landTypeCode) {
		this.landTypeCode = landTypeCode;
	}
	public String getLandTypeCaption() {
		return landTypeCaption;
	}
	public void setLandTypeCaption(String landTypeCaption) {
		this.landTypeCaption = landTypeCaption;
	}
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