
package innocence741.model;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("carRentalCompanyDao")
public class CarRentalCompanyDAO {

	
	private SessionFactory sessionFacory;

	@Autowired
	public CarRentalCompanyDAO(@Qualifier("sessionFactory") SessionFactory sessionFacory) {
		this.sessionFacory = sessionFacory;
	}
	
	public boolean updateCarRentalCompany(CarRentalCompany cBean) {
		boolean flag = false;
		Session session = sessionFacory.getCurrentSession();
		
		String hql="update CarRentalCompany c set c.name_company=?0, c.address=?1, "
				+ "c.description=?2, c.oprnHours=?3, c.tel=?4, "
				+ "c.compantAccount=?5, c.accessible_carrentalcompany=?6, c.pic_rentalcompany=?7 where  c.sn_rentalcompany=?8";
		try {
			Query query  = session.createQuery(hql); 
			query.setParameter(0,cBean.getName_company());
			query.setParameter(1,cBean.getAddress());
			query.setParameter(2,cBean.getDescription());
			query.setParameter(3,cBean.getOprnHours());
			query.setParameter(4,cBean.getTel());
			query.setParameter(5,cBean.getCompantAccount());
			query.setParameter(6,cBean.getAccessible_carrentalcompany());
			query.setParameter(7,cBean.getPic_rentalcompany());
			query.setParameter(8,cBean.getSn_rentalcompany());
			query.executeUpdate();	
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		
		return flag;	
		
	}
	
	
	public boolean updateCarRentalCompanyWithoutPic(CarRentalCompany cBean) {
		boolean flag = false;
		Session session = sessionFacory.getCurrentSession();
		
		String hql="update CarRentalCompany c set c.name_company=?0, c.address=?1, "
				+ "c.description=?2, c.oprnHours=?3, c.tel=?4, "
				+ "c.compantAccount=?5, c.accessible_carrentalcompany=?6 where  c.sn_rentalcompany=?7";
		try {
			Query query  = session.createQuery(hql); 
			query.setParameter(0,cBean.getName_company());
			query.setParameter(1,cBean.getAddress());
			query.setParameter(2,cBean.getDescription());
			query.setParameter(3,cBean.getOprnHours());
			query.setParameter(4,cBean.getTel());
			query.setParameter(5,cBean.getCompantAccount());
			query.setParameter(6,cBean.getAccessible_carrentalcompany());
			query.setParameter(7,cBean.getSn_rentalcompany());
			query.executeUpdate();	
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		
		return flag;	
		
	}
	
	public CarRentalCompany getCarRentalCompanyBean(BigDecimal sn_rentalcompany) {
		Session session = sessionFacory.getCurrentSession();
		CarRentalCompany carRentalCompany = session.get(CarRentalCompany.class, sn_rentalcompany);
		return carRentalCompany;
	}
	
	public boolean delCarRentalCompany(BigDecimal sn_rentalcompany) {
		boolean flag = false;
		Session session = sessionFacory.getCurrentSession();
		CarRentalCompany carRentalCompany = session.get(CarRentalCompany.class, sn_rentalcompany);
		if(carRentalCompany != null) {
			session.delete(carRentalCompany);
			flag = true;
		}
		return flag;
	}
	
	public boolean createCarRentalCompany(CarRentalCompany carRentalCompany) {
		System.out.println("---------------------------------hahahaha---------------------------------");
		boolean flag = false;
		Session session = sessionFacory.getCurrentSession();
		try {
			session.save(carRentalCompany);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}

