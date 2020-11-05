package innocence741.model;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



public class CarRentalCompanyViewDAO {
	
	private SessionFactory sessionFacory;
	private static List<CarRentalCompanyVO> carRentalCompanyVOs;
	private List<CarRentalCompanyVO> carRentalCompanyHomepageVOs;


	
	@Autowired 
	public CarRentalCompanyViewDAO(@Qualifier("sessionFactory") SessionFactory sessionFacory) {
		this.sessionFacory = sessionFacory;
	}
	
	public List<CarRentalCompanyVO> getCarRentalCompanysList() throws SQLException {
		Session session = sessionFacory.getCurrentSession();
		Query<CarRentalCompanyVO> query = session.createQuery("From CarRentalCompanyVO", CarRentalCompanyVO.class);
		carRentalCompanyVOs = query.list();
		return carRentalCompanyVOs;
	}
	
	public List<CarRentalCompanyVO> getCarRentalCompanysHomepageList(BigDecimal sn_rentalcompany) throws SQLException {
		Session session = sessionFacory.getCurrentSession();
		Query<CarRentalCompanyVO> query = session.createQuery("From CarRentalCompanyVO c where c.sn_rentalcompany=?0", CarRentalCompanyVO.class);
		query.setParameter(0,sn_rentalcompany);
		carRentalCompanyHomepageVOs = query.list();
		return carRentalCompanyHomepageVOs;
	}
	
	
}