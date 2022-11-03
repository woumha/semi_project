package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class AdminHouseListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//house_페이징 처리 작업
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
			
			HouseDAO dao = HouseDAO.getInstance();
			
			totalRecord = dao.getHouseCount();
				
			allPage = (int)Math.ceil(totalRecord / (double)rowsize);
				
				if(endBlock > allPage) {
					endBlock = allPage;
				}
				
				//현재 페이지에 해당하는 게시물을 가져오는 메서드 호출
				List<HouseDTO> pageList = dao.getHList(page, rowsize);
				
				request.setAttribute("page", page);
				request.setAttribute("rowsize", rowsize);
				request.setAttribute("block", block);
				request.setAttribute("totalRecord", totalRecord);
				request.setAttribute("allPage", allPage);
				request.setAttribute("startNo", startNo);
				request.setAttribute("endNo", endNo);
				request.setAttribute("startBlock", startBlock);
				request.setAttribute("endBlock", endBlock);
				request.setAttribute("List", pageList);
				
				//member_페이징 처리 작업
				int p_rowsize = 2;
				int p_block = 2;
				int p_totalRecord = 0;
				int p_allPage = 0;
				int p_page = 0;	
						
				if(request.getParameter("p_page") != null) {
					p_page = Integer.parseInt(request.getParameter("p_page").trim());
				} else {
					p_page = 1;
				}
					int p_startNo = (p_page*p_rowsize) - (p_rowsize - 1);
					int p_endNo = (p_page * p_rowsize);
					int p_startBlock = (((p_page -1)/p_block) * p_block) + 1; 
					int p_endBlock = (((p_page -1)/p_block) * p_block) + p_block; 
					
					pmemberDAO p_dao = pmemberDAO.getInstance();
					
					p_totalRecord = p_dao.getPmemberCount();
						
					p_allPage = (int)Math.ceil(p_totalRecord / (double)p_rowsize);
						
						if(p_endBlock > p_allPage) {
							p_endBlock = p_allPage;
						}
				
				List<pmemberDTO> p_pageList = p_dao.getPlist(p_page, p_rowsize);
				request.setAttribute("p_page", p_page);
				request.setAttribute("p_rowsize", p_rowsize);
				request.setAttribute("p_block", p_block);
				request.setAttribute("p_totalRecord", p_totalRecord);
				request.setAttribute("p_allPage", p_allPage);
				request.setAttribute("p_startNo", p_startNo);
				request.setAttribute("p_endNo", p_endNo);
				request.setAttribute("p_startBlock", p_startBlock);
				request.setAttribute("p_endBlock", p_endBlock);
				request.setAttribute("p_List", p_pageList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_house_list.jsp");
		return forward;
	}
}