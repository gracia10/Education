package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDataBean;
import logon.LogonDBBean;
import action.CommandAction;

public class LogonInputProAction implements action.CommandAction {// ?šŒ?›ê°??… ì²˜ë¦¬

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");// ?•œê¸? ?¸ì½”ë”©

		LogonDataBean users = new LogonDataBean();// ?°?´?„°ì²˜ë¦¬ ë¹?
		users.setU_id(request.getParameter("u_id"));
		users.setU_pass(request.getParameter("u_pass"));
		users.setU_name(request.getParameter("u_name"));
		users.setU_tel(request.getParameter("u_tel"));
		users.setZipcode(request.getParameter("zipcode"));
		users.setU_addr(request.getParameter("u_addr"));
		users.setU_grade("ÀÏ¹İÈ¸¿ø");
		users.setU_birth(request.getParameter("u_birth"));		

		LogonDBBean dbPro = LogonDBBean.getInstance();// DBì²˜ë¦¬
		dbPro.insertUsers(users);

		return "/Jo/logon/inputPro.jsp";// ?•´?‹¹ ë·?
	}
}