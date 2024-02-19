package com.dbms.sql;

public class queries {
	public static String addUser = "insert into users values(?, ?, ?)";
	public static String verifyUser = "Select * from users where email = ? and password = ?";
	public static String addQuestion = "insert into questions values(?, ?, ?, ?, ?)";
	public static String getUserName = "Select name from users where email = ?";
	//public static String getQuestions = "Select * from questions where queCategory = ?";
	public static String updateUserQue = "Insert into userquestatus values (?, ?, ?)"
			+ "on duplicate key update status = ?";
	public static String getQuestions = "SELECT * "
			+ "FROM questions "
			+ "LEFT JOIN userquestatus ON questions.queID = userquestatus.queID AND userquestatus.email = ? "
			+ "WHERE questions.queCategory = ?";
}
