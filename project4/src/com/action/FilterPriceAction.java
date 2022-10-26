package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;

public class FilterPriceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String category = request.getParameter("category").trim();
		int price = Integer.parseInt(request.getParameter("value").trim());

		// 넘어온 값 확인용 코드
		System.out.println("=====================================");
		System.out.println("넘어온 카테고리 값 >>> " + category);
		System.out.println("넘어온 값(price) >>> " + price);
		System.out.println("=====================================");
		
		HouseDAO dao = HouseDAO.getInstance();
		
		ActionForward forward = new ActionForward();
		
		if(category.equals("*") || category.equals("")) {
			List<HouseDTO> categoryList = dao.filterList_price(price);
			
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
			
			forward.setRedirect(false);
			
			forward.setPath("view/main.jsp");
		} else {
			List<HouseDTO> categoryList = dao.filterList_cprice(category, price);
			
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
			
			forward.setRedirect(false);
			
			forward.setPath("view/main.jsp");
		}
		
		return forward;
	}

}
