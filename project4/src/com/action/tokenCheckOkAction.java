package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.LoginDAO;
import com.model.pmemberDTO;
import com.model.userTokenDTO;

public class tokenCheckOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 유저가 입력한 인증코드를 비교하는 클래스
		HttpSession session = request.getSession();
		userTokenDTO save = (userTokenDTO)session.getAttribute("user"); 
		String inPutToken = request.getParameter("inputToken");
		
		//session.setMaxInactiveInterval(3*60); 세션 3분 후에 종료
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		StringTokenizer st = new StringTokenizer(save.getEmail(), "@");
		String mail_Id = "";
		mail_Id = st.nextToken();
		
		if(!save.getToken().equals(inPutToken)) {
			out.println("<script>"
					+ "alert('인증번호가 일치하지 않습니다.');"
					+ "history.back();"
					+ "</script>");
		} else if(save.getToken().equals(inPutToken)) {
			LoginDAO loginDB = LoginDAO.getInstance();
			
			int memberCheck = loginDB.MemberCheck(mail_Id);
			
			if(memberCheck == 1) { // 로그인
				LoginDAO dao = LoginDAO.getInstance();
				long code_session = dao.getMemberCode(mail_Id);
				String code_name_session = dao.getMemberName(mail_Id);
				String code_phone_session = dao.getMemberPhone(mail_Id);
				int level = dao.getMemberLevel(mail_Id);
				
				session.setAttribute("member_code_session", code_session);
				session.setAttribute("m_name", code_name_session);
				session.setAttribute("m_phone", code_phone_session);
				
				// 추가된 코드 22-11-09 ==============================================================================
				session.setAttribute("member_level", level);

				System.out.println("===================================================================");
				System.out.println("접속유저 레벨 <<<" + level + ">>>");
				System.out.println("===================================================================");
				// =================================================================================================
				
				session.setMaxInactiveInterval(60*60);
				forward.setRedirect(true);
				forward.setPath("view/main.jsp"); // 로그인시 메인 >> 회원등급 판단도 해야함
			} else if(memberCheck == 0) { // 회원가입
				forward.setRedirect(true);
				forward.setPath("view/memberSignUp.jsp");
			}
		} // 인증번호 확인
		
		return forward;
	}
}
