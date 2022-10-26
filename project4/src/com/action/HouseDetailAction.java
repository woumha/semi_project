package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseReviewDTO;
import com.model.ReviewDAO;
import com.model.ReviewDTO;
import com.model.HouseDAO;
import com.model.HouseDTO;

public class HouseDetailAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ReviewDAO dao = new ReviewDAO();
    	HouseDAO houseDao = new HouseDAO();

        String id = request.getParameter("id");
        
        HouseReviewDTO houseReview = dao.selectCount(id);  // 리뷰 개수, 평균평점
        List<ReviewDTO> reviewList = dao.selectReviews(id);  // 리뷰 목록
        HouseDTO houseInfo = houseDao.selectHouseInfo(id);  // 숙소 정보

        // 전달할 데이터를 request 영역에 저장 후 houseDetail.jsp로 포워드
        request.setAttribute("reviewList", reviewList);
        request.setAttribute("houseReview", houseReview);
        request.setAttribute("houseInfo", houseInfo);
        
        ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
			
		forward.setPath("view/houseDetail.jsp");
		
		return forward;
	}

}
