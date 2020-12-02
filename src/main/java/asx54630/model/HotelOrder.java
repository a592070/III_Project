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

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

import global.pojo.OrderTable;
import iring29.model.Restaurant;

@Entity
@Table(name = "H_ORDER_LIST")
@Component("myH_Order_List")
@DynamicUpdate
public class HotelOrder {
	
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SN_ORDER")
	private BigDecimal SN_ORDER;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORDER_ID")
	private OrderTable orderTable;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORDER_HOTEL_ID")
	private Hotel hotel;
	@Column(name = "DOUBLE_ROOM")
	private BigDecimal DOUBLE_ROOM;
	@Column(name = "QUADRUPLE_ROOM")
	private BigDecimal QUADRUPLE_ROOM;
	@Column(name = "CHECK_IN")
	private Date CHECK_IN;
	@Column(name = "CHECK_OUT")
	private Date CHECK_OUT;
	@Column(name = "CLIENT_NAME")
	private String CLIENT_NAME;
	@Column(name = "CLIENT_PHONE")
	private String CLIENT_PHONE;
	@Column(name = "H_PRICE")
	private BigDecimal H_PRICE;
	

	public HotelOrder() {
		// TODO Auto-generated constructor stub
	}


	public BigDecimal getSN_ORDER() {
		return SN_ORDER;
	}


	public void setSN_ORDER(BigDecimal SN_ORDER) {
		this.SN_ORDER = SN_ORDER;
	}


	public OrderTable getoTable() {
		return orderTable;
	}


	public void setoTable(OrderTable orderTable) {
		this.orderTable = orderTable;
	}


	public Hotel getHotel() {
		return hotel;
	}


	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}


	public BigDecimal getDOUBLE_ROOM() {
		return DOUBLE_ROOM;
	}


	public void setDOUBLE_ROOM(BigDecimal dOUBLE_ROOM) {
		DOUBLE_ROOM = dOUBLE_ROOM;
	}


	public BigDecimal getQUADRUPLE_ROOM() {
		return QUADRUPLE_ROOM;
	}


	public void setQUADRUPLE_ROOM(BigDecimal qUADRUPLE_ROOM) {
		QUADRUPLE_ROOM = qUADRUPLE_ROOM;
	}


	public Date getCHECK_IN() {
		return CHECK_IN;
	}


	public void setCHECK_IN(Date cHECK_IN) {
		CHECK_IN = cHECK_IN;
	}


	public Date getCHECK_OUT() {
		return CHECK_OUT;
	}


	public void setCHECK_OUT(Date cHECK_OUT) {
		CHECK_OUT = cHECK_OUT;
	}


	public String getCLIENT_NAME() {
		return CLIENT_NAME;
	}


	public void setCLIENT_NAME(String cLIENT_NAME) {
		CLIENT_NAME = cLIENT_NAME;
	}


	public String getCLIENT_PHONE() {
		return CLIENT_PHONE;
	}


	public void setCLIENT_PHONE(String cLIENT_PHONE) {
		CLIENT_PHONE = cLIENT_PHONE;
	}


	public BigDecimal getH_PRICE() {
		return H_PRICE;
	}


	public void setH_PRICE(BigDecimal h_PRICE) {
		H_PRICE = h_PRICE;
	}



	
	
}
