package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;

public class LoginAction implements action.CommandAction {// ?öå?õê?ù∏Ï¶? ?èº Ï≤òÎ¶¨

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return "/Jo/logon/login.jsp";// ?ï¥?ãπ Î∑?
	}
}