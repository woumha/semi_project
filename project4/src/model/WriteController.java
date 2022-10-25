package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ReviewDTO dto = new ReviewDTO();
        dto.setHouseNo(Integer.parseInt(req.getParameter("houseNo")));
        dto.setMemberId(req.getParameter("memberId"));
        dto.setContents(req.getParameter("contents"));
        dto.setGrade(Integer.parseInt(req.getParameter("grade")));

        // DAO를 통해 DB에 리뷰 내용 저장
        ReviewDAO dao = new ReviewDAO();
        int result = dao.insertWrite(dto);
        dao.close();
        
        req.setAttribute("result", result);
        req.getRequestDispatcher("/DetailPage/DetailPage.jsp").forward(req, resp);

    }}
