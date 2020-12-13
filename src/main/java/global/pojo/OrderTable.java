package global.pojo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;


import innocence741.model.T_Order_List;

import iring29.model.R_Order_List;

import rambo0021.pojo.AccountBean;

@Entity
@Table(name = "ORDER_TABLE")
public class OrderTable {

	@Id@Column(name = "ORDER_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal order_id;
	@Column(name = "ORDER_DATE")
	private Date order_date;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USERNAME")
	private AccountBean accountBean;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "oTable", orphanRemoval=true)
	private Set<R_Order_List> r_Order_Lists;
//	@Transient
//	private R_Order_List r_Order_List;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "order_table", cascade = CascadeType.ALL, orphanRemoval=true)
//	@Transient
	Set<T_Order_List> t_Order_Lists;

	@Transient
	T_Order_List t_Order_List; // 小訂單的Bean (Traffic)

	@Column(name = "TOTAL_PRICE")
	private BigDecimal totalPrice = BigDecimal.ZERO;
	
	public Set<T_Order_List> getT_Order_Lists() {
		return t_Order_Lists;
	}

	public void setT_Order_Lists(Set<T_Order_List> t_Order_Lists) {
		this.t_Order_Lists = t_Order_Lists;
	}

	public T_Order_List getT_Order_List() {
		return t_Order_List;
	}

	public void setT_Order_List(T_Order_List t_Order_List) {
		this.t_Order_List = t_Order_List;
	}

	public void addT_Order_Lists(T_Order_List tBean) {
		this.t_Order_Lists.add(tBean);
	}


	public OrderTable() {
		super();
		r_Order_Lists = new HashSet<R_Order_List>();
		t_Order_Lists = new HashSet<T_Order_List>();
	}
	

	public BigDecimal getOrder_id() {
		return order_id;
	}

	public void setOrder_id(BigDecimal order_id) {
		this.order_id = order_id;
	}

	public Date getOrder_date() {
		return order_date;
	}
	
	@Transient
	public String getOrder_dateString() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		String Date;
		if(order_date == null) {
			Date="未知";
		}else {
			Date = sdf.format(order_date);
		}
		return Date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public AccountBean getAccountBean() {
		return accountBean;
	}

	public void setAccountBean(AccountBean accountBean) {
		this.accountBean = accountBean;
	}

	public Set<R_Order_List> getR_Order_Lists() {
		return r_Order_Lists;
	}

	public void setR_Order_Lists(Set<R_Order_List> r_Order_Lists) {
		this.r_Order_Lists = r_Order_Lists;
	}
	
	public void addR_Order_Lists(R_Order_List rList) {
		rList.setoTable(this);
		this.r_Order_Lists.add(rList);
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	

}
