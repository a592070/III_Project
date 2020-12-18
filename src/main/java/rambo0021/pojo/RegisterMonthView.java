package rambo0021.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "REGISTERMONTHVIEW")
public class RegisterMonthView {
	@Id
	@Column(name = "MONTH")
	private int month;
	@Column(name = "COUNT")
	private int count;
	@Transient
	private String monthString;
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getMonthString() {
		if(month==1) {
			return "一月";
		}
		if(month==2) {
			return "二月";
		}
		if(month==3) {
			return "三月";
		}
		if(month==4) {
			return "四月";
		}
		if(month==5) {
			return "五月";
		}
		if(month==6) {
			return "六月";
		}
		if(month==7) {
			return "七月";
		}
		if(month==8) {
			return "八月";
		}
		if(month==9) {
			return "九月";
		}
		if(month==10) {
			return "十月";
		}
		if(month==11) {
			return "十一月";
		}
		if(month==12) {
			return "十二月";
		}
		return "";
	}
	
}
