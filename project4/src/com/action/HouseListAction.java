package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;

public class HouseListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HouseDAO dao = HouseDAO.getInstance();
		
		List<HouseDTO> list = dao.getHouseList();
		String List_title = "전체";
		request.setAttribute("List", list);
		request.setAttribute("List_title", List_title);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("view/main.jsp");
		
		return forward;
	}

}
