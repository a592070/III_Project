package innocence741.model;

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
	

	
	
}
