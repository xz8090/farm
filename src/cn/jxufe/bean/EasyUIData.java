package cn.jxufe.bean;

import java.util.ArrayList;
import java.util.List;
/**
 * 
* @ClassName: EasyUIData  
* @Description: 前台分页数据辅助类 
* @author lbq  
* @date 2018年6月1日  
*  
* @param <T>
 */
public class EasyUIData<T> {
	private long total = 0L;
	private List<T> rows = new ArrayList<T>();
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
}
