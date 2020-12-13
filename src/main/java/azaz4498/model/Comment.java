package azaz4498.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
@Entity
@Table(name = "F_COMMENT")
@DynamicUpdate
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
	private List<MultiComment> m_Comments = new ArrayList<MultiComment>();
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
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
	@JsonManagedReference
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL , mappedBy = "comment")
	public List<MultiComment> getM_Comments() {
		return m_Comments;
	}

	public void setM_Comments(List<MultiComment> m_Comments) {
		this.m_Comments = m_Comments;
	}
	
}

