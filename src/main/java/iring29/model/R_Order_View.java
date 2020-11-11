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
@Table(name = "R_ORDER_VIEW")
public class R_Order_View {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private BigDecimal id;

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

	@Column(name = "ORDER_ID")
	private BigDecimal order_id;
	@Column(name = "BOOK_TIME")
	private Timestamp bookt_time;
	@Column(name = "CUSTOMER_NUM")
	private BigDecimal customer_num;
	@Column(name = "NAME")
	private String name;

	public Timestamp getBookt_time() {
		return bookt_time;
	}

	public void setBookt_time(Timestamp bookt_time) {
		this.bookt_time = bookt_time;
	}

	public BigDecimal getCustomer_num() {
		return customer_num;
	}

	public void setCustomer_num(BigDecimal customer_num) {
		this.customer_num = customer_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
