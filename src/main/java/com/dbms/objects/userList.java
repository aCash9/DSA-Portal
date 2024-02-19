package com.dbms.objects;

public class userList {
	String queID;
	String queName;
	String queStatus;
	String queDifficulty;
	String queCompany;
	
	public userList(String queID, String queName, String queStatus, String queDifficulty) {
		this.queID = queID;
		this.queName = queName;
		this.queStatus = queStatus;
		this.queDifficulty = queDifficulty;
		this.queCompany = "Default";
		
	}
	public userList(String queID, String queName, String queStatus, String queDifficulty, String queCompany) {
		this.queID = queID;
		this.queName = queName;
		this.queStatus = queStatus;
		this.queDifficulty = queDifficulty;
		this.queCompany = queCompany;
	}
	public String getQueID() {
		return queID;
	}
	public String getQueName() {
		return queName;
	}
	public String getQueStatus() {
		return queStatus;
	}
	public String getQueDifficulty() {
		return queDifficulty;
	}
	public String getQueCompany() {
		return queCompany;
	}
	
	
}
