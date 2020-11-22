package rambo0021.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name = "ACCOUNTLISTVIEW")
public class AccountListViewBean {
	@Id
	@Column(name = "USERNAME")
	private String userName;
	@Column(name = "INAME")
	private String iName;
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "REGISTER")
	private Date register;
	@Column(name = "MODIFY_DATE")
	private Date modify_Date;
	@Column(name = "STATUS")
	private String status;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegister() {
		return register;
	}
	public void setRegister(Date register) {
		this.register = register;
	}
	public Date getModify_Date() {
		return modify_Date;
	}
	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Transient
	public String getRegisterString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setLenient(false);
		String Date2;
		if(modify_Date ==null) {
			Date2="未知";
		}else {
			Date2 = sdf.format(modify_Date);
		}
		return Date2;
	}
	@Transient
	public String getModify_DateString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setLenient(false);
		String Date;
		if(modify_Date ==null) {
			Date="未知";
		}else {
			Date = sdf.format(modify_Date);
		}
		return Date;
	}
	
}
