package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuizCreationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String question = request.getParameter("question");
        String choice = request.getParameter("choice");
        String choice2 = request.getParameter("choice2");
        String correct = request.getParameter("correct");
        int qid =Integer.parseInt(request.getParameter("quiz"));
        int qno =Integer.parseInt(request.getParameter("questionnumber"));
        PrintWriter out=response.getWriter();

        try {
            // Establish database connection
        	Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/phasetwo", "root", "Qwer123!@#");


            // Prepare the SQL statement
            String sql = "INSERT INTO Questions (question, choice1, choice2 , correcta) VALUES (?, ?, ?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question);
            statement.setString(2, choice);
            statement.setString(3, choice2);
            statement.setString(4, correct);

            
            //enter the quiz number and the question number
            String sq2 ="INSERT INTO Quiz (qid ,qno) VALUES(? ,?)";
            PreparedStatement statement2 = connection.prepareStatement(sq2);
            statement2.setInt(1, qid );
            statement2.setInt(2, qno);
            statement2.executeUpdate();
            
            // Execute the SQL statement
            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                out.println("Question and choice added successfully.");
            } else {
                out.println("Failed to add question and choice.");
            }

            // Clean up resources
            statement.close();
            statement2.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch(ClassNotFoundException e) {
        	e.printStackTrace();
        }
    }
}
