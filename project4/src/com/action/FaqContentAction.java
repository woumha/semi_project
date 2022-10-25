package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.FaqDAO;
import com.model.FaqDTO;

public class FaqContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		FaqDAO dao = FaqDAO.getInstance();
		
		dao.faqHit(no);
		
		FaqDTO cont = dao.getFaqContent(no);
		
		
		return null;
	}

}
