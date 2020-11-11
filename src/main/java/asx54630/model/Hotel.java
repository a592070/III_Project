package asx54630.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "HOTEL")
@Component("myHotel")
@DynamicUpdate
public class Hotel {

	private BigDecimal SN;
	private String NAME;
	private String REGION;
	private String ADDRESS;
	private String TEL;
	private BigDecimal DOUBLE_ROOM;
	private BigDecimal QUADRUPLE_ROOM;
	private String DESCRIPTION;
	private String OPENTIME;
	private String TYPE;
	private BigDecimal RATING;
	private String ACCOUNT;
	
	
	public Hotel(BigDecimal sn, String name, String region, String address, String tel, BigDecimal dbroom, BigDecimal quadroom, String description, String openTime, String type, BigDecimal rating, String account) {
		this.SN = sn;
		this.NAME = name;
		this.REGION = region;
		this.ADDRESS = address;
		this.TEL = tel;
		this.DOUBLE_ROOM = dbroom;
		this.QUADRUPLE_ROOM = quadroom;
		this.DESCRIPTION = description;
		this.OPENTIME = openTime;
		this.TYPE = type;
		this.RATING = rating;
		this.ACCOUNT = account;
	}
	
	public Hotel() {
		
	}
	
	@Id @Column(name="SN")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	public BigDecimal getSN() {
		return SN;
	}

	public void setSN(BigDecimal sN) {
		SN = sN;
	}

	@Column(name = "NAME")
	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	
	@Column(name = "REGION")
	public String getREGION() {
		return REGION;
	}

	public void setREGION(String rEGION) {
		REGION = rEGION;
	}

	@Column(name = "ADDRESS")
	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	@Column(name = "TEL")
	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	@Column(name = "DOUBLE_ROOM")
	public BigDecimal getDOUBLE_ROOM() {
		return DOUBLE_ROOM;
	}

	public void setDOUBLE_ROOM(BigDecimal dOUBLE_ROOM) {
		DOUBLE_ROOM = dOUBLE_ROOM;
	}

	@Column(name = "QUADRUPLE_ROOM")
	public BigDecimal getQUADRUPLE_ROOM() {
		return QUADRUPLE_ROOM;
	}

	public void setQUADRUPLE_ROOM(BigDecimal qUADRUPLE_ROOM) {
		QUADRUPLE_ROOM = qUADRUPLE_ROOM;
	}

	@Column(name = "DESCRIPTION")
	public String getDESCRIPTION() {
		return DESCRIPTION;
	}

	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

	@Column(name = "OPENTIME")
	public String getOPENTIME() {
		return OPENTIME;
	}

	public void setOPENTIME(String oPENTIME) {
		OPENTIME = oPENTIME;
	}

	@Column(name = "TYPE")
	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	@Column(name = "RATING")
	public BigDecimal getRATING() {
		return RATING;
	}

	public void setRATING(BigDecimal rATING) {
		RATING = rATING;
	}

	@Column(name = "ACCOUNT")
	public String getACCOUNT() {
		return ACCOUNT;
	}

	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}


}
