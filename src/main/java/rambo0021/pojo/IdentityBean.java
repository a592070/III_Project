package rambo0021.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "identity")
public class IdentityBean {
	private int id;
	private String name;
	private Set<AccountBean> accountBean = new HashSet<AccountBean>();

	public IdentityBean() {
	}

	@Id
	@Column(name = "ID")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "identityBean")
	public Set<AccountBean> getAccountBean() {
		return accountBean;
	}

	public void setAccountBean(Set<AccountBean> accountBean) {
		this.accountBean = accountBean;
	}

}
