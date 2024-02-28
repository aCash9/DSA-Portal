package com.dbms.objects;

import java.util.List;

public class UserList {
	private String listName;
    private String listDescription;
    private String includeCompany;
    private String userEmail;
    private List<UserQueList> queList;
    
	public UserList(String listName, String listDescription, String includeCompany, String userEmail,
			List<UserQueList> queList) {
		this.listName = listName;
		this.listDescription = listDescription;
		this.includeCompany = includeCompany;
		this.userEmail = userEmail;
		this.queList = queList;
	}

	public String getListName() {
		return listName;
	}

	public String getListDescription() {
		return listDescription;
	}

	public String isIncludeCompany() {
		return includeCompany;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public List<UserQueList> getQueList() {
		return queList;
	}
	
}
