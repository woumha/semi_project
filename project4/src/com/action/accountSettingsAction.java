package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class accountSettingsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 계정
		HttpSession session = request.getSession();
		long code = (long)request.getAttribute("member_code_session");
		
		pmemberDAO dao = pmemberDAO.getInstance();
		dao.getMemberInformation(code);
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
