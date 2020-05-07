package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;

public class LogoutAction implements action.CommandAction {// ë¡œê·¸?•„?›ƒ ì²˜ë¦¬

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return "/Jo/logon/logout.jsp";// ?•´?‹¹ ë·?
	}
}