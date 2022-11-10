package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ReviewDAO;
import com.model.ReviewDTO;

public class ReviewListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		long memcode = (long)session.getAttribute("member_code_session");
		
		ReviewDAO dao = new ReviewDAO();  
		List<ReviewDTO> result = dao.selectUserReviews(memcode);
        
        request.setAttribute("result", result);

        ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("account-settings/ReviewList.jsp");
		return forward;
	}
}