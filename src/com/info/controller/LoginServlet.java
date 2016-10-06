package com.info.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3310838084585318164L;

	InputStream inputStream = null;
	Properties properties = new Properties();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/**
		 * Read Properties file and check the login credentials of given user
		 */

		inputStream = getServletContext().getResourceAsStream("/WEB-INF/config.properties");
		properties.load(inputStream);
		String username = properties.getProperty("user.name");
		String username1 = properties.getProperty("user.name1");
		String password = properties.getProperty("user.password");
		String password1 = properties.getProperty("user.password1");

		String reqUserName = req.getParameter("UserName");
		String reqPassword = req.getParameter("Password");

		String actionForward = "login.jsp";
        // validating the user
		if (reqUserName.equalsIgnoreCase(username) && reqPassword.equalsIgnoreCase(password)) {
			actionForward = "/jsp/home.jsp";
		} else if (reqUserName.equalsIgnoreCase(username1) && reqPassword.equalsIgnoreCase(password1)) {
			actionForward = "/jsp/home.jsp";
		}

		RequestDispatcher rd = req.getRequestDispatcher(actionForward);

		rd.forward(req, resp);
	}

}
