package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class CreateT_ProfileAction implements CommandAction {
	public String requestPro(HttpServletRequest request,HttpServletResponse response)throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		return "/administer/CreateTeacherProfile.jsp";
		}
}
