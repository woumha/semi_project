package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HostingDAO;
import com.model.HouseDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HostModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 첨부파일이 저장될 위치(경로) 설정.
		String saveFolder = "C:\\NCS\\workspace(jsp)\\project6\\WebContent\\upload";
				
		// 첨부파일 용량(크기) 제한 - 파일 업로드 최대 크기
		int fileSize = 10 * 1024 * 1024;  // 10MB
				
		// 이미지파일 업로드를 위한 객체 생성.
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		int house_no = Integer.parseInt(multi.getParameter("house_no").trim());
		String house_name = multi.getParameter("house_name").trim();
		String house_category = multi.getParameter("house_category").trim();
		String house_location = multi.getParameter("house_location").trim();
		int house_price = Integer.parseInt(multi.getParameter("house_price").trim());
		String house_content = multi.getParameter("house_content").trim();
		String house_phone = multi.getParameter("house_phone").trim();
		int house_person = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_water = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_pool = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_ski = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_food = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_parking = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_grill = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_smoking = Integer.parseInt(multi.getParameter("house_person").trim());
		int house_gym = Integer.parseInt(multi.getParameter("house_person").trim());
		String house_img1 = multi.getFilesystemName("house_img1");
		if(house_img1 == null) {house_img1 = multi.getParameter("house_img1_old");}
		String house_img2 = multi.getFilesystemName("house_img2");
		if(house_img2 == null) {house_img2 = multi.getParameter("house_img2_old");}
		String house_img3 = multi.getFilesystemName("house_img3");
		if(house_img3 == null) {house_img3 = multi.getParameter("house_img3_old");}
		
		/* long pmember_code = Long.parseLong(request.getParameter("pcode").trim()); */
		
		HouseDTO dto = new HouseDTO();
		
		dto.setHouse_no(house_no);
		dto.setHouse_name(house_name);
		dto.setHouse_category(house_category);
		dto.setHouse_location(house_location);
		dto.setHouse_price(house_price);
		dto.setHouse_content(house_content);
		dto.setHouse_phone(house_phone);
		dto.setHouse_person(house_person);
		dto.setHouse_water(house_water);
		dto.setHouse_pool(house_pool);
		dto.setHouse_ski(house_ski);
		dto.setHouse_food(house_food);
		dto.setHouse_parking(house_parking);
		dto.setHouse_grill(house_grill);
		dto.setHouse_smoking(house_smoking);
		dto.setHouse_gym(house_gym);
		dto.setHouse_img1(house_img1);
		dto.setHouse_img2(house_img2);
		dto.setHouse_img3(house_img3);
		
		HostingDAO dao = HostingDAO.getInstance();
		
		int check = dao.UpdateHouse(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			forward.setRedirect(true);
			
			forward.setPath("host_content.do?no="+house_no);
		}else {
			out.println("<script>");
			out.println("alert('정보 수정에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
