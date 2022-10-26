package com.action;

import java.io.*;
import java.util.*;
import javax.servlet.http.*;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.*;


public class HouseCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String category = request.getParameter("keyword").trim();
		
		// 넘어온 값 확인용 코드
		System.out.println("넘어온 카테고리 값 >>> " + category);
		
		HouseDAO dao = HouseDAO.getInstance();
		
		List<HouseDTO> categoryList = dao.categoryList(category);
		
		request.setAttribute("List", categoryList);
		request.setAttribute("f_cate", category);
		request.setAttribute("List_title", category);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("view/main.jsp");
		
		return forward;
	}

}
