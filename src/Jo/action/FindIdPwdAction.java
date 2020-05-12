package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;

public class FindIdPwdAction implements action.CommandAction {//

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return "/Jo/logon/findIdPwd.jsp";// ?•´?‹¹ ë·?
	}
}