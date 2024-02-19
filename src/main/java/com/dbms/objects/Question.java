package com.dbms.objects;

public class Question {
	String queId;
	String queLink;
	String queDifficulty;
	String queCategory;
	String queName;
	String queStatus;
	
	public Question(String queId, String queLink, String queDifficulty, String queCategory, String queName,
			String queStatus) {
		super();
		this.queId = queId;
		this.queLink = queLink;
		this.queDifficulty = queDifficulty;
		this.queCategory = queCategory;
		this.queName = queName;
		this.queStatus = queStatus;
	}
	
	public String getQueStatus() {
		return queStatus;
	}

	public String getQueId() {
		return queId;
	}

	public String getQueLink() {
		return queLink;
	}

	public String getQueDifficulty() {
		return queDifficulty;
	}

	public String getQueCategory() {
		return queCategory;
	}

	public String getQueName() {
		return queName;
	}

	
}
