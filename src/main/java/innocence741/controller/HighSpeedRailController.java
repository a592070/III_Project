package innocence741.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import innocence741.model.CarRentalCompanyVO;
import innocence741.model.HighSpeedRail;
import innocence741.model.HighSpeedRailDAO;
import innocence741.service.CarRentalCompanyViewService;
import innocence741.service.HighSpeedRailService;

@Controller @Lazy
public class HighSpeedRailController {
	
	@Autowired
	HighSpeedRailService highSpeedRailService;
	
	@RequestMapping(path = "/highspeedrail.controller", method = RequestMethod.GET)
	public String highSpeedRail() {
		return "innocence741/ajax_traffic";
	}
	
	@RequestMapping(path = "/HsrServlet", method = RequestMethod.POST)
	public void processAction1(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        String startPoint = request.getParameter("startPoint");
        String destination = request.getParameter("destination");
        String departureTime = request.getParameter("departureTime");
        System.out.println("startPoint= "+ startPoint);
        System.out.println("destination= "+ destination);
        System.out.println("departureTime= "+ departureTime);

        
        
		List<HighSpeedRail> list;
    	int price = 0;
    	highSpeedRailService.hsrInit();
    	highSpeedRailService.searchHSR(startPoint, destination, departureTime);
		list = highSpeedRailService.listHsrDO();
		System.out.println(list.size());
		price = highSpeedRailService.ticketPrice(startPoint, destination);
		
        ObjectMapper objectMapper = new ObjectMapper();
        String ujson = objectMapper.writeValueAsString(list);
        ujson = "[" + ujson + ",{\"price\" : " + price + "}]";
        
        PrintWriter out = response.getWriter();
        out.println(ujson.toString());
        
	}

}
