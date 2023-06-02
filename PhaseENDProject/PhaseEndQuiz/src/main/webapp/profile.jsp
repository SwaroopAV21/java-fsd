<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<body align="center">
<h3>LeaderBoard</h3>

	<sql:setDataSource var="phasetwo" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/phasetwo" user="root" password="Qwer123!@#" />
		
	<sql:query dataSource="${phasetwo}" sql="SELECT * FROM student ORDER BY marks DESC " var="result" />

	<table border=1 align="center">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Marks</th>

		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.id}" /></td>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.marks}" /></td>
				<td><a href="delete.jsp">Delete</a></td>
				<td><a href="changepwd.jsp">Change password</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>