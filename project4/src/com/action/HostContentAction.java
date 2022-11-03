package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HostingDAO;
import com.model.HouseDTO;

public class HostContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int house_no = Integer.parseInt(request.getParameter("no").trim());
		
		HostingDAO dao = HostingDAO.getInstance();
		
		HouseDTO dto = dao.getHouseNo(house_no);
		
		request.setAttribute("house_content", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("view/hostCont.jsp");
		
		return forward;
	}

}
