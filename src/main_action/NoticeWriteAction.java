package main_action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manage.ItemDataBean;
import manage.ManageDBBean;

public class NoticeWriteAction implements action.CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		return "/main/NoticeWrite.jsp";
	}
}
