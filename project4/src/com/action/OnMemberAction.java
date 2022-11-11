package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;

public class OnMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String mail = request.getParameter("email");

		pmemberDAO dao = pmemberDAO.getInstance();
		int check = dao.setOnMember(mail);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if(check > 0) {
			out.println("<script>"
					+ "alert('해당 이메일이 활성화되었습니다."
					+ "재로그인 해주시길 바랍니다.');"
					+ "location.href='" + request.getContextPath() + "/house_list.do';"
					+ "</script>");
		} else {
			out.println("<script>"
					+ "alert('오류가 발생했습니다. 재시도 부탁드립니다.');"
					+ "history.back();"
					+ "</script>");
		}

		return forward;
	}

}