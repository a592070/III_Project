package azaz4498.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "F_ARTICLE")
@DynamicUpdate
public class Article implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String artContent;
	private Timestamp artCreTime;
	private String artUserId;
	private Integer artCommNum;
	private Integer artView;
	private Integer artId;
	private Integer artTypeId;
	private String artTitle;
	private String artStatus;
	
	@Column(name = "ART_STATUS")
	public String getArtStatus() {
		return artStatus;
	}

	public void setArtStatus(String artStatus) {
		this.artStatus = artStatus;
	}

	private List<Comment> comments = new ArrayList<Comment>();
	private List<Picture> pictures = new ArrayList<Picture>();
	private ArticleType articleType;

	public Article() {
	}

	@Column(name = "ART_CONTENT")
	public String getArtContent() {
		return artContent;
	}

	public void setArtContent(String artContent) {
		this.artContent = artContent;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "ART_CRE_TIME")
	public Timestamp getArtCreTime() {
		return artCreTime;
	}

	public void setArtCreTime(Timestamp artCreTime) {
		this.artCreTime = artCreTime;
	}

	@Column(name = "ART_USERID")
	public String getArtUserId() {
		return artUserId;
	}

	public void setArtUserId(String artUserId) {
		this.artUserId = artUserId;
	}

	@Column(name = "ART_COMM_NUM")
	public Integer getArtCommNum() {
		return artCommNum;
	}

	public void setArtCommNum(Integer artCommNum) {
		this.artCommNum = artCommNum;
	}

	@Column(name = "ART_VIEW")
	public Integer getArtView() {
		return artView;
	}

	public void setArtView(Integer artView) {
		this.artView = artView;
	}

	@Id
	@Column(name = "ART_ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ARTID_SEQUENCE")
	@SequenceGenerator(name = "ARTID_SEQUENCE", sequenceName = "ARTID_SEQUENCE", allocationSize = 1)
	public Integer getArtId() {
		return artId;
	}

	public void setArtId(Integer artId) {
		this.artId = artId;
	}
	@JsonIgnore
	@Transient
	public Integer getArtTypeId() {
		return artTypeId;
	}

	public void setArtTypeId(Integer artTypeId) {
		this.artTypeId = artTypeId;
	}

	@Column(name = "ART_TITLE")
	public String getArtTitle() {
		return artTitle;
	}

	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}

	
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "article")
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "article")
	public List<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}

	@JsonManagedReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ART_TYPE_ID")
	public ArticleType getArticleType() {
		return articleType;
	}
	
	public void setArticleType(ArticleType articleType) {
		this.articleType = articleType;
	}

	@Override
	public String toString() {
		return "Article [artCreTime=" + artCreTime + "]";
	}

	

	

}
