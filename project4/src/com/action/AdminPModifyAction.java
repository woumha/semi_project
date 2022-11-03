package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class AdminPModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pmember_firstname = request.getParameter("pmember_firstname").trim();
		String pmember_lastname = request.getParameter("pmember_lastname").trim();
		int pmember_birth = Integer.parseInt(request.getParameter("pmember_birth").trim());
		String pmember_phone = request.getParameter("pmember_phone").trim();
		String pmember_email = request.getParameter("pmember_email").trim();
		String pmember_domain = request.getParameter("pmember_domain").trim();
		String pmember_gender = request.getParameter("pmember_gender").trim();
		
		long pmember_code = Long.parseLong(request.getParameter("pmember_code").trim());
		
		pmemberDTO dto = new pmemberDTO();
		dto.setPmember_code(pmember_code);
		dto.setPmember_firstname(pmember_firstname);
		dto.setPmember_lastname(pmember_lastname);
		dto.setPmember_birth(pmember_birth);
		dto.setPmember_phone(pmember_phone);
		dto.setPmember_email(pmember_email);
		dto.setPmember_domain(pmember_domain);
		dto.setPmember_gender(pmember_gender);
		
		pmemberDAO dao = pmemberDAO.getInstance();
		int res = dao.updateMem(dto);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_pcontent.do?no="+pmember_code);
		}else {
			out.println("<script>");
			out.println("alert('게시글 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}