package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import logon.ZipcodeBean;
import java.util.*;
import action.CommandAction;

public class ZipCheckAction implements action.CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String area4 = request.getParameter("area4");
		String check = request.getParameter("check");
		
		LogonDBBean dbPro = LogonDBBean.getInstance();
		ArrayList<ZipcodeBean> list = dbPro.zipcodeRead(area4);
		System.out.println(check);
		
		request.setAttribute("zipcodeList", list);
		request.setAttribute("check", check);
		
		return "/Jo/logon/ZipCheck.jsp";
	}

}
