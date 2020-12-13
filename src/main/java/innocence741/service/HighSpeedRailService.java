package innocence741.service;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import innocence741.model.HighSpeedRail;
import innocence741.model.HighSpeedRailDAO;

@Transactional(rollbackFor = {Throwable.class})
public class HighSpeedRailService {

	@Autowired
	private HighSpeedRailDAO highSpeedRailDAO;
	
	public void hsrInit() throws SQLException {
		highSpeedRailDAO.hsrInit();
	}
	
	public List<HighSpeedRail> listHsrDO(){
		return highSpeedRailDAO.listHsrDO();
	}
	
	public int location2num(String location) {
		return highSpeedRailDAO.location2num(location);
	}
	
	public String getDirection(String startPoint, String destination) {
		return highSpeedRailDAO.getDirection(startPoint, destination);
	}
	
	public void searchHSR(String startPoint, String destination, String departureTime) {
		highSpeedRailDAO.searchHSR(startPoint, destination, departureTime);
	}
	
	public int ticketPrice(String startPoint, String destination) {
		return highSpeedRailDAO.ticketPrice(startPoint, destination);
	}
	
	public void getSN_Schedule(String idHSR) {
		highSpeedRailDAO.getSN_Schedule(idHSR);
	}
	
	public HighSpeedRail hsrDetail(BigDecimal sn_schedule) {
		return highSpeedRailDAO.hsrDetail(sn_schedule);
	}
}
