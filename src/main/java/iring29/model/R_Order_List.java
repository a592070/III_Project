package iring29.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

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

//@Entity
//@Table(name = "R_ORDER_LIST")
public class R_Order_List {

	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private BigDecimal id;
	@Column(name = "CUSTOMER_NUM")
	private BigDecimal customer_num;
	@Column(name = "BOOK_TIME")
	private Timestamp bookt_time;
	@Column(name = "DEPOSIT")
	private BigDecimal deposit;
	@Column(name = "CUS_NAME")
	private String cus_name;
	@Column(name = "CUS_PHONE")
	private String cus_phpne;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ORDER_ID")
	private OrderTable oTable;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "R_SN")
	private Restaurant restaurant;
	
	public BigDecimal getId() {
		return id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	public BigDecimal getCustomer_num() {
		return customer_num;
	}

	public void setCustomer_num(BigDecimal customer_num) {
		this.customer_num = customer_num;
	}

	public Timestamp getBookt_time() {
		return bookt_time;
	}

	public void setBookt_time(Timestamp bookt_time) {
		this.bookt_time = bookt_time;
	}

	public BigDecimal getDeposit() {
		return deposit;
	}

	public void setDeposit(BigDecimal deposit) {
		this.deposit = deposit;
	}

	public String getCus_name() {
		return cus_name;
	}

	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getCus_phpne() {
		return cus_phpne;
	}

	public void setCus_phpne(String cus_phpne) {
		this.cus_phpne = cus_phpne;
	}

	public OrderTable getoTable() {
		return oTable;
	}

	public void setoTable(OrderTable oTable) {
		this.oTable = oTable;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

}
