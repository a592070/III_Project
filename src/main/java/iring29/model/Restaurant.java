package iring29.model;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import utils.StringUtil;

@Entity
@Table(name = "RESTAURANT")
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
//	private ACCOUNT account;
//	private Set<R_OrderBean> r_OrderBeans = new HashSet<R_OrderBean>();
	
	
	
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Restaurant [r_sn=");
		builder.append(r_sn);
		builder.append(", name=");
		builder.append(name);
		builder.append(", address=");
		builder.append(address);
		builder.append(", opentime=");
		builder.append(opentime);
		builder.append(", description=");
		builder.append(description);
		builder.append(", transportation=");
		builder.append(transportation);
		builder.append(", type=");
		builder.append(type);
		builder.append(", rating=");
		builder.append(rating);
		builder.append(", region=");
		builder.append(region);
		builder.append(", pic_url=");
		builder.append(pic_url);
		builder.append(", serviceinfo=");
		builder.append(serviceinfo);
		builder.append(", pic=");
		builder.append(Arrays.toString(pic));
		builder.append(", tablenum=");
		builder.append(tablenum);
		builder.append(", status=");
		builder.append(status);
		builder.append("]");
		return builder.toString();
	}
	
	

}
