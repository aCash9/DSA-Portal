package com.dbms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import com.dbms.dao.UserListDao;
import com.dbms.objects.JSONuserListDetails;
import com.dbms.objects.UserList;
import com.dbms.objects.UserQueList;
import com.fasterxml.jackson.databind.ObjectMapper;
public class welcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserListDao userlistdao = new UserListDao();
       
    public welcomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve data from the request body as JSON
		ObjectMapper mapper = new ObjectMapper();

        // Read JSON data from the request and map it to WelcomeRequest
        JSONuserListDetails welcomeRequest = mapper.readValue(request.getReader(), JSONuserListDetails.class);
        String listName = welcomeRequest.getListName();
        String listDescription = welcomeRequest.getListDescription();
        String includeCompany = String.valueOf(welcomeRequest.isIncludeCompany());
        String userEmail = welcomeRequest.getUserEmail();
        List<String> queIDs = welcomeRequest.getQueIDs();
        List<String> queNames = welcomeRequest.getQueNames();
        List<String> queDifficulties = welcomeRequest.getQueDifficulties();
        List<String> queCompanies = welcomeRequest.getQueCompanies();
        
                
        List<UserQueList> quelist = new ArrayList<>();
        for(int i = 1; i < queIDs.size(); i++) {
        	if(queCompanies.get(1).equals("")) {
        		quelist.add(new UserQueList(queIDs.get(i), queNames.get(i), queDifficulties.get(i)));
        	} else {
        		quelist.add(new UserQueList(queIDs.get(i), queNames.get(i), queDifficulties.get(i), queCompanies.get(i)));
        	}
        }
       
        UserList userList = new UserList(listName, listDescription, includeCompany, userEmail, quelist);
        
        String ListID = makeListID();
        userlistdao.addUserListToTable(userList, ListID);
        if(userlistdao.createUserListTable(userList, ListID)) {
        	for(UserQueList que: quelist) {
        		boolean status = userlistdao.addQueToUserListTable(que, includeCompany, ListID);
        		
        		System.out.println(status);
        	}
        }
        
	}
	private String makeListID() {
		String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		int CODE_LENGTH = 6;
		
		SecureRandom random = new SecureRandom();
        StringBuilder code = new StringBuilder();

        for (int i = 0; i < CODE_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            code.append(randomChar);
        }

        return code.toString();
	}
}

