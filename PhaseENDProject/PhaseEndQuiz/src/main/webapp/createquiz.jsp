<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Quiz Question</title>
</head>
<body>
    <h2>Create Quiz Question</h2>
    <form action="QuizCreationServlet" method="post">
    	<label for="quiz">Quiz No:</label>
    	<input type="number" id="quiz" name="quiz" required><br><br>
    	<label for="questionnumber">Question No:</label>
    	<input type="number" id="quesionnumber" name="questionnumber" required><br><br>
        <label for="question">Question:</label><br>
        <input type="text" id="question" name="question" required><br><br>

        <label for="choice">Choice1:</label><br>
        <input type="text" id="choice" name="choice" required><br><br>
        <label for="choice2">Choice2:</label><br>
        <input type="text" id="choice2" name="choice2" required><br><br>
        
        <label for="correct">Correct Answer</label><br>
        <input type="text" id="correct" name="correct" required><br>
        <input type="submit" value="Create">
    </form>
</body>
</html>
