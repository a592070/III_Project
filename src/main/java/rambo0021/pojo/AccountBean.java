package rambo0021.pojo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import global.pojo.OrderTable;
import iring29.model.Restaurant;
import utils.StringUtil;



@Entity
@Table(name = "account")
@DynamicInsert
@DynamicUpdate
public class AccountBean {
	@Id
	@Column(name = "USERNAME")
	private String userName;
	@Column(name = "PASSWORD")
	private String password;
	@Column(name = "EMAIL")
	private String email;
	@Lob 
	@Basic(fetch = FetchType.LAZY)
	@Column(name = "PICTURE")
	private byte[] picture;
	@Column(name = "MODIFY_DATE")
	private Date modify_Date;
	@Column(name = "NICKNAME")
	private String nickName;
	@Column(name = "REGISTER")
	private Date register;
	@Column(name = "STATUS")
	private String status;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "IDENTITY")
	private IdentityBean identityBean;
    
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "accountBean", orphanRemoval=true)
	private List<OrderTable> orderTable = new ArrayList<OrderTable>();// 大訂單 
	
	@OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL, mappedBy = "accountBean")
    private Restaurant restaurant;	

	public AccountBean() {

	}
	

	public AccountBean(String userName, String password, String email, byte[] picture, Date modify_Date,
			String nickName, Date register, String status) {
		super();
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.picture = picture;
		this.modify_Date = modify_Date;
		this.nickName = nickName;
		this.register = register;
		this.status = status;
	}


	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Transient
	public String getRegisterString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setLenient(false);
		String Date2;
		if(modify_Date ==null) {
			Date2="未知";
		}else {
			Date2 = sdf.format(register);
		}
		return Date2;
	}

	public void setRegister(Date register) {
		this.register = register;
	}

	public byte[] getPicture() {
		return picture;
	}

	public Date getModify_Date() {
		return modify_Date;
	}

	public Date getRegister() {
		return register;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public IdentityBean getIdentityBean() {
		return identityBean;
	}

	public void setIdentityBean(IdentityBean identityBean) {
		this.identityBean = identityBean;
	}

	public List<OrderTable> getOrderTable() {
		return orderTable;
	}

	public void setOrderTable(List<OrderTable> orderTable) {
		this.orderTable = orderTable;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}
	
	
	
}
