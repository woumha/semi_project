package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HostingDAO;
import com.model.HouseDTO;

public class HostListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		long pcode = Long.parseLong(request.getParameter("pcode").trim());
		System.out.println("pcod >>> " + pcode);
		
		HostingDAO dao = HostingDAO.getInstance();
		
		int rowsize = 10;

		int block = 5;

		int totalRecord = 0;
 
		int allPage = 0;
		
		int page = 0;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		System.out.println("page >>> " + page);
		
		int startNo = (page * rowsize) - (rowsize - 1);
		System.out.println("startNo >>> " + startNo);
		
		int endNo = (page * rowsize);
		System.out.println("endNo >>> " + endNo);
		
		int startBlock = (((page - 1) / block) * block) + 1;
		System.out.println("startBlock >>> " + startBlock);
		
		int endBlock = (((page - 1) / block) * block) + block;
		System.out.println("endBlock >>> " + endBlock);
		
		totalRecord = dao.getHostCount(pcode);
		System.out.println("totalRecord >>> " + totalRecord);
		System.out.println("rowsize >>> " + rowsize);
		System.out.println("=====================================================");
		double test1 = totalRecord / rowsize;             System.out.println("test1 >>>" + test1);
		double test2 = (13 % 10) * 0.1;                   System.out.println("test2 >>>" + test2);
		double test3 = test1 + test2;                     System.out.println("test3 >>>" + test3);
		
		double allPage_test = Math.ceil(test3);
		System.out.println("allPage_test >>>" + allPage_test);
		System.out.println("=====================================================");
		
		allPage = (int)allPage_test;
		System.out.println("allPage >>> " + allPage);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}

		List<HouseDTO> Hostlist = dao.getHostList(pcode, page, rowsize);
		
		request.setAttribute("HostList", Hostlist);
		
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
		
		forward.setPath("view/hosting.jsp");
		
		return forward;
	}

}
