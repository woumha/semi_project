package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	// DAO 생성
    	ReviewDAO dao = new ReviewDAO();
    	HouseDAO houseDao = new HouseDAO();

        String id = req.getParameter("id");
        
        HouseReviewDTO houseReview = dao.selectCount(id);  // 리뷰 개수, 평균평점
        List<ReviewDTO> reviewList = dao.selectReviews(id);  // 리뷰 목록
        HouseDTO houseInfo = houseDao.selectHouseInfo(id);  // 숙소 정보
        
        dao.close(); // DB 연결 닫기

        // 전달할 데이터를 request 영역에 저장 후 DetailPage.jsp로 포워드
        req.setAttribute("reviewList", reviewList);
        req.setAttribute("houseReview", houseReview);
        req.setAttribute("houseInfo", houseInfo);
        req.getRequestDispatcher("/DetailPage/DetailPage.jsp").forward(req, resp);
    }
}
