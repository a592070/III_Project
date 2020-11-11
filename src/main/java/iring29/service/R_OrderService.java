package iring29.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import iring29.model.R_OrderDAO;
import iring29.model.R_Order_View;

public class R_OrderService {
	@Autowired
	private R_OrderDAO rOrderDAO;

	@Transactional(rollbackFor = { Throwable.class })
	public int getListSize() {
		return rOrderDAO.getListSize();
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<R_Order_View> totaol_Rlist(int first, int count) {
		return rOrderDAO.totaol_Rlist(first, count);
	}
}
