package innocence741.model;

import java.math.BigDecimal;
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

import org.springframework.stereotype.Component;

@Entity
@Table(name = "CARTYPE")
public class CarType {

	@Id
	@Column(name = "SN_CARTYPE")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal sn_cartype;

	@Column(name = "CARTYPE")
	private String cartype;

	@Column(name = "PRICE")
	private BigDecimal price;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SN_RENTCARCOMPANY")
	private CarRentalCompany carRentalCompany;

	@Column(name = "PIC_CARTYPE")
	private byte[] pic_cartype;

	@Column(name = "ACCESSIBLE_CARTYPE")
	private int accessible_cartype;

	@Column(name = "CARTYPE_QUANTITY")
	private BigDecimal cartype_quantity;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "carType", cascade = CascadeType.ALL)
	private Set<T_Order_List> t_Order_Lists = new HashSet<T_Order_List>();

	public BigDecimal getSn_cartype() {
		return sn_cartype;
	}

	public void setSn_cartype(BigDecimal sn_cartype) {
		this.sn_cartype = sn_cartype;
	}

	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public CarRentalCompany getCarRentalCompany() {
		return carRentalCompany;
	}

	public void setCarRentalCompany(CarRentalCompany carRentalCompany) {
		this.carRentalCompany = carRentalCompany;
	}

	public byte[] getPic_cartype() {
		return pic_cartype;
	}

	public void setPic_cartype(byte[] pic_cartype) {
		this.pic_cartype = pic_cartype;
	}

	public int getAccessible_cartype() {
		return accessible_cartype;
	}

	public void setAccessible_cartype(int accessible_cartype) {
		this.accessible_cartype = accessible_cartype;
	}

	public BigDecimal getCartype_quantity() {
		return cartype_quantity;
	}

	public void setCartype_quantity(BigDecimal cartype_quantity) {
		this.cartype_quantity = cartype_quantity;
	}

	public Set<T_Order_List> getT_Order_Lists() {
		return t_Order_Lists;
	}

	public void setT_Order_Lists(Set<T_Order_List> t_Order_Lists) {
		this.t_Order_Lists = t_Order_Lists;
	}

}
