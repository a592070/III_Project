package innocence741.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
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
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import innocence741.model.T_Order_List;
import rambo0021.pojo.AccountBean;

//大訂單的Bean
@Entity
@Table(name="ORDER_TABLE")
public class OrderTableBean {

	@Id
	@Column(name = "ORDER_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	BigDecimal order_id; // PK

	@Column(name = "ORDER_DATE")
	Timestamp order_date; // 下訂單時間，default

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USERNAME")//還沒註冊
	AccountBean user; // Account資料


//	Set<R_OrderBean> r_OrderBeans;
//	R_OrderBean r_OdrerBean; // 小訂單的Bean (Restaurant)

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order_table", cascade = CascadeType.ALL)
	Set<T_Order_List> t_Order_Lists;
//	@Transient
//	T_Order_List t_Order_List;  //小訂單的Bean (Traffic)
//	H_OrderBean h_OderBean; // 小訂單的Bean (hotel)
//	Set<H_OrderBean> h_OrderBeans;

	public OrderTableBean() {
		super();
//		r_OrderBeans = new HashSet<R_OrderBean>();
		t_Order_Lists = new HashSet<T_Order_List>();

	}
	
	public BigDecimal getOrder_id() {
		return order_id;
	}

	public void setOrder_id(BigDecimal order_id) {
		this.order_id = order_id;
	}


	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public AccountBean getUser() {
		return user;
	}

	public void setUser(AccountBean user) {
		this.user = user;
	}

//	public String getCustomerName() {
//		return customerName;
//	}
//
//	public void setCustomerName(String customerName) {
//		this.customerName = customerName;
//	}
//
//	public String getCustomerPhone() {
//		return customerPhone;
//	}
//
//	public void setCustomerPhone(String customerPhone) {
//		this.customerPhone = customerPhone;
//	}

//	public Set<R_OrderBean> getR_OderBeans() {
//		return r_OrderBeans;
//	}
//	
//
//
//	public void setR_OderBeans(Set<R_OrderBean> r_OderBeans) {
//		this.r_OrderBeans = r_OderBeans;
//	}
//
//	public void addR_OderBean(R_OrderBean rBean) {
//		this.r_OrderBeans.add(rBean);
//	}

	

//	public Set<H_OrderBean> getH_OrderBeans() {
//		return h_OrderBeans;
//	}
//
//	public void setH_OrderBeans(Set<H_OrderBean> h_OrderBeans) {
//		this.h_OrderBeans = h_OrderBeans;
//	}
//
//	public void addH_OrderBean(H_OrderBean hBean) {
//		this.h_OrderBeans.add(hBean);
//	}
//	

	public Set<T_Order_List> getT_Order_Lists() {
		return t_Order_Lists;
	}

	public void setT_Order_Lists(Set<T_Order_List> t_OrderBeans) {
		this.t_Order_Lists = t_OrderBeans;
	}

	public void addT_Order_Lists(T_Order_List tBean) {
		this.t_Order_Lists.add(tBean);
	}

}
