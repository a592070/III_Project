package azaz4498.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "F_ART_TYPE")
public class ArticleType implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int typeId;
	private String typeName;
	private List<Article> articles = new ArrayList<Article>();
	
	@Id@Column(name = "TYPE_ID", updatable=false)
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	@Column(name = "TYPE_NAME")
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@JsonBackReference
	@OneToMany (fetch = FetchType.LAZY, cascade = CascadeType.ALL ,mappedBy = "articleType")
	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
}

