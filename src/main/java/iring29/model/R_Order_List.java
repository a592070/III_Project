package iring29.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Table;

import global.pojo.OrderTable;

@Entity
@Table(name = "R_ORDER_LIST")
public class R_Order_List {

	private BigDecimal id;
	private BigDecimal customer_num;;
	private Timestamp bookt_time;
	private BigDecimal deposit;
	private String cus_name;
	private String cus_phpne;
	private OrderTable oTable;
	private Restaurant restaurant;
	
	
	
}
