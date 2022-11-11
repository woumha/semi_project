package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ReviewDAO;
import com.model.ReviewDTO;

// 정상동작을 확인하지 않은 버전으로, 사용하기 전 코드 확인/수정 바람

public class ReviewWriteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		long memcode = (long)session.getAttribute("member_code_session");
		
		System.out.println(Integer.parseInt(request.getParameter("house_no")));
		System.out.println(Long.toString(memcode));
		
		System.out.println(request.getParameter("contents"));
		
		System.out.println(Integer.parseInt(request.getParameter("star")));
		
		
		ReviewDTO dto = new ReviewDTO();
        dto.setHouseNo(Integer.parseInt(request.getParameter("house_no")));
        dto.setMemberId(Long.toString(memcode));
        dto.setContents(request.getParameter("contents"));
        dto.setGrade(Integer.parseInt(request.getParameter("star")));

        ReviewDAO dao = new ReviewDAO();
        String result = Boolean.toString(dao.insertWrite(dto) == 1);

        ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("review-list.do?save=" + result);
		return forward;
	}
}