<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Values</title>
</head>
<body align="center">
    <%-- Database Connection Parameters --%>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/phasetwo" user="root" password="Qwer123!@#" />

    <%-- Deletion Form --%>
    <h2>Delete Value</h2>
    <form action="" method="POST">
        <label for="id">ID:</label>
        <input type="text" name="id" id="id" required><br><br>
        <input type="submit" value="Delete">
    </form>

    <%-- Deletion Logic --%>
    <sql:update dataSource="${dataSource}" var="deleteResult">
        DELETE FROM student WHERE id = ?
        <sql:param value="${param.id}" />
    </sql:update>

    <%-- Displaying Deletion Result --%>
    <c:if test="${deleteResult > 0}">
        <p>Deletion successful!</p>
    </c:if>
</body>
</html>
