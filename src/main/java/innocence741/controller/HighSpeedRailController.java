package innocence741.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import innocence741.model.CarRentalCompanyVO;
import innocence741.model.HighSpeedRail;
import innocence741.model.HighSpeedRailDAO;
import innocence741.model.T_Order_List;
import innocence741.model.T_Order_ListDAO;
import innocence741.service.CarRentalCompanyViewService;
import innocence741.service.HighSpeedRailService;
import innocence741.service.T_Order_ListService;
import global.pojo.OrderTable;
import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;

@Controller @Lazy
public class HighSpeedRailController {
	
	@Autowired
	HighSpeedRailService highSpeedRailService;
	@Autowired
	T_Order_ListService t_Order_ListService;
	@Autowired
	AccountService accountService;
	
	@RequestMapping(path = "/highspeedrail.controller", method = RequestMethod.GET)
	public String highSpeedRail() {
		return "innocence741/ajax_traffic";
	}
	
	@RequestMapping(path = "/orderHSRticket.controller", method = RequestMethod.GET)
	public String orderHSRticket() {
		return "innocence741/orderHSRticket";
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
	
	
	@RequestMapping(path = "/orderHSRticketSrevlet", method = RequestMethod.POST)
	public void processAction2(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
//        HttpSession session2 = request.getSession(false);
//        if (session2.getAttribute("Login") == null) {
//            // 請使用者登入
//        	String ujson1 = "{\"check\" : \"rederict\"}";
//            PrintWriter out = response.getWriter();
//            out.println(ujson1.toString());
//        }else {
			String idHSR = request.getParameter("idHSR");
			String startPoint = request.getParameter("startPoint");
			String destination = request.getParameter("destination");
			String ticketNum = request.getParameter("ticketNum");
			String departureDate = request.getParameter("departureDate");
	//		System.out.println("idHSR= " + idHSR);
	//		System.out.println("departureDate=" + departureDate);
			
			List<HighSpeedRail> list;	//創建一個List裝載列車資訊
	    	int price = 0;
	    	highSpeedRailService.getSN_Schedule(idHSR);
			list = highSpeedRailService.listHsrDO();
			System.out.println(list.size());
			price = highSpeedRailService.ticketPrice(startPoint, destination);
			Boolean check = false;
			System.out.println(highSpeedRailService.getDirection(startPoint, destination).equals(list.get(0).getDirection()));
			if(highSpeedRailService.getDirection(startPoint, destination).equals(list.get(0).getDirection()))
				check = true;
	        ObjectMapper objectMapper = new ObjectMapper();
	        String ujson = objectMapper.writeValueAsString(list);
	        ujson = "[" + ujson + ",{\"price\" : " + price + "},{\"ticketNum\" : " + ticketNum +"},"
	        		+ "{\"departureDate\" : " + '\"'+departureDate+'\"' +"},"
	        				+ "{\"startPoint\" : " + '\"'+startPoint+'\"' +"},{\"destination\" : " + '\"'+destination+'\"' +"}]";
	
	        
			ObjectMapper mapper = new ObjectMapper();
			JsonNode jsonNode = mapper.readTree(ujson);
			JsonNode node1 = jsonNode.path(0).path(0).path(startPoint);
			JsonNode node2 = jsonNode.path(0).path(0).path(destination);
	//		System.out.println(node1);
	//		System.out.println(node1.toString().equals("null"));
			ujson = ujson.substring(0,ujson.length()-1);
	        if(node1.toString().equals("null") || node2.toString().equals("null") || !check) {
	        	ujson = ujson + ",{\"check\" : \"false\"}]";
	        }else {
	        	ujson = ujson + ",{\"check\" : \"true\"}]";
			}
	        System.out.println(ujson+"\n");
	
	        PrintWriter out = response.getWriter();
	        out.println(ujson.toString());
//	    }
		
		
	}
	
	
	
	
	
	@RequestMapping(path = "/T_OrderServlet", method = RequestMethod.POST)
	public void processAction3(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String snSchedule = request.getParameter("snSchedule");
        
        String startPoint = request.getParameter("startPoint");
        
        String destination = request.getParameter("destination");
        int trafficPrice = highSpeedRailService.ticketPrice(startPoint, destination);
        
        String nums_days = request.getParameter("nums_days");
        
        String departureDate_tmp = request.getParameter("departureDate");
        int[] departureDate = spiltDate(departureDate_tmp);
        
        String orderType = request.getParameter("orderType");
        
        String customerName = request.getParameter("customerName");
        
        String customerPhone = request.getParameter("customerPhone");

//        System.out.println("snSchedule= "+snSchedule);
//        System.out.println("startPoint= "+startPoint);
//        System.out.println("destination= "+destination);
//        System.out.println("trafficPrice= " +trafficPrice);
//        System.out.println("nums_days= "+nums_days);
//        System.out.println("departureDate_tmp= "+departureDate);
//        System.out.println("departureDate= "+departureDate[0]+" "+departureDate[1]+" "+departureDate[2]);
//        System.out.println("orderType= "+orderType);
        HttpSession session2 = request.getSession(false);	//使用者的資訊SESSION
        
		Set<T_Order_List> t_Order_Lists = new HashSet<T_Order_List>();
		OrderTable order_table = new OrderTable();
		T_Order_List t_Order_List =new T_Order_List();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); //下訂單時間

//		session.beginTransaction();

//        AccountBean user = (AccountBean) session2.getAttribute("Login");	//之後要換的User
//		AccountBean user = session.get(AccountBean.class, "abab");
        AccountBean user = accountService.userDetail("abab");
		System.out.println("abab: OK");
//		HighSpeedRail highSpeedRail = session.get(HighSpeedRail.class, BigDecimal.valueOf(Integer.parseInt(snSchedule))); //之後要換Integer.parseInt(snSchedule)
		HighSpeedRail highSpeedRail = highSpeedRailService.hsrDetail(BigDecimal.valueOf(Integer.parseInt(snSchedule)));
		order_table.setAccountBean(user);	//假裝user是ipip
		order_table.setOrder_date(ts);
		t_Order_List.setHighSpeedRail(highSpeedRail);
		t_Order_List.setTicketPrice(BigDecimal.valueOf(trafficPrice));	//之後要換BigDecimal.valueOf(trafficPrice)
		t_Order_List.setNums_days(BigDecimal.valueOf(Integer.parseInt(nums_days)));	//之後要換BigDecimal.valueOf(Integer.parseInt(nums_days))
		t_Order_List.setStartPoint(startPoint);	//之後要換startPoint
		t_Order_List.setDestination(destination);	//之後要換destination
		t_Order_List.setDeparatureDate(Timestamp.valueOf(LocalDate.of(departureDate[0], departureDate[1], departureDate[2]).atStartOfDay()));	//之後要換Timestamp.valueOf(LocalDate.of(departureDate[0], departureDate[1], departureDate[2]).atStartOfDay())
		t_Order_List.setOrderType(orderType);	//之後要換orderType
		t_Order_List.setOrder_table(order_table);
		t_Order_List.setCustomerName(customerName);	//之後要換customerName
		t_Order_List.setCustomerPhone(customerPhone);	//之後要換customerPhone
		t_Order_List.setT_status(1);
		t_Order_List.setVersion(1);
		
		t_Order_Lists.add(t_Order_List);	//把t_Order_list裝進Set中
		order_table.setT_Order_Lists(t_Order_Lists);	//one to many
		

//		T_Order_ListDAO t_Order_ListDAO = new T_Order_ListDAO(session);
		boolean flag = t_Order_ListService.createOrderTable(order_table);
		System.out.println(flag);
		
		


		
		printJSON(request,response,flag);
		
	}
	public void printJSON(HttpServletRequest request, HttpServletResponse response, boolean flag) throws IOException, SQLException {
//    	System.out.println("rcd_printJSON" + rcd[0]);
    	String str = "";
    	if(flag == true) {
    		str = "{\"check\" : \"success\"}";
    	}else {
    		str = "{\"check\" : \"fail\"}";
		}
    	System.out.println("str= " + str);
    	PrintWriter out = response.getWriter();
    	out.println(str);
    	
		if(flag == false) {
//			session.getTransaction().rollback();
			throw new SQLException("就說你錯了吧");
		}else {
//			session.getTransaction().commit();;
		}
    }
    public int[] spiltDate(String departureDate_tmp) {
		System.out.println("------departureDate_tmp= " + departureDate_tmp);
    	String[] tmp = departureDate_tmp.split("-");
    	int[] departureDate = {Integer.parseInt(tmp[0]), Integer.parseInt(tmp[1]), Integer.parseInt(tmp[2])};
    	return departureDate; 
    }
	

}
