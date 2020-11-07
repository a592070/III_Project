package azaz4498.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name = "F_COMMENT")
public class Comment implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int comId;
	private String comContent;
	private int comArtId;
	private String comUserId;
	private Timestamp comDate;
	private Article article;
	public Comment() {
		
	}
	
	@Id@Column(name = "COM_ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "COMID_SEQUENCE")
	@SequenceGenerator(name = "COMID_SEQUENCE",sequenceName = "COMID_SEQUENCE", allocationSize = 1)
	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}
	@Column(name = "COM_CONTENT")
	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	@JsonIgnore
	@Transient
	public int getComArtId() {
		return comArtId;
	}

	public void setComArtId(int comArtId) {
		this.comArtId = comArtId;
	}
	@Column(name = "COM_USER_ID")
	public String getComUserId() {
		return comUserId;
	}

	public void setComUserId(String comUserId) {
		this.comUserId = comUserId;
	}
	@Column(name = "COM_DATE")
	public Timestamp getComDate() {
		return comDate;
	}

	public void setComDate(Timestamp comDate) {
		this.comDate = comDate;
	}
	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COM_ART_ID")
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
	
}

