package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDataBean;
import logon.LogonDBBean;
import action.CommandAction;

public class LogonModifyFormAction implements action.CommandAction {// ??? λ³? ??  ?Ό μ²λ¦¬

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	request.setCharacterEncoding("utf-8");
		
		String u_id = request.getParameter("u_id");

		LogonDBBean dbPro = LogonDBBean.getInstance();
		LogonDataBean users = dbPro.getUsers(u_id);

		// ?΄?Ή λ·°μ? ?¬?©?  ??±
		request.setAttribute("users", users);

		return "/Jo/logon/modifyForm.jsp";// ?΄?Ήλ·?
	}
}
