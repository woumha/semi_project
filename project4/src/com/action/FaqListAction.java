package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.FaqDAO;
import com.model.FaqDTO;


public class FaqListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		// DB상의 전체 레코드를 조회하여 viewpage로 이동시키는 비즈니스 로직
		
		FaqDAO dao = FaqDAO.getInstance();
		
		List<FaqDTO> list = dao.getFaqList();
		
		request.setAttribute("List", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false); // viewpage로 이동
		
		forward.setPath("view/faq_list.jsp"); // 이동경로 지정
		
		return forward; // 주소값 반환  ==> FrontController로 이동
	}

}
