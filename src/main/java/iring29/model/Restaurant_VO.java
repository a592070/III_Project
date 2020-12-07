package iring29.model;

import java.math.BigDecimal;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "RESTAURANTVIEW")
public class Restaurant_VO {

	@Id
	@Column(name = "R_SN")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal r_sn;
	@Column(name = "NAME")
	private String name;
	@Column(name = "TYPE")
	private String type;
	@Column(name = "RATING")
	private BigDecimal rating;
	@Column(name = "REGION")
	private String region;
	@Column(name = "PIC")
	private byte[] pic;
	@Column(name = "STATUS")
	private String statu;
	@Column(name = "PRICE")
	private BigDecimal price;

	public BigDecimal getR_sn() {
		return r_sn;
	}

	public void setR_sn(BigDecimal r_sn) {
		this.r_sn = r_sn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BigDecimal getRating() {
		return rating;
	}

	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public byte[] getPic() {
		return pic;
	}

	public void setPic(byte[] pic) {
		this.pic = pic;
	}

	public String getStatu() {
		return statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	

}
