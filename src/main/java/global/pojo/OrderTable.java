package global.pojo;

import java.math.BigDecimal;
import java.sql.Timestamp;
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
import rambo0021.pojo.AccountBean;

@Entity
@Table(name = "ORDER_TABLE")
public class OrderTable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDER_ID")
	private BigDecimal order_id;
	@Column(name = "ORDER_DATE")
	private Timestamp order_date;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "USERNAME")
	private AccountBean accountBean;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order_table", cascade = CascadeType.ALL)
//	@Transient
	Set<T_Order_List> t_Order_Lists;

	@Transient
	T_Order_List t_Order_List; // 小訂單的Bean (Traffic)

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

	public AccountBean getAccountBean() {
		return accountBean;
	}

	public void setAccountBean(AccountBean accountBean) {
		this.accountBean = accountBean;
	}

}
