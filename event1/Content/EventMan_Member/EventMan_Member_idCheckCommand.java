package com.java.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.member.model.MemberDao;

public class IdCheckCommand implements Command {

    @Override
    public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// TODO Auto-generated method stub
	
	String id = request.getParameter("id");
	logger.info(logMsg + id);
	
	int check = MemberDao.getInstance().idCheck(id);
	logger.info(logMsg + check); 
	
	request.setAttribute("check", check);
	request.setAttribute("id", id);
	
	return "/EventMan_Member_idCheck.jsp";
    }

}

