package asx54630.model;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import global.pojo.OrderTable;

@Entity
@Table(name = "H_ORDERLIST_VIEW")
public class HotelOrder_VO {
	
	
	private BigDecimal SN_ORDER;
	
	private BigDecimal ORDER_ID;
	
	private String NAME;
	
	private BigDecimal DOUBLE_ROOM;
	
	private BigDecimal QUADRUPLE_ROOM;
	
	private Date CHECK_IN;
	
	private Date CHECK_OUT;
	
	private String CLIENT_NAME;

	private String CLIENT_PHONE;
	
	private BigDecimal H_PRICE;
	
	private String USERNAME;
	
	public HotelOrder_VO() {
		// TODO Auto-generated constructor stub
	}

	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SN_ORDER")
	public BigDecimal getSN_ORDER() {
		return SN_ORDER;
	}

	public void setSN_ORDER(BigDecimal sN_ORDER) {
		SN_ORDER = sN_ORDER;
	}

	@Column(name = "ORDER_ID")
	public BigDecimal getORDER_ID() {
		return ORDER_ID;
	}

	public void setORDER_ID(BigDecimal oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}

	@Column(name = "NAME")
	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
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

	@Column(name = "CHECK_IN")
	public Date getCHECK_IN() {
		return CHECK_IN;
	}

	public void setCHECK_IN(Date cHECK_IN) {
		CHECK_IN = cHECK_IN;
	}

	@Column(name = "CHECK_OUT")
	public Date getCHECK_OUT() {
		return CHECK_OUT;
	}

	public void setCHECK_OUT(Date cHECK_OUT) {
		CHECK_OUT = cHECK_OUT;
	}

	@Column(name = "CLIENT_NAME")
	public String getCLIENT_NAME() {
		return CLIENT_NAME;
	}

	public void setCLIENT_NAME(String cLIENT_NAME) {
		CLIENT_NAME = cLIENT_NAME;
	}

	@Column(name = "CLIENT_PHONE")
	public String getCLIENT_PHONE() {
		return CLIENT_PHONE;
	}

	public void setCLIENT_PHONE(String cLIENT_PHONE) {
		CLIENT_PHONE = cLIENT_PHONE;
	}

	@Column(name = "H_PRICE")
	public BigDecimal getH_PRICE() {
		return H_PRICE;
	}

	public void setH_PRICE(BigDecimal h_PRICE) {
		H_PRICE = h_PRICE;
	}

	@Column(name = "USERNAME")
	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	
	
	
}
