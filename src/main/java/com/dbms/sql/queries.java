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
	
	public static String addUserList = "Insert into usersListDetails values(?, ?, ?, ?, ?)";
	public static String createUserListTable = "CREATE TABLE %s ("
	        + "queID VARCHAR(20), queName VARCHAR(50), queDifficulty VARCHAR(10))";
	public static String createUserListTableCompany = "CREATE TABLE %s ("
	        + "queID VARCHAR(20), queName VARCHAR(50), queDifficulty VARCHAR(10), "
	        + "queCompany VARCHAR(30))";
	public static String addtoUserListTable = "INSERT INTO %s VALUES (?, ?, ?)";
	public static String addtoUserListTableCompany = "INSERT INTO %s VALUES (?, ?, ?, ?)";
	
	
	public static String getUserList = "select * from userslistdetails where userEmail = ?";
	
	public static String qetListQuestions = "Select * from %s "
			+ "left join userquestatus on %s.queID = userquestatus.queID";
}
