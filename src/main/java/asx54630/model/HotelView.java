package asx54630.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "H_VIEW")
public class HotelView {

	private BigDecimal SN;
	private String NAME;
	private String REGION;
	private String ADDRESS;
	private String TYPE;
	private String STATUS;
	
	public HotelView() {
		
	}

	@Id @Column(name="SN")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	public BigDecimal getSN() {
		return SN;
	}

	public void setSN(BigDecimal sN) {
		SN = sN;
	}

	@Column(name = "NAME")
	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	@Column(name = "REGION")
	public String getREGION() {
		return REGION;
	}

	public void setREGION(String rEGION) {
		REGION = rEGION;
	}

	@Column(name = "ADDRESS")
	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	@Column(name = "TYPE")
	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	@Column(name = "STATUS")
	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	
	
	
}
