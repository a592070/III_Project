package iring29.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import utils.StringUtil;

@Entity
@Table(name = "SHOW_RVIEW")
public class Show_RView {
	@Id
	@Column(name = "R_SN")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal r_sn;
	@Column(name = "NAME")
	private String name;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name = "REGION")
	private String region;
	@Column(name = "USERNAME")
	private String username;
	@Column(name = "STATUS")
	private String status;

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
		this.address = address;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
