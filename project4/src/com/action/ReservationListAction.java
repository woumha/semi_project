package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;
import com.model.ReservationDAO;
import com.model.ReservationDTO;

public class ReservationListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int house_no = Integer.parseInt(request.getParameter("no").trim());

		//String member_id = request.getParameter("member_id").trim();
		String member_id = "j";
		
		String checkin = request.getParameter("startDate").trim();
		String checkout = request.getParameter("endDate").trim();
		int price = Integer.parseInt(request.getParameter("houseprice").trim());
		
		// 넘어온 값 확인용 코드
		System.out.println("넘어온 카테고리 값 >>> " + house_no);
		System.out.println("넘어온 카테고리 값 >>> " + member_id);
		System.out.println("넘어온 카테고리 값 >>> " + checkin);
		System.out.println("넘어온 카테고리 값 >>> " + checkout);
		System.out.println("넘어온 카테고리 값 >>> " + price);
		
		ReservationDAO dao = ReservationDAO.getInstance();
		
		int R_List = dao.insertRes(house_no, member_id, checkin, checkout, price);
		
		request.setAttribute("List", R_List);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("view/test_k.jsp");
		
		return forward;
	}

}
