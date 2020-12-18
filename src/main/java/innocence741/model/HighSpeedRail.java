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
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "HIGHSPEEDRAIL")
public class HighSpeedRail {
	@Id
	@Column(name = "SN_SCHEDULE")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private BigDecimal snSchedule;
	
	@Column(name = "ID_HSR")
	private String idHSR;
	
	@Column(name = "DIRECTION")
	private String direction;
	
	@Column(name = "NANGANG")
	private String nangang;
	
	@Column(name = "TAIPEI")
	private String taipei;
	
	@Column(name = "BANQIAO")
	private String banqiao;
	
	@Column(name = "TAOYUAN")
	private String taoyuan;
	
	@Column(name = "HSINCHU")
	private String hsinchu;
	
	@Column(name = "MIAOLI")
	private String miaoli;
	
	@Column(name = "TAICHUNG")
	private String taichung;
	
	@Column(name = "CHANGHUA")
	private String changhua;
	
	@Column(name = "YUNLIN")
	private String yunlin;
	
	@Column(name = "CHIAYI")
	private String chiayi;
	
	@Column(name = "TAINAN")
	private String tainan;
	
	@Column(name = "ZUOYING")
	private String zuoying;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "highSpeedRail", cascade = CascadeType.ALL)
	@JsonIgnore
	private Set<T_Order_List> t_Order_Lists = new HashSet<T_Order_List>();

	
	
	
	public BigDecimal getSnSchedule() {
		return snSchedule;
	}

	public void setSnSchedule(BigDecimal snSchedule) {
		this.snSchedule = snSchedule;
	}

	public String getIdHSR() {
		return idHSR;
	}

	public void setIdHSR(String idHSR) {
		this.idHSR = idHSR;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getNangang() {
		return nangang;
	}

	public void setNangang(String nangang) {
		this.nangang = nangang;
	}

	public String getTaipei() {
		return taipei;
	}

	public void setTaipei(String taipei) {
		this.taipei = taipei;
	}

	public String getBanqiao() {
		return banqiao;
	}

	public void setBanqiao(String banqiao) {
		this.banqiao = banqiao;
	}

	public String getTaoyuan() {
		return taoyuan;
	}

	public void setTaoyuan(String taoyuan) {
		this.taoyuan = taoyuan;
	}

	public String getHsinchu() {
		return hsinchu;
	}

	public void setHsinchu(String hsinchu) {
		this.hsinchu = hsinchu;
	}

	public String getMiaoli() {
		return miaoli;
	}

	public void setMiaoli(String miaoli) {
		this.miaoli = miaoli;
	}

	public String getTaichung() {
		return taichung;
	}

	public void setTaichung(String taichung) {
		this.taichung = taichung;
	}

	public String getChanghua() {
		return changhua;
	}

	public void setChanghua(String changhua) {
		this.changhua = changhua;
	}

	public String getYunlin() {
		return yunlin;
	}

	public void setYunlin(String yunlin) {
		this.yunlin = yunlin;
	}

	public String getChiayi() {
		return chiayi;
	}

	public void setChiayi(String chiayi) {
		this.chiayi = chiayi;
	}

	public String getTainan() {
		return tainan;
	}

	public void setTainan(String tainan) {
		this.tainan = tainan;
	}

	public String getZuoying() {
		return zuoying;
	}

	public void setZuoying(String zuoying) {
		this.zuoying = zuoying;
	}

	public Set<T_Order_List> getT_Order_Lists() {
		return t_Order_Lists;
	}

	public void setT_Order_Lists(Set<T_Order_List> t_Order_Lists) {
		this.t_Order_Lists = t_Order_Lists;
	}

	public String getArriveTime(String location) {
		if(location.equals("Nangang")) {
			return getNangang();
		}else if(location.equals("Taipei")) {
			return getTaipei();
		}else if (location.equals("Banqiao")) {
			return getBanqiao();
		}else if (location.equals("Taoyuan")) {
			return getTaoyuan();
		}else if (location.equals("Hsinchu")) {
			return getHsinchu();
		}else if (location.equals("Miaoli")) {
			return getMiaoli();
		}else if (location.equals("Taichung")) {
			return getTaichung();
		}else if (location.equals("Changhua")) {
			return getChanghua();
		}else if (location.equals("Yunlin")) {
			return getYunlin();
		}else if (location.equals("Chiayi")) {
			return getChiayi();
		}else if (location.equals("Tainan")) {
			return getTainan();
		}else if (location.equals("Zuoying")) {
			return getZuoying();
		}else {
			return null;
		}
	}
	
	public void setArriveTime(String location) {
		if(location.equals("Nangang")) {
			setNangang(location);
		}else if(location.equals("Taipei")) {
			setTaipei(location);
		}else if (location.equals("Banqiao")) {
			setBanqiao(location);
		}else if (location.equals("Taoyuan")) {
			setTaoyuan(location);
		}else if (location.equals("Hsinchu")) {
			setHsinchu(location);
		}else if (location.equals("Miaoli")) {
			setMiaoli(location);
		}else if (location.equals("Taichung")) {
			setTaichung(location);
		}else if (location.equals("Changhua")) {
			setChanghua(location);
		}else if (location.equals("Yunlin")) {
			setYunlin(location);
		}else if (location.equals("Chiayi")) {
			setChiayi(location);
		}else if (location.equals("Tainan")) {
			setTainan(location);
		}else if (location.equals("Zuoying")) {
			setZuoying(location);
		}
	}

}