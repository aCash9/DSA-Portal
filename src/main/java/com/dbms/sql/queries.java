package com.dbms.sql;

public class queries {
	public static String addUser = "insert into users values(?, ?, ?)";
	public static String verifyUser = "Select * from users where email = ? and password = ?";
	public static String addQuestion = "insert into questions values(?, ?, ?, ?, ?)";
	public static String getUserName = "Select name from users where email = ?";
	public static String getQuestions = "Select * from questions where queCategory = ?";
}
