package com.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.HouseDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HouseDTO dto = new HouseDTO();
		
		String saveFolder = "/Users/kimkyungyoung/workspace(jsp)/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/project_ex/upload";
				
		int fileSize = 10 * 1024 * 1024;
				
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String house_name = multi.getParameter("house_name").trim();
		String house_category = multi.getParameter("house_category").trim();
		String house_location = multi.getParameter("house_location").trim();
		int house_price = Integer.parseInt(multi.getParameter("house_price").trim());
		String house_content = multi.getParameter("house_content").trim();
		String house_phone = multi.getParameter("house_phone").trim();
		int house_person = Integer.parseInt(multi.getParameter("house_person").trim());
		float house_star = Float.parseFloat(multi.getParameter("house_star").trim());
		int house_water = Integer.parseInt(multi.getParameter("house_water"));
		int house_pool = Integer.parseInt(multi.getParameter("house_pool"));
		int house_ski = Integer.parseInt(multi.getParameter("house_ski"));
		int house_food = Integer.parseInt(multi.getParameter("house_food"));
		int house_parking = Integer.parseInt(multi.getParameter("house_parking"));
		int house_grill = Integer.parseInt(multi.getParameter("house_grill"));
		int house_smoking = Integer.parseInt(multi.getParameter("house_smoking"));
		int house_gym = Integer.parseInt(multi.getParameter("house_gym"));
		String house_update = multi.getParameter("house_update").trim();
		
		String upload_file1 = multi.getFilesystemName("house_img1");
		String upload_file2 = multi.getFilesystemName("house_img2");
		String upload_file3 = multi.getFilesystemName("house_img3");
		
		int house_no = Integer.parseInt(multi.getParameter("house_no"));
		
		
		
		dto.setHouse_no(house_no);
		dto.setHouse_name(house_name);
		dto.setHouse_category(house_category);
		dto.setHouse_location(house_location);
		dto.setHouse_price(house_price);
		dto.setHouse_content(house_content);
		dto.setHouse_phone(house_phone);
		dto.setHouse_person(house_person);
		dto.setHouse_star(house_star);
		dto.setHouse_img1(upload_file1);
		dto.setHouse_img2(upload_file2);
		dto.setHouse_img3(upload_file3);
		dto.setHouse_water(house_water);
		dto.setHouse_pool(house_pool);
		dto.setHouse_ski(house_ski);
		dto.setHouse_food(house_food);
		dto.setHouse_parking(house_parking);
		dto.setHouse_grill(house_grill);
		dto.setHouse_smoking(house_smoking);
		dto.setHouse_gym(house_gym);
		dto.setHouse_update(house_update);
		
		HouseDAO dao = HouseDAO.getInstance();
		int res = dao.modifyUpload(dto);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_content.do?no="+house_no);
		} else {
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}