<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>

  <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost:3306/phasetwo"  user="root" password="Qwer123!@#" />


<%
    String un = request.getParameter("uname");
    String pwd = request.getParameter("pwd");
    String role = "";

    try {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/phasetwo", "root", "Qwer123!@#");
        PreparedStatement statement = connection.prepareStatement("SELECT role FROM studentid WHERE Sname = ? AND pwd = ?");
        statement.setString(1, un);
        statement.setString(2, pwd);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            role = resultSet.getString("role");
            session.setAttribute("uname", un);
        }

        resultSet.close();
        statement.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    if (role.equals("admin")) {
        response.sendRedirect("admindashboard.jsp");
    } else if (role.equals("user")) {
        response.sendRedirect("dashboard.jsp");
    } else {
        response.sendRedirect("login.jsp?error=true");
    }
%>
