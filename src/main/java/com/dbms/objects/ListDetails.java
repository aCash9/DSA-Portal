package com.dbms.objects;

public class ListDetails {
	String listID;
	String listName;
	String listDescription;
	String includeCompany;
	
	public ListDetails(String listID, String listName, String listDescription, String includeCompany) {
		super();
		this.listID = listID;
		this.listName = listName;
		this.listDescription = listDescription;
		this.includeCompany = includeCompany;
	}
	public String getIncludeCompany() {
		return includeCompany;
	}
	public String getListID() {
		return listID;
	}
	public String getListName() {
		return listName;
	}
	public String getListDescription() {
		return listDescription;
	}	
}
