<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
</head>
<body align="center">
    <h1>Quiz</h1>

    <%-- Database Connection Parameters --%>
  <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost:3306/phasetwo"  user="root" password="Qwer123!@#" />

    <%-- Retrieve Logged-in User ID from Session --%>
    <%-- Assuming the user ID is stored in the session as "userId" --%>
    <c:set var="uname" value="${sessionScope.uname}" />

    <%-- Quiz Questions --%>
 <sql:query dataSource="${dataSource}" var="showquestions"> SELECT question ,choice1 ,choice2  FROM Questions </sql:query>
 <table border=1 align="center">
		<tr>
			<th>Question</th>
			<th>Choice1</th>
			<th>Choice2</th>
		</tr>
		<c:forEach var="row" items="${showquestions.rows}">
			<tr>
				<td><c:out value="${row.question}" /></td>
				<td><c:out value="${row.choice1}"  /></td>
				<td><c:out value="${row.choice2}" /></td>
				</tr>
				</c:forEach>
</table>
<label for="q1">Enter your choice number:</label><br>
<form action="" method="POST">
A<input type="radio" id="a1" name="a1"  value="Delhi"/><br>
B<input type="radio" id="a1" name="a1"  value="Bengaluru"/><br>
<button>Submit</button>
</form>

    <%-- Quiz Submission Logic --%>
    <c:if test="${not empty param.a1}">
        <%-- Calculate Quiz Score --%>
        <c:set var="score" value="0" />
        <c:if test="${param.a1 == 'Delhi'}">
            <c:set var="score" value="${score + 1}" />
        </c:if>
         <%-- Update Score in Database --%>
        <sql:update dataSource="${dataSource}" var="updateResult">
            UPDATE student SET marks = ? WHERE name = ?
            <sql:param value="${score}" />
            <sql:param value="${uname}" />
        </sql:update>

        <%-- Display Submission Result --%>
        <c:if test="${updateResult > 0}">
            <p>Quiz submitted successfully. Your score: ${score}</p>
        </c:if>
    </c:if>
</body>
</html>
