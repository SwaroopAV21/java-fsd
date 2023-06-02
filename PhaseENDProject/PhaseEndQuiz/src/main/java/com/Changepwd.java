package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Changepwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		String username = (String) session.getAttribute("uname");
	    String currentPassword = request.getParameter("currentPassword");
	    String newPassword = request.getParameter("newPassword");
	    boolean passwordChanged = false;

	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/phasetwo", "root", "Qwer123!@#");
	        PreparedStatement statement = connection.prepareStatement("SELECT * FROM studentid WHERE Sname = ? AND pwd = ?");
	        statement.setString(1, username);
	        statement.setString(2, currentPassword);
	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            resultSet.close();
	            statement.close();

	            PreparedStatement updateStatement = connection.prepareStatement("UPDATE studentid SET pwd = ? WHERE Sname = ?");
	            updateStatement.setString(1, newPassword);
	            updateStatement.setString(2, username);
	            updateStatement.executeUpdate();
	            updateStatement.close();

	            passwordChanged = true;
	        } else {
	            resultSet.close();
	            statement.close();
	        }

	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    catch(ClassNotFoundException e) {
	    	e.printStackTrace();
	    }

	    if (passwordChanged) {
	        response.sendRedirect("admindashboard.jsp");
	    } else {
	        response.sendRedirect("profile.jsp");
	    }
	}
}
