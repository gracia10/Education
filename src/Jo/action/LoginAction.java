package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;

public class LoginAction implements action.CommandAction {// ?��?��?���? ?�� 처리

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return "/Jo/logon/login.jsp";// ?��?�� �?
	}
}