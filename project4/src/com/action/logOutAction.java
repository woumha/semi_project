package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;

public class logOutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("view/loginSelect.jsp");
		return forward;
	}

}
