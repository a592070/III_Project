package innocence741.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import innocence741.model.CarRentalCompanyVO;
import innocence741.model.CarRentalCompanyViewDAO;

@Service("CarRentalCompanyViewService")
public class CarRentalCompanyViewService {

	@Autowired
	private CarRentalCompanyViewDAO carRentalCompanyViewDAO;
	
	public List<CarRentalCompanyVO> getCarRentalCompanysList() throws SQLException {
		return carRentalCompanyViewDAO.getCarRentalCompanysList();
	}
}
