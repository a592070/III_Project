package rambo0021.pojo;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "account")
@DynamicInsert
@DynamicUpdate
public class AccountBean {

	private String userName;
	private String password;
	private int identity;
	private String email;
	private byte[] picture;
	private Date modify_Date;
	private String nickName;
	private Date register;
	private String status;
	
	private IdentityBean identityBean;

	public AccountBean() {

	}
	@Id
	@Column(name = "USERNAME")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Transient
	public int getIdentity() {
		return identity;
	}

	public void setIdentity(int identity) {
		this.identity = identity;
	}

	@Column(name = "EMAIL")
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
		String Date = sdf.format(modify_Date);
		return Date;
	}

	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}

	@Column(name = "NICKNAME")
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
		String Date2 = sdf.format(register);
		return Date2;
	}

	public void setRegister(Date register) {
		this.register = register;
	}

	@Column(name = "PICTURE")
	public byte[] getPicture() {
		return picture;
	}

	@Column(name = "MODIFY_DATE")
	public Date getModify_Date() {
		return modify_Date;
	}

	@Column(name = "REGISTER")
	public Date getRegister() {
		return register;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	
	@Column(name = "STATUS")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "IDENTITY")
	public IdentityBean getIdentityBean() {
		return identityBean;
	}

	public void setIdentityBean(IdentityBean identityBean) {
		this.identityBean = identityBean;
	}

	
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "", cascade = CascadeType.ALL)
//	public List<R_OrderBean> getR_OrderBean() {
//		return r_OrderBean;
//	}
//
//	public void setR_OrderBean(List<R_OrderBean> r_OrderBean) {
//		this.r_OrderBean = r_OrderBean;
//	}
//
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "", cascade = CascadeType.ALL)
//	public List<H_OrderBean> getH_OrderBean() {
//		return h_OrderBean;
//	}
//
//	public void setH_OrderBean(List<H_OrderBean> h_OrderBean) {
//		this.h_OrderBean = h_OrderBean;
//	}
//
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "", cascade = CascadeType.ALL)
//	public List<T_Order_List> getT_Order_List() {
//		return t_Order_List;
//	}
//
//	public void setT_Order_List(List<T_Order_List> t_Order_List) {
//		this.t_Order_List = t_Order_List;
//	}

	
}
