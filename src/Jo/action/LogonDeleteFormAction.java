package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;

public class LogonDeleteFormAction implements action.CommandAction {// ?öå?õê?Éà?á¥ ?èº Ï≤òÎ¶¨

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return "/Jo/logon/deleteForm.jsp";// ?ï¥?ãπÎ∑?
	}
}
