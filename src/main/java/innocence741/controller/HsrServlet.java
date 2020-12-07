package innocence741.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import utils.HibernateUtil;
import innocence741.model.HighSpeedRail;
import innocence741.model.HighSpeedRailDAO;


/**
 * Servlet implementation class HsrServlet
 */
@WebServlet("/HsrServlet")
public class HsrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HsrServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		

		
        String startPoint = request.getParameter("startPoint");
        String destination = request.getParameter("destination");
        String departureTime = request.getParameter("departureTime");
        System.out.println("getParameter: startPoint= "+startPoint);
        System.out.println("getParameter: destination= "+destination);
        System.out.println("getParameter: departureTime= "+departureTime);

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
//		session.beginTransaction();
    	
		List<HighSpeedRail> list;
    	int price = 0;
		HighSpeedRailDAO highSpeedRailDAO = new HighSpeedRailDAO(session);
    	highSpeedRailDAO.searchHSR(startPoint, destination, departureTime);
		list = highSpeedRailDAO.listHsrDO();
		System.out.println(list.size());
		price = highSpeedRailDAO.ticketPrice(startPoint, destination);
		
        ObjectMapper objectMapper = new ObjectMapper();
        String ujson = objectMapper.writeValueAsString(list);
        ujson = "[" + ujson + ",{\"price\" : " + price + "}]";
        
//		session.getTransaction().commit();
//		HibernateUtil.closeSessionFactory();
		
        System.out.println(ujson+"\n");
        PrintWriter out = response.getWriter();
        out.println(ujson.toString());
        
//        session.getTransaction().commit();
        System.out.println("session.getTransaction().commit()");
    }
    

    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			try {
				processRequest(request, response);
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
