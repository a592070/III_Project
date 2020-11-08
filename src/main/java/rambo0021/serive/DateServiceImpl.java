package rambo0021.serive;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import rambo0021.dao.DateDao;

public class DateServiceImpl implements DateService {
	@Autowired
	@Qualifier("dateDao")
	private DateDao dao;

	@Override
	public Date StringtoDate(String date) {
		return dao.StringtoDate(date);
	}
}
