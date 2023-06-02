<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
</head>
<body align="center">
    <h1>User Details</h1>
    
    <%-- Database Connection Parameters --%>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost:3306/phasetwo"  user="root" password="Qwer123!@#" />

    <%-- Retrieve Logged-in User ID from Session --%>
    <%-- Assuming the user ID is stored in the session as "userId" --%>
    <c:set var="uname" value="${sessionScope.uname}" />

    <%-- Retrieve User Details from the Database --%>
    <sql:query dataSource="${dataSource}" var="userDetails">
        SELECT id, name, marks FROM student WHERE name = ?
        <sql:param value="${uname}" />
    </sql:query>
    
    
<%-- Display User Details --%>
    <c:choose>
        <%-- Check if user details are retrieved --%>
        <c:when test="${not empty userDetails.rows}">
        <table border=1 align="center">
        <tr>
			<th>ID</th>
			<th>Name</th>
			<th>Marks</th>
		</tr>
            <c:forEach var="user" items="${userDetails.rows}">
            <tr>
                <td><p>ID: ${user.id}</p></td>
                <td><p>Name: ${user.name}</p></td>
                <td><p>Marks: ${user.marks}</p></td>
                </tr>
            </c:forEach>
            </table>
        </c:when>
        <%-- Display error message if no user details found --%>
        <c:when test="${userDetails.rowCount == 0}">
            <p>User details not found for ${uname}.</p>
        </c:when>
        <%-- Display error message for database retrieval issues --%>
        <c:otherwise>
            <p>Error retrieving user details. Please try again later.</p>
        </c:otherwise>
    </c:choose>

</body>
</html>
