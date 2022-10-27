package com.controller;

import java.io.*;
import java.lang.reflect.Constructor;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.controller.Action;
import com.controller.ActionForward;

public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String uri = request.getRequestURI();
		System.out.println("URI >>> " + uri);

		String path = request.getContextPath();
		System.out.println("Path >>> " + path);
		
		String command = uri.substring(path.length() + 1);
		System.out.println("Command >>> " + command);
		
		
		Action action = null;
		ActionForward forward = null;
		
		Properties pro = new Properties();
		
		FileInputStream fis = 
				new FileInputStream("C:\\Users\\user1\\git\\projects\\project4\\src\\com\\controller\\mapping.properties");
		
		pro.load(fis);
		
		String value = pro.getProperty(command);
		System.out.println("Value >>> " + value);
		
		if (value.substring(0, 7).equals("execute")) {
			StringTokenizer st = 
					new StringTokenizer(value, "|");
			
			String url_1 = st.nextToken();
			String url_2 = st.nextToken();
			
			try {
				Class<?> url = Class.forName(url_2);
				
				Constructor<?> constructor = 
								url.getConstructor();
				
				action = (Action)constructor.newInstance();
				
				forward = action.execute(request, response);
				
				System.out.println("FrontController forward >>> " + forward);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else { 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher rd = 
					request.getRequestDispatcher(forward.getPath());
				
				rd.forward(request, response);
			}
		}
		
	} 

}
