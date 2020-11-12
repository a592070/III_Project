package innocence741.model;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import global.pojo.OrderTable;
import rambo0021.pojo.AccountBean;


public class T_Order_ListDAO {
	private Session session;

	public T_Order_ListDAO(){
	}
	
	public T_Order_ListDAO(Session session) throws SQLException {
		this.session = session;
	}

	public boolean createOrderTable(OrderTable order_table) {
		boolean flag = false;
		try {
			session.save(order_table);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public void searchHistoricalOrder(ArrayList<ArrayList> combineArrayList, String userid) throws ParseException {
		ArrayList<OrderTable> tmp_orderTableBeans = new ArrayList<>();
		ArrayList<OrderTable> orderTableBeans = new ArrayList<>();

		AccountBean user = new AccountBean();

		
		String sql = "select o.order_id, o.order_date, o.username, t.sn_order, t.sn_schedule, t.ticketprice, t.numbers_days, t.startpoint, t.destination, t.departuredate, t.sn_cartype, t.order_type, t.name, t.phone, h.id_hsr, h.direction, h.nangang, h.taipei, h.banqiao ,h.taoyuan, h.hsinchu, h.miaoli, h.taichung, h.changhua, h.yunlin, h.chiayi, h.tainan, h.zuoying from order_table o, t_order_list t, highspeedrail h where o.order_id = t.order_id(+) and t.sn_schedule = h.sn_schedule(+) and o.username = "
				+ "\'" + userid + "\'" + "order by o.order_id";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (int i = 0; i < list.size(); i++) {
			OrderTable oBean = new OrderTable();
			T_Order_List tBean = new T_Order_List();
			HighSpeedRail hBean = new HighSpeedRail();
			CarType cBean = new CarType();

			Timestamp ts = new Timestamp(System.currentTimeMillis()); // String to timestamp
			ts = Timestamp.valueOf(list.get(i)[1].toString());
//			System.out.println("ts: "+ts);
			Timestamp ts2 = new Timestamp(System.currentTimeMillis()); // String to timestamp
			if (list.get(i)[9] != null)
				ts2 = Timestamp.valueOf(list.get(i)[9].toString());

			if (list.get(i)[1] != null)
				oBean.setOrder_id(BigDecimal.valueOf(Integer.parseInt(list.get(i)[0].toString())));
			
			oBean.setOrder_date(ts);
			
			
//			oBean.setUser(list.get(i)[2].toString());
			user.setUserName(list.get(i)[2].toString());
			user.setModify_Date(new Date());
			user.setRegister(new Date());
			oBean.setAccountBean(user);
			
			
			if (list.get(i)[3] != null)
				tBean.setT_sn_order(BigDecimal.valueOf(Integer.parseInt(list.get(i)[3].toString())));
			if (list.get(i)[4] != null)
				hBean.setSnSchedule(BigDecimal.valueOf(Integer.parseInt(list.get(i)[4].toString())));
			if (list.get(i)[5] != null)
				tBean.setTicketPrice(BigDecimal.valueOf(Integer.parseInt(list.get(i)[5].toString())));
			if (list.get(i)[6] != null)
				tBean.setNums_days(BigDecimal.valueOf(Integer.parseInt(list.get(i)[6].toString())));
			if (list.get(i)[7] != null)
				tBean.setStartPoint(list.get(i)[7].toString());
			if (list.get(i)[8] != null)
				tBean.setDestination(list.get(i)[8].toString());
			if (list.get(i)[9] != null)
				tBean.setDeparatureDate(ts2);
			if (list.get(i)[10] != null)
				cBean.setSn_cartype(BigDecimal.valueOf(Integer.parseInt(list.get(i)[10].toString())));
			if (list.get(i)[11] != null)
				tBean.setOrderType(list.get(i)[11].toString());
			if (list.get(i)[12] != null)
				tBean.setCustomerName(list.get(i)[12].toString());
			if (list.get(i)[13] != null)
				tBean.setCustomerPhone(list.get(i)[13].toString());
			if (list.get(i)[14] != null)
				hBean.setIdHSR(list.get(i)[14].toString());
			if (list.get(i)[15] != null)
				hBean.setDirection(list.get(i)[15].toString());
			if (list.get(i)[16] != null)
				hBean.setNangang(list.get(i)[16].toString());
			if (list.get(i)[17] != null)
				hBean.setTaipei(list.get(i)[17].toString());
			if (list.get(i)[18] != null)
				hBean.setBanqiao(list.get(i)[18].toString());
			if (list.get(i)[19] != null)
				hBean.setTaoyuan(list.get(i)[19].toString());
			if (list.get(i)[20] != null)
				hBean.setHsinchu(list.get(i)[20].toString());
			if (list.get(i)[21] != null)
				hBean.setMiaoli(list.get(i)[21].toString());
			if (list.get(i)[22] != null)
				hBean.setTaichung(list.get(i)[22].toString());
			if (list.get(i)[23] != null)
				hBean.setChanghua(list.get(i)[23].toString());
			if (list.get(i)[24] != null)
				hBean.setYunlin(list.get(i)[24].toString());
			if (list.get(i)[25] != null)
				hBean.setChiayi(list.get(i)[25].toString());
			if (list.get(i)[26] != null)
				hBean.setTainan(list.get(i)[26].toString());
			if (list.get(i)[27] != null)
				hBean.setZuoying(list.get(i)[27].toString());

//			tBean.setOrder_table(oBean);
			tBean.setCarType(cBean);
			tBean.setHighSpeedRail(hBean);

			oBean.addT_Order_Lists(tBean);

			if (!(tBean.getT_sn_order() == null)) { // 代表此筆訂單有交通部分
				orderTableBeans.add(oBean);
//				System.out.println("orderTableBeans1= " + orderTableBeans.size());
				if (orderTableBeans.size() > 1) {
					int tmp = (orderTableBeans.get(orderTableBeans.size() - 1).getOrder_id()
							.compareTo(orderTableBeans.get(orderTableBeans.size() - 2).getOrder_id())); // 判斷當前物件跟上一個物件的orderID是否相同
					if (tmp != 0) {
						tmp_orderTableBeans.add(orderTableBeans.get(orderTableBeans.size() - 1)); // 將不同orderID的物件取出
																									// 存放到tmpList裡
						orderTableBeans.remove(orderTableBeans.size() - 1); // 從orderTableBeans移除不同orderID的物件
//						System.out.println("orderTableBeans3= " + orderTableBeans.size());
						combineArrayList.add(orderTableBeans); // 將orderTableBeans存放到最終的List中
						orderTableBeans = new ArrayList<>(); // 重製orderTableBeans
						orderTableBeans.add(tmp_orderTableBeans.get(0)); // 將剛剛取出的物件從tmp放回orderTableBeans中
						tmp_orderTableBeans.clear(); // 清除tmpList
					}
					System.out.println("orderTableBeans2= " + orderTableBeans.size());
				}
			}

//			System.out.print(list.get(i)[0]+"\t");
//			System.out.println(list.get(i)[1]);
		}
		combineArrayList.add(orderTableBeans);
//		Iterator iter = orderTableBeans.get(0).getT_Order_Lists().iterator();
//		while(iter.hasNext()) {
//			T_Order_List x = (T_Order_List) iter.next();
//			System.out.println(x.getCustomerName());
//		}
//		System.out.println("orderTableBeans.size()" + orderTableBeans.get(0).getT_Order_Lists());
	}

	public boolean delT_Order_List(BigDecimal t_sn_order) {
		boolean flag = false;
		T_Order_List t_Order_List = session.get(T_Order_List.class, t_sn_order);

		if (t_Order_List != null) {
			session.delete(t_Order_List);
			flag = true;
		}
		return flag;
	}

}