package iring29.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import iring29.model.R_OrderDAO;
import iring29.model.R_OrderList_VO;
import iring29.model.R_Order_List;
import iring29.model.R_Order_VO;

public class R_OrderService {
	@Autowired
	private R_OrderDAO rOrderDAO;

	@Transactional(rollbackFor = { Throwable.class })
	public int getListSize() {
		return rOrderDAO.getListSize();
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<R_Order_VO> totaol_Rlist(int first, int count) {
		return rOrderDAO.totaol_Rlist(first, count);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public R_OrderList_VO Detail_OderList(BigDecimal id) {
		return rOrderDAO.Detail_OderList(id);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public String deleteOrder(BigDecimal id) {
		return rOrderDAO.deleteOrder(id);
	}
}
