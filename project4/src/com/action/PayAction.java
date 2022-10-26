package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDTO;
import com.model.PayDAO;

public class PayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PayDAO dao = PayDAO.getInstance();
		List<HouseDTO> list = dao.getHouseList();
		request.setAttribute("houseList", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("db_test.jsp");
		return forward;
	}
}