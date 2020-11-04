package innocence741.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import innocence741.model.CarRentalCompany;
import innocence741.model.CarRentalCompanyDAO;

@Transactional(rollbackFor = {Throwable.class})
public class CarRentalCompanyService {

	@Autowired
	private CarRentalCompanyDAO carRentalCompanyDAO;
	
	public boolean updateCarRentalCompany(CarRentalCompany cBean) {
		return carRentalCompanyDAO.updateCarRentalCompany(cBean);
	}
}