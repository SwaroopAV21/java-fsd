<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Details Details</title>
</head>
<body align="center">

    <%-- Database Connection Parameters --%>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/phasetwo" user="root" password="Qwer123!@#" />

<%-- Insertion Form --%>
    <h2>Insert New Student</h2>
    <form action="" method="POST">
        <label for="id">ID:</label>
        <input type="text" name="id" id="id" required><br><br>
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required><br><br>
        <label for="marks">Marks:</label>
        <input type="text" name="marks" id="marks" required><br><br>
        <label for="pwd">Password</label>
        <input type="text" name="pwd" id="pwd"/><br><br>
        <label for="role">User or Admin:</label>
        <input type="text" name="role" id="role" required><br><br>
        <input type="submit" value="Insert">
    </form>

    <%-- Insertion Logic --%>
    <c:if test="${not empty param.id and not empty param.name and not empty param.marks}">
        <sql:update dataSource="${dataSource}" var="insertResult">
            INSERT INTO student (id, name, marks)
            VALUES (?, ?, ?)
            <sql:param value="${param.id}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.marks}" />
        </sql:update>
        </c:if>
        <c:if test="${not empty param.name and not empty param.pwd}">
        <sql:update dataSource="${dataSource}" var="insertResult1">
            INSERT INTO studentid (Sname, pwd , role)
            VALUES (?, ?, ? )
            <sql:param value="${param.name}" />
            <sql:param value="${param.pwd}" />
            <sql:param value="${param.role}" />
        </sql:update>
        </c:if>

        <%-- Displaying Insertion Result --%>
        <c:if test="${insertResult > 0}">
            <p>Insertion successful!</p>
        </c:if>
</body>
</html>
