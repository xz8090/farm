package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * 
* @ClassName: ShopView  
* @Description: 商店视图实现类 
* @author lbq  
* @date 2018年6月1日  
*
 */
@Entity
@Table(name="ShopView")
public class ShopView  extends EntityID{
    private static final long serialVersionUID = 6710754697122731159L;
    private int cId;
    private String username;
    private int num;
    private String nickname;
    private int userExp;
    private int userScore;
	private int money;
	private String headimg;
    private String caption;
    private int harvestNum;
    private int cropLevel;
    private int type;
    private int seedExp;
    private int matureTime;
    private int output;
    private int price;
    private int price4UnitSale;
    private int landRequirement;
    private int seedScore;
    private String tip;
    private String seedTypeCode;
    private String seedTypeCaption;
    private String landTypeCode;
    private String landTypeCaption;
    private int growTime;
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
	public void setUserExp(int userExp) {
		this.userExp = userExp;
	}
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getUserExp() {
		return userExp;
	}
	public void setUserEexp(int userExp) {
		this.userExp = userExp;
	}
	public int getUserScore() {
		return userScore;
	}
	public void setUserScore(int userScore) {
		this.userScore = userScore;
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
	public int getSeedExp() {
		return seedExp;
	}
	public void setSeedExp(int seedExp) {
		this.seedExp = seedExp;
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
	public int getSeedScore() {
		return seedScore;
	}
	public void setSeedScore(int seedScore) {
		this.seedScore = seedScore;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
}