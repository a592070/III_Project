package azaz4498.model;

import java.io.Serializable;
import java.sql.Date;
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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "F_ARTICLE")
public class Article implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String artContent;
	private Timestamp artCreTime;
	private String artUserId;
	private int artCommNum;
	private int artView;
	private int artId;
	private int artTypeId;
	private String artTitle;
	private byte[] artPic;
	private String artPicUrl;
	private List<Comment> comments = new ArrayList<Comment>();
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
	public int getArtCommNum() {
		return artCommNum;
	}

	public void setArtCommNum(int artCommNum) {
		this.artCommNum = artCommNum;
	}

	@Column(name = "ART_VIEW")
	public int getArtView() {
		return artView;
	}

	public void setArtView(int artView) {
		this.artView = artView;
	}

	@Id
	@Column(name = "ART_ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ARTID_SEQUENCE")
	@SequenceGenerator(name = "ARTID_SEQUENCE", sequenceName = "ARTID_SEQUENCE", allocationSize = 1)
	public int getArtId() {
		return artId;
	}

	public void setArtId(int artId) {
		this.artId = artId;
	}
	@JsonIgnore
	@Transient
	public int getArtTypeId() {
		return artTypeId;
	}

	public void setArtTypeId(int artTypeId) {
		this.artTypeId = artTypeId;
	}

	@Column(name = "ART_TITLE")
	public String getArtTitle() {
		return artTitle;
	}

	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}

	@Column(name = "ART_PIC")
	public byte[] getArtPic() {
		return artPic;
	}

	public void setArtPic(byte[] artPic) {
		this.artPic = artPic;
	}
	@Column(name = "ART_PIC_URL")
	public String getArtPicUrl() {
		return artPicUrl;
	}

	public void setArtPicUrl(String artPicUrl) {
		this.artPicUrl = artPicUrl;
	}
	@JsonManagedReference
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "article")
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ART_TYPE_ID")
	public ArticleType getArticleType() {
		return articleType;
	}
	
	public void setArticleType(ArticleType articleType) {
		this.articleType = articleType;
	}

}
