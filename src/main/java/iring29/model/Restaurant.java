package iring29.model;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import rambo0021.pojo.AccountBean;
import utils.StringUtil;

@Entity
@Table(name = "RESTAURANT")
@DynamicUpdate
public class Restaurant {

	@Id @Column(name = "R_SN")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal r_sn;
	@Column(name = "NAME")
	private String name;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name = "OPENTIME")
	private String opentime;
	@Column(name = "DESCRIPTION")
	private String description;
	@Column(name = "TRANSPORTATION")
	private String transportation;
	@Column(name = "TYPE")
	private String type;
	@Column(name = "RATING")
	private BigDecimal rating;
	@Column(name = "REGION")
	private String region;
	@Column(name = "PIC_URL")
	private String pic_url;
	@Column(name = "SERVICEINFO")
	private String serviceinfo;
	@Column(name = "PIC")
	private byte[] pic;
	@Column(name = "TABLENUM")
	private BigDecimal tablenum;
	@Column(name = "STATUS")
	private String status;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "restaurant", orphanRemoval=true)
	private Set<R_Order_List> rSets = new HashSet<R_Order_List>();
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USERNAME", referencedColumnName="USERNAME")
	private AccountBean accountBean;
	@Column(name = "PRICE")
	private BigDecimal price;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "restaurant", orphanRemoval=true)
	private Set<R_Comment> rcom = new HashSet<R_Comment>();
	
	public BigDecimal getR_sn() {
		return r_sn;
	}

	public void setR_sn(BigDecimal r_sn) {
		this.r_sn = r_sn;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		if(StringUtil.isEmpty(address)) address="暫時不提供資訊";
		this.address = address;
	}

	public String getOpentime() {
		return opentime;
	}

	public void setOpentime(String opentime) {
		if(StringUtil.isEmpty(opentime)) opentime="暫時不提供資訊";
		this.opentime = opentime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		if(StringUtil.isEmpty(description)) description="暫時不提供資訊";
		this.description = description;
	}

	public String getTransportation() {
		return transportation;
	}

	public void setTransportation(String transportation) {
		if(StringUtil.isEmpty(transportation)) transportation="暫時不提供資訊";
		this.transportation = transportation;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		if(StringUtil.isEmpty(type)) type="暫時不提供資訊";
		this.type = type;
	}

	public BigDecimal getRating() {
		return rating;
	}

	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getPic_url() {
		return pic_url;
	}

	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}

	public String getServiceinfo() {
		return serviceinfo;
	}

	public void setServiceinfo(String serviceinfo) {
		if(StringUtil.isEmpty(serviceinfo)) serviceinfo="暫時不提供資訊";
		this.serviceinfo = serviceinfo;
	}

	public byte[] getPic() {
		return pic;
	}

	public void setPic(byte[] pic) {
		this.pic = pic;
	}

	public BigDecimal getTablenum() {
		return tablenum;
	}

	public void setTablenum(BigDecimal tablenum) {
		this.tablenum = tablenum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) { 
		this.status = status;
	}

	public Set<R_Order_List> getrSets() {
		return rSets;
	}

	public void setrSets(Set<R_Order_List> rSets) {
		this.rSets = rSets;
	}
	
	public AccountBean getAccountBean() {
		return accountBean;
	}

	public void setAccountBean(AccountBean accountBean) {
		this.accountBean = accountBean;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Set<R_Comment> getRcom() {
		return rcom;
	}

	public void setRcom(Set<R_Comment> rcom) {
		this.rcom = rcom;
	}
	
	
}
