package com.action;

import java.io.IOException;
import java.util.Calendar;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.LoginDAO;
import com.model.LoginDTO;
import com.model.pmemberDTO;

public class loginAPICheckAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("apiName");
		String email = request.getParameter("apiEmail");
		String birth = request.getParameter("apiBirth");
		String year = request.getParameter("apiYear");
		String mobile = request.getParameter("apiMobile");
		
		pmemberDTO userInfor = new pmemberDTO();
		StringTokenizer st = new StringTokenizer(email, "@");
		userInfor.setPmember_email(st.nextToken());
		userInfor.setPmember_domain(st.nextToken());
		
		userInfor.setPmember_firstname(name.substring(0, 1));
		userInfor.setPmember_lastname(name.substring(1));
		
		System.out.println("birth: " + birth);
		System.out.println("year: " + year);
		System.out.println("mobile: " + mobile);
		
		
		
		
		return null;
	}
	
	protected long usercodeMaker() {
		long result = 0;
		
		Calendar calendar = Calendar.getInstance();
		LoginDAO dao = LoginDAO.getInstance();
		
		while(true) {
			String year = Integer.toString(calendar.get(Calendar.YEAR));
			String month = Integer.toString(calendar.get(Calendar.MONTH)+1);
			String day = Integer.toString(calendar.get(Calendar.DAY_OF_MONTH));
			Random random = new Random();
			int ran = random.nextInt(9999 - 1000 +1) + 1000;
			
			result = Long.parseLong(year.substring(2) + month + day + ran);
			
			boolean check = dao.memberCodeCheck(result);
			if(check == true) {
				continue;
			} else {
				break;
			}
		}
		return result;
	}
}
