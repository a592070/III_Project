package iring29.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import rambo0021.pojo.AccountBean;

@Entity
@Table(name = "R_COMMENT")
public class R_Comment {

	@Id
	@Column(name = "COM_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal com_id;
	@Column(name = "COM_CONTENT")
	private String com_content;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "R_SN")
	private Restaurant restaurant;
	
	@Column(name = "COM_USER_ID")
	private String username;
	
	@Column(name = "COM_DATE")
	private Date com_date;
	@Column(name = "RATING")
	private BigDecimal rating;

	public BigDecimal getCom_id() {
		return com_id;
	}

	public void setCom_id(BigDecimal com_id) {
		this.com_id = com_id;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public BigDecimal getRating() {
		return rating;
	}

	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}

	public Date getCom_date() {
		return com_date;
	}

	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}

	@Transient
	public String getCom_dateString() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setLenient(false);
		String Date;
		if(com_date ==null) {
			Date="未知";
		}else {
			Date = sdf.format(com_date);
		}
		return Date;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	
}
