package global.pojo;

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
