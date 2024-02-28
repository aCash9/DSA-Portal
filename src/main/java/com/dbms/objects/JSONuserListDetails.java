package com.dbms.objects;

import java.util.List;

public class JSONuserListDetails {
	
    private String listName;
    private String listDescription;
    private boolean includeCompany;
    private String userEmail;
    private List<String> queIDs;
    private List<String> queNames;
    private List<String> queDifficulties;
    private List<String> queCompanies;


    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public String getListDescription() {
        return listDescription;
    }

    public void setListDescription(String listDescription) {
        this.listDescription = listDescription;
    }

    public boolean isIncludeCompany() {
        return includeCompany;
    }

    public void setIncludeCompany(boolean includeCompany) {
        this.includeCompany = includeCompany;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public List<String> getQueIDs() {
        return queIDs;
    }

    public void setQueIDs(List<String> queIDs) {
        this.queIDs = queIDs;
    }

    public List<String> getQueNames() {
        return queNames;
    }

    public void setQueNames(List<String> queNames) {
        this.queNames = queNames;
    }

    public List<String> getQueDifficulties() {
        return queDifficulties;
    }

    public void setQueDifficulties(List<String> queDifficulties) {
        this.queDifficulties = queDifficulties;
    }

    public List<String> getQueCompanies() {
        return queCompanies;
    }

    public void setQueCompanies(List<String> queCompanies) {
        this.queCompanies = queCompanies;
    }
}
