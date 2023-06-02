<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<sql:setDataSource var="phasetwo" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/phasetwo" user="root" password="Qwer123!@#" />
<sql:query dataSource="${phasetwo}" sql="SELECT * FROM Quiz  " var="result" />
<sql:query dataSource="${phasetwo}" sql="SELECT * FROM Questions  " var="resultq" />
<body align="center">
<% out.println("<h1>Welcome "+session.getAttribute("uname")+"</h1>"); %>
<table border=1 align="center">
<tr>
<th>Profile-></th>
<th>Quiz-></th>
</tr>
<tr>
<td><a href="dashboard1.jsp">Click here</a></td>
<td><a href="quiz.jsp">Click here</a></td>
</tr>
</table><hr>
<h1>Available Quizes</h1><br>
<table border=1 align="center">
		<tr>
			<th>Quiz Number</th>
			<th>Question Number</th>

		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.qid}" /></td>
				<td><c:out value="${row.qno}" /></td>
			</tr>
		</c:forEach>
	</table><hr>
	<table border=1 align="center">
		<tr>
			<th>Question</th>
			<th>Choice1</th>
			<th>Choice2</th>
			<th>Answer</th>

		</tr>
		<c:forEach var="row" items="${resultq.rows}">
			<tr>
				<td><c:out value="${row.question}" /></td>
				<td><c:out value="${row.choice1}" /></td>
				<td><c:out value="${row.choice2}" /></td>
				<td><c:out value="${row.correcta}" /></td>
			</tr>
		</c:forEach>
	</table><hr>
<a href="index.jsp">LOGOUT</a>
</body>
</html>