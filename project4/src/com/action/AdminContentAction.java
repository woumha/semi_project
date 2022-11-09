package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;

public class AdminContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String houseNo = request.getParameter("no").trim();
		HouseDAO dao = HouseDAO.getInstance();
		
		HouseDTO content = dao.selectInfo(houseNo);
		request.setAttribute("Cont", content);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_house_content.jsp");
		return forward;
	}
}