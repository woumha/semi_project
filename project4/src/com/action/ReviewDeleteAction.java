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
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class ReviewDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		
		ReviewDAO dao = new ReviewDAO();
        String result = Boolean.toString(dao.deleteReview(id) == 1);
        
        ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("review-list.do?result=" + result);
		return forward;
	}
}