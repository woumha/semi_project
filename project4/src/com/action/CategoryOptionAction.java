package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.HouseDAO;
import com.model.HouseDTO;

public class CategoryOptionAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String title = request.getParameter("title").trim();
		
		int water = Integer.parseInt(request.getParameter("water").trim());
		int pool = Integer.parseInt(request.getParameter("pool").trim());
		int ski = Integer.parseInt(request.getParameter("ski").trim());
		int grill = Integer.parseInt(request.getParameter("grill").trim());
		int smoking = Integer.parseInt(request.getParameter("smoking").trim());
		int gym = Integer.parseInt(request.getParameter("gym").trim());
		
		System.out.println("water >>> " + water);
		System.out.println("pool >>> " + pool);
		System.out.println("ski >>> " + ski);
		System.out.println("grill >>> " + grill);
		System.out.println("smoking >>> " + smoking);
		System.out.println("gym >>> " + gym);
		
		HouseDAO dao = HouseDAO.getInstance();
		
		List<HouseDTO> list = dao.categoryOption(water, pool, ski, grill, smoking, gym);
		
		request.setAttribute("List", list);
		request.setAttribute("List_title", title);
		
		ActionForward forward = new ActionForward();
			
		forward.setRedirect(false);
			
		forward.setPath("view/main.jsp");
		
		return forward;
	}

}
