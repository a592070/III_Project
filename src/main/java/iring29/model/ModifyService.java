package iring29.model;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class ModifyService {
	@Autowired
	private ModifyDAO mDao;

	public ModifyService() {

	}

	public ModifyService(ModifyDAO mDao) {
		this.mDao = mDao;
	}

	@Transactional(rollbackFor = { Throwable.class })
	// modify location
	public Restaurant R_Address(String address, String transportation, BigDecimal r_sn) {
		return mDao.R_Address(address, transportation, r_sn);
	}

	@Transactional(rollbackFor = { Throwable.class })
	// modify Type
	public Restaurant R_Type(String serviceinfo, String type, BigDecimal r_sn) {
		return mDao.R_Type(serviceinfo, type, r_sn);
	}

	@Transactional(rollbackFor = { Throwable.class })
	// modify Info
	public Restaurant R_Info(String opentime, String description, BigDecimal r_sn) {
		return R_Info(opentime, description, r_sn);
	}

	@Transactional(rollbackFor = { Throwable.class })
	// modify Img
	public Restaurant R_Img(byte[] pic, BigDecimal r_sn) {
		return R_Img(pic, r_sn);
	}
}
