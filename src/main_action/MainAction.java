package main_action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class MainAction implements action.CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		MainDBBean dbPro = MainDBBean.getInstance();//DB¿¬µ¿
		ArrayList<MainDataBean> list = dbPro.get_mainImg();
    	
		request.setAttribute("list1", list);
		
		return "/main/Main.jsp";
	}

}
