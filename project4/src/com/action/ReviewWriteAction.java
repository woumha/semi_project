package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ReviewDAO;
import com.model.ReviewDTO;

// 정상동작을 확인하지 않은 버전으로, 사용하기 전 코드 확인/수정 바람

public class ReviewWriteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ReviewDTO dto = new ReviewDTO();
        dto.setHouseNo(Integer.parseInt(request.getParameter("houseNo")));
        dto.setMemberId(request.getParameter("memberId"));
        dto.setContents(request.getParameter("contents"));
        dto.setGrade(Integer.parseInt(request.getParameter("grade")));

        // DAO를 통해 DB에 리뷰 내용 저장
        ReviewDAO dao = new ReviewDAO();
        int result = dao.insertWrite(dto);
        
        request.setAttribute("result", result);

        ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
			
		forward.setPath("view/history.jsp");
		
		return forward;
	}
}