package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;
import com.model.ResDAO;
import com.model.ResDTO;

public class ResContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		long pcode = Long.parseLong(request.getParameter("pcode").trim());
		System.out.println("pcode >>> " + pcode);
		ResDAO dao = ResDAO.getInstance();
		
		ResDTO content = dao.selectResInfo(pcode);
		request.setAttribute("Cont", content);
		
		String house_no = request.getParameter("no").trim();
		System.out.println("houseNo >>> " + house_no);
		HouseDAO h_dao = HouseDAO.getInstance();
		
		HouseDTO h_cont = h_dao.selectInfo(house_no);
		request.setAttribute("HCont", h_cont);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("res/res_content.jsp");
		return forward;
	}
}