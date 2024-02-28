package com.dbms.objects;

public class UserQueList {
	String queID;
	String queName;
	String queDifficulty;
	String queCompany;
	
	public UserQueList(String queID, String queName, String queDifficulty) {
		this.queID = queID;
		this.queName = queName;
		this.queDifficulty = queDifficulty;
		this.queCompany = "No Companies";
		
	}
	public UserQueList(String queID, String queName, String queDifficulty, String queCompany) {
		this.queID = queID;
		this.queName = queName;
		this.queDifficulty = queDifficulty;
		this.queCompany = queCompany;
	}
	public String getQueID() {
		return queID;
	}
	public String getQueName() {
		return queName;
	}
	public String getQueDifficulty() {
		return queDifficulty;
	}
	public String getQueCompany() {
		return queCompany;
	}
	
	
}
