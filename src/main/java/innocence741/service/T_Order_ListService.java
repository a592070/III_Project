package innocence741.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import global.pojo.OrderTable;
import innocence741.model.T_Order_ListDAO;

@Transactional(rollbackFor = {Throwable.class})
public class T_Order_ListService {

	@Autowired
	T_Order_ListDAO t_Order_ListDAO;
	
	public boolean createOrderTable(OrderTable order_table) {
		return t_Order_ListDAO.createOrderTable(order_table);
	}
	
	public void searchHistoricalOrder(ArrayList<ArrayList> combineArrayList, String userid) throws ParseException {
		t_Order_ListDAO.searchHistoricalOrder(combineArrayList, userid);
	}
	
	public boolean delT_Order_List(BigDecimal t_sn_order) {
		return t_Order_ListDAO.delT_Order_List(t_sn_order);
	}
}
