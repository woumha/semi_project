package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.LoginDAO;
import com.model.LoginDTO;

public class memberSignUpOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String last = request.getParameter("lastname");
		String first = request.getParameter("firstname");
		long phone = Long.parseLong(request.getParameter("phone"));
		int birth = Integer.parseInt(request.getParameter("birth"));
		String mail = request.getParameter("hide_email");
		String mail_Id = "", mail_Domain = "";
		
		StringTokenizer st = new StringTokenizer(mail, "@");
		while(st.hasMoreTokens()) {
			mail_Id = st.nextToken();
			mail_Domain = st.nextToken();
		}
		
		LoginDTO userInfor = new LoginDTO();
		userInfor.setPmember_email(mail_Id);
		userInfor.setPmember_domain(mail_Domain);
		
		userInfor.setPmember_code(usercodeMaker());
		
		userInfor.setPmember_firstname(first);
		userInfor.setPmember_lastname(last);
		
		userInfor.setPmember_birth(birth);
		userInfor.setPmember_phone(phone);
		
		LoginDAO dao = LoginDAO.getInstance();
		int check = dao.memberSignUp(userInfor);
		
		ActionForward forward = new ActionForward();
		if(check > 0) {
			long code_session = dao.getMemberCode(mail_Id);
			HttpSession session = request.getSession();
			session.setAttribute("member_code_session", code_session);
			session.setMaxInactiveInterval(60*60);
			
			forward.setRedirect(true);
			forward.setPath("view/main.jsp"); // 상단 클래스 >>
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+ "alert('문제가 발생하였습니다. 잠시후 다시 시도해주세요.');"
					+ "history.back();"
					+ "</script>");
		}
		return forward;
	}
	
	protected long usercodeMaker() {
		long result = 0;
		
		Calendar calendar = Calendar.getInstance();
		LoginDAO dao = LoginDAO.getInstance();
		
		while(true) {
			String year = Integer.toString(calendar.get(Calendar.YEAR));
			String month = Integer.toString(calendar.get(Calendar.MONTH)+1);
			String day = Integer.toString(calendar.get(Calendar.DAY_OF_MONTH));
			int ran = (int)(Math.random()*10000);
			
			result = Long.parseLong(year.substring(2) + month + day + ran);
			boolean check = dao.memberCodeCheck(result);
			if(check == true) {
				continue;
			} else {
				break;
			}
		}
		return result;
	}

}
