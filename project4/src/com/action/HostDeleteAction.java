package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HostingDAO;

public class HostDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int house_no = Integer.parseInt(request.getParameter("no").trim());
		long pmember_code = Long.parseLong(request.getParameter("pcode").trim());
		
		HostingDAO dao = HostingDAO.getInstance();
		
		int check = dao.deleteHouse(house_no);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			
			forward.setRedirect(true);
			
			forward.setPath("host_list.do?pcode="+pmember_code);
		}else {
			out.println("<script>");
			out.println("alert('제품 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
