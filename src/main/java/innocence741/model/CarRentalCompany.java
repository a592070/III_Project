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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "CARRENTALCOMPANY")
public class CarRentalCompany {

	@Id
	@Column(name = "SN_RENTALCOMPANY")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal sn_rentalcompany;

	@Column(name = "NAME_COMPANY")
	private String name_company;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "OPENHOURS")
	private String oprnHours;

	@Column(name = "TEL")
	private String tel;

	@Column(name = "COMPANY_ACCOUNT")
	private String compantAccount;

	@Column(name = "PIC_RENTALCOMPANY")
	private byte[] pic_rentalcompany;

	@Column(name = "ACCESSIBLE_CARRENTALCOMPANY")
	private int accessible_carrentalcompany;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "carRentalCompany", cascade = CascadeType.ALL)
	private Set<CarType> carTypes = new HashSet<CarType>();

	public BigDecimal getSn_rentalcompany() {
		return sn_rentalcompany;
	}

	public void setSn_rentalcompany(BigDecimal sn_rentalcompany) {
		this.sn_rentalcompany = sn_rentalcompany;
	}

	public String getName_company() {
		return name_company;
	}

	public void setName_company(String name_company) {
		this.name_company = name_company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOprnHours() {
		return oprnHours;
	}

	public void setOprnHours(String oprnHours) {
		this.oprnHours = oprnHours;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCompantAccount() {
		return compantAccount;
	}

	public void setCompantAccount(String compantAccount) {
		this.compantAccount = compantAccount;
	}

	public byte[] getPic_rentalcompany() {
		return pic_rentalcompany;
	}

	public void setPic_rentalcompany(byte[] pic_rentalcompany) {
		this.pic_rentalcompany = pic_rentalcompany;
	}

	public int getAccessible_carrentalcompany() {
		return accessible_carrentalcompany;
	}

	public void setAccessible_carrentalcompany(int accessible_carrentalcompany) {
		this.accessible_carrentalcompany = accessible_carrentalcompany;
	}

	public Set<CarType> getCarTypes() {
		return carTypes;
	}

	public void setCarTypes(Set<CarType> carTypes) {
		this.carTypes = carTypes;
	}

}