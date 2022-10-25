package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.HouseDAO;
import com.model.HouseDTO;

public class FilterOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String category = request.getParameter("category").trim();
		int price = Integer.parseInt(request.getParameter("filter_pice").trim());
		int person = Integer.parseInt(request.getParameter("filter_person").trim());
		
		// 넘어온 값 확인용 코드
		System.out.println("=======================================================");
		System.out.println("넘어온 카테고리 값 >>> " + category);
		System.out.println("넘어온 숙소 가격 값 >>> " + price);
		System.out.println("넘어온 숙소 최대인원 값 >>> " + person);
		System.out.println("=======================================================");
		
		HouseDAO dao = HouseDAO.getInstance();
		
		ActionForward forward = new ActionForward();
		
		if((category.equals("") || category.equals("*")) && price == 0 && person == 0) { // 3가지 값이 없을 때 
			List<HouseDTO> categoryList = dao.getHouseList();
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
			
		} else if(price == 0 && person == 0) { // 카테고리 값만 있을 때
			List<HouseDTO> categoryList = dao.categoryList(category);
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);	
			
		} else if((category.equals("") || category.equals("*")) && person == 0) { // 가격만 있을 때
			List<HouseDTO> categoryList = dao.filterList_price(price);
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
			
		} else if((category.equals("") || category.equals("*")) && price == 0) { // 인원만 있을 때
			List<HouseDTO> categoryList = dao.filterList_person(person);
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
		} else if(person == 0) {                       // 카테고리, 가격만 있을 때
			List<HouseDTO> categoryList = dao.filterList_cprice(category, price);
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
		} else if(price == 0) {                       // 카테고리, 인원만 있을 때
			List<HouseDTO> categoryList = dao.filterList_cperson(category, person);
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
		} else if((category.equals("") || category.equals("*"))) {              // 가격, 인원만 있을 때
			List<HouseDTO> categoryList = dao.filterList_pperson(price, person);
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
		} else {                                      // 3가지 다 있을 때          
			List<HouseDTO> categoryList = dao.filterList_cpperson(category, price, person);
			request.setAttribute("List", categoryList);
			request.setAttribute("f_cate", category);
		}
		
		
		forward.setRedirect(false);
		forward.setPath("view/main.jsp");
		
		return forward;
	}

}
