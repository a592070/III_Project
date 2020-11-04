package innocence741.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import innocence741.model.CarRentalCompany;
import innocence741.model.CarRentalCompanyDAO;

public class CarRentalCompanyService {

	@Autowired
	private CarRentalCompanyDAO carRentalCompanyDAO;
	
	public boolean updateCarRentalCompany(CarRentalCompany cBean) {
		return carRentalCompanyDAO.updateCarRentalCompany(cBean);
	}
}
