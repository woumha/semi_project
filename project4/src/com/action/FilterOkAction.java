package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;

public class FilterOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String category = request.getParameter("filter_category").trim();
		int price = Integer.parseInt(request.getParameter("filter_price").trim());
		int person = Integer.parseInt(request.getParameter("filter_person").trim());
		
		// 넘어온 값 확인용 코드
		System.out.println("=======================================================");
		System.out.println("넘어온 카테고리 값 >>> " + category);
		System.out.println("넘어온 숙소 가격 값 >>> " + price);
		System.out.println("넘어온 숙소 최대인원 값 >>> " + person);
		System.out.println("=======================================================");
		
		HouseDAO dao = HouseDAO.getInstance();
		
		ActionForward forward = new ActionForward();
		
		List<HouseDTO> list = dao.getFilterList(category, price, person);
		
		int check = 0;
		
		if(list == null) {
			check = 1;
		}
		
		request.setAttribute("List", list);
		request.setAttribute("check", check);
		
		forward.setRedirect(false);
		forward.setPath("view/main.jsp");
		
		return forward;
	}

}
