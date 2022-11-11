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
import com.model.NoticeDTO;

public class ReservationListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int house_no = Integer.parseInt(request.getParameter("no").trim());
		
		String house_name = request.getParameter("houseName").trim();
		
		long pmember_code = Long.parseLong(request.getParameter("pmember_code").trim());
		String checkin = request.getParameter("startDate").trim();
		String checkout = request.getParameter("endDate").trim();
		int price = Integer.parseInt(request.getParameter("houseprice").trim());
		
		// 넘어온 값 확인용 코드
		System.out.println("넘어온 카테고리 값 >>> " + house_no);
		System.out.println("넘어온 카테고리 값 >>> " + house_name);
		System.out.println("넘어온 카테고리 값 >>> " + pmember_code);
		System.out.println("넘어온 카테고리 값 >>> " + checkin);
		System.out.println("넘어온 카테고리 값 >>> " + checkout);
		System.out.println("넘어온 카테고리 값 >>> " + price);
		
		ReservationDAO dao = ReservationDAO.getInstance();
		
		int R_List = dao.insertRes(house_no, house_name, pmember_code, checkin, checkout, price);
		
		// 이호찬 >> 예약시 notice DB에 추가됩니다.
		if(R_List > 0) {
			NoticeDTO noticeDTO = new NoticeDTO();
			String notice_cont = "고객님께서 " + house_name + "을 예약하셨습니다. 자세한 사항은 [계정 > 결제 및 대금 수령]을 확인해주세요";
			noticeDTO.setPmember_code(pmember_code);
			noticeDTO.setNotice_cont(notice_cont);
			dao.noticeInformation(noticeDTO);			
		}
				
		request.setAttribute("List", R_List);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("house_list.do");
		
		return forward;
	}

}
