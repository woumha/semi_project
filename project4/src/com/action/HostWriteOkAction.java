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


public class HostWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HouseDTO dto = new HouseDTO();
		
		// 파일 업로드 시에는 설정 내용이 있음.
		// 1. 첨부 파일 저장 경로 지정.
		String saveFolder = 
			"C:\\NCS\\workspace(jsp)\\project6\\WebContent\\upload";
		
		// 2. 첨부 파일 크기 지정.
		int fileSize = 10 * 1024 * 1024;  // 10MB
		
		// 3. MuitlpartRequest 객체 생성
		//    ==> 파일 업로드를 진행하기 위한 객체 생성.
		MultipartRequest multi = new MultipartRequest(
				request,          // 일반적인 request 객체.
				saveFolder,       // 첨부파일이 저장될 경로.
				fileSize,         // 업로드할 첨부파일의 최대 크기.
				"UTF-8",          // 문자 인코딩 방식
				new DefaultFileRenamePolicy()
				// 파일의 이름이 같은 경우 중복이 안되게 설정.
		);
		
		// 이전 페이지에서 넘어온 자료들을 받아주자
		String house_name = multi.getParameter("house_name").trim();
		
		String house_category = multi.getParameter("house_category").trim();
		
		String house_location = multi.getParameter("house_location").trim();
		
		int house_price = Integer.parseInt(multi.getParameter("house_price").trim());
		
		String house_content = multi.getParameter("house_content").trim();
		
		String house_phone = multi.getParameter("house_phone").trim();
		
		int house_person = Integer.parseInt(multi.getParameter("house_person").trim());
		
		// 자료실 폼 페이지에서 type="file" 로 되어 있으면
		// getFile() 메서드로 받아주어야 함.
		String house_img1 = multi.getFilesystemName("house_img1");
		String house_img2 = multi.getFilesystemName("house_img2");
		String house_img3 = multi.getFilesystemName("house_img3");		
		
		// 0 or 1
		int house_water = Integer.parseInt(multi.getParameter("house_water").trim());
		int house_pool = Integer.parseInt(multi.getParameter("house_pool").trim());
		int house_ski = Integer.parseInt(multi.getParameter("house_ski").trim());
		int house_food = Integer.parseInt(multi.getParameter("house_food").trim());
		int house_parking = Integer.parseInt(multi.getParameter("house_parking").trim());
		int house_grill = Integer.parseInt(multi.getParameter("house_grill").trim());
		int house_smoking = Integer.parseInt(multi.getParameter("house_smoking").trim());
		int house_gym = Integer.parseInt(multi.getParameter("house_gym").trim());
		System.out.println("===== 옵션확인용 ================================");
		System.out.println("house_water >>> " + house_water);
		System.out.println("house_pool >>> " + house_pool);
		System.out.println("house_ski >>> " + house_ski);
		System.out.println("house_food >>> " + house_food);
		System.out.println("house_parking >>> " + house_parking);
		System.out.println("house_gril >>> " + house_grill);
		System.out.println("house_smoking >>> " + house_smoking);
		System.out.println("house_gym >>> " + house_gym);
		System.out.println("===== 옵션확인용 끝 ===============================");
		
		// 히든으로 넘어온 데이터도 받아주어야 한다.
		long pmember_code = Long.parseLong(multi.getParameter("pcode"));
		
		HostingDAO dao = HostingDAO.getInstance();
		
		// house_owner 이름 first + last 합쳐서 입력
		String ownerName = dao.getOwnerName(pmember_code);
		
		System.out.println("ownerName >>> " + ownerName);
		
		dto.setHouse_owner(ownerName);
		dto.setPmember_code(pmember_code);
		dto.setHouse_name(house_name);
		dto.setHouse_category(house_category);
		dto.setHouse_location(house_location);
		dto.setHouse_price(house_price);
		dto.setHouse_content(house_content);
		dto.setHouse_phone(house_phone);
		dto.setHouse_person(house_person);
		dto.setHouse_img1(house_img1);
		dto.setHouse_img2(house_img2);
		dto.setHouse_img3(house_img3);
		dto.setHouse_water(house_water);
		dto.setHouse_pool(house_pool);
		dto.setHouse_ski(house_ski);
		dto.setHouse_food(house_food);
		dto.setHouse_parking(house_parking);
		dto.setHouse_grill(house_grill);
		dto.setHouse_smoking(house_smoking);
		dto.setHouse_gym(house_gym);

		int res = dao.writeHost(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			
			forward.setPath("host_list.do?pcode="+pmember_code);
		}else {
			out.println("<script>");
			out.println("alert('숙소 등록에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
