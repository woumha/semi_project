package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ResDAO;
import com.model.ResDTO;

public class ResListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		long pcode = Long.parseLong(request.getParameter("pcode").trim());
		System.out.println("pcode >>> " + pcode);
		
		ResDAO dao = ResDAO.getInstance();
		
		
		int rowsize = 10;
		int block = 5;
		int totalRecord = 0;
		int allPage = 0;
		int page = 0;	
				
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		} else {
			page = 1;
		}
			int startNo = (page*rowsize) - (rowsize - 1);
			int endNo = (page * rowsize);
			int startBlock = (((page -1)/block) * block) + 1; 
			int endBlock = (((page -1)/block) * block) + block; 
			
			totalRecord = dao.getResCount(pcode);
				
			allPage = (int)Math.ceil(totalRecord / (double)rowsize);
				
		if(endBlock > allPage) {
			endBlock = allPage;
		}

		List<ResDTO> Reslist = dao.getResList(pcode, page, rowsize);
		
		request.setAttribute("ResList", Reslist);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);	
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("res/res_list.jsp");
		
		return forward;
	}
}