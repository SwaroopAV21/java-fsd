<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Details</title>
</head>
<body align="center">

    <%-- Database Connection Parameters --%>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/phasetwo" user="root" password="Qwer123!@#" />
    
     <%-- Update Form --%>
    <h2>Update Student Name</h2>
    <form action="" method="POST">
        <label for="id">ID:</label>
        <input type="text" name="id" id="id" required><br><br>
        <label for="name">New Name:</label>
        <input type="text" name="newName" id="newName" required><br><br>
        <input type="submit" value="Update">
    </form>

    <%-- Update Logic --%>
    <sql:update dataSource="${dataSource}" var="updateResult">
        UPDATE student SET name = ? WHERE id = ?
        <sql:param value="${param.newName}" />
        <sql:param value="${param.id}" />
    </sql:update>

    <%-- Displaying Update Result --%>
    <c:if test="${updateResult > 0}">
        <p>Update successful!</p>
    </c:if>
</body>
</html>