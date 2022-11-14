package com.action;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class KakaoLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("mail");
		StringTokenizer st = new StringTokenizer(email, "@");
		String mail = st.nextToken();
		String domain = st.nextToken();
		
		pmemberDTO dto = new pmemberDTO();
		dto.setPmember_email(mail);
		dto.setPmember_domain(domain);
		
		pmemberDAO dao = pmemberDAO.getInstance();
		int check = dao.getKakaoLogin(dto);
		
		ActionForward forward = new ActionForward();
		if(check == 1) { //회원일시
			forward.setRedirect(false);
			forward.setPath("house_list.do");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("membermail", email);
			forward.setRedirect(true);
			forward.setPath("/project4/view/memberSignUp.jsp");
		}
		
		return forward;
	}

}
