package azaz4498.model;

import java.io.Serializable;
import java.sql.Timestamp;

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

import org.hibernate.annotations.DynamicInsert;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "F_MULTI_COM")
@DynamicInsert
public class MultiComment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int m_Id;
	private String m_Content;
	private int m_ComId;
	private String m_UserId;
	private Timestamp m_Date;
	private Comment comment;
	public MultiComment() {
		
	}
	@Id@Column(name = "MULTI_COM_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getM_Id() {
		return m_Id;
	}
	public void setM_Id(int m_Id) {
		this.m_Id = m_Id;
	}
	@Column(name = "MULTI_COM_CONTENT")
	public String getM_Content() {
		return m_Content;
	}
	public void setM_Content(String m_Content) {
		this.m_Content = m_Content;
	}
	@JsonIgnore
	@Transient
	public int getM_ComId() {
		return m_ComId;
	}
	public void setM_ComId(int m_ComId) {
		this.m_ComId = m_ComId;
	}
	@Column(name = "MULTI_COM_USER_ID")
	public String getM_UserId() {
		return m_UserId;
	}
	public void setM_UserId(String m_UserId) {
		this.m_UserId = m_UserId;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "MULTI_COM_DATE")
	public Timestamp getM_Date() {
		return m_Date;
	}
	public void setM_Date(Timestamp m_Date) {
		this.m_Date = m_Date;
	}
	@JsonBackReference
	@JoinColumn(name = "MULTI_COM_COM_ID")
	@ManyToOne(fetch = FetchType.LAZY)
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	
	
}
