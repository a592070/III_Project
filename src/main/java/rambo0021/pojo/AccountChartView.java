package rambo0021.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "ACCOUNTCHARTVIEW")
public class AccountChartView {
	@Id
	@Column(name = "INAME")
	private String iName;
	@Column(name = "COUNT")
	private int count;
	
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
}
