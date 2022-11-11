package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HostingDAO;
import com.model.HouseDAO;
import com.model.HouseDTO;

public class topSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String text = request.getParameter("content");


		ActionForward forward = new ActionForward();

		if(text.equals("")) {
			forward.setRedirect(true);
			forward.setPath("view/main.jsp");
		} else {
			HouseDTO housedto = new HouseDTO();

			HouseDAO dao = HouseDAO.getInstance();
			List<HouseDTO> list =  dao.getSearchList(text);

			request.setAttribute("check", 0);
			request.setAttribute("List", list);
			forward.setRedirect(false);
			forward.setPath("view/main.jsp");
		}

		return forward;
	}

}