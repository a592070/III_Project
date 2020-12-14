package iring29.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "R_ORDERLIST_VIEW")
public class R_OrderList_VO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private BigDecimal id;
	@Column(name = "ORDER_ID")
	private BigDecimal order_id;
	@Column(name = "NAME")
	private String name;
	@Column(name = "BOOK_TIME")
	private Timestamp book_time;
	@Column(name = "CUSTOMER_NUM")
	private BigDecimal customer_num;
	@Column(name = "CUS_NAME")
	private String cus_name;
	@Column(name = "CUS_PHONE")
	private String cus_phone;
	@Column(name = "DEPOSIT")
	private BigDecimal deposit;
	@Column(name = "ORDER_DATE")
	private Timestamp order_date;
	@Column(name = "USERNAME")
	private String username;
	@Column(name = "EMAIL")
	private String email;

	public BigDecimal getId() {
		return id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	public BigDecimal getOrder_id() {
		return order_id;
	}

	public void setOrder_id(BigDecimal order_id) {
		this.order_id = order_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getBook_time() {
		return book_time;
	}

	public void setBook_time(Timestamp book_time) {
		this.book_time = book_time;
	}

	public BigDecimal getCustomer_num() {
		return customer_num;
	}

	public void setCustomer_num(BigDecimal customer_num) {
		this.customer_num = customer_num;
	}

	public String getCus_name() {
		return cus_name;
	}

	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getCus_phone() {
		return cus_phone;
	}

	public void setCus_phone(String cus_phone) {
		this.cus_phone = cus_phone;
	}

	public BigDecimal getDeposit() {
		return deposit;
	}

	public void setDeposit(BigDecimal deposit) {
		this.deposit = deposit;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}
