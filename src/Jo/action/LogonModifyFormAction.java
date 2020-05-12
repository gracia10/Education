package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDataBean;
import logon.LogonDBBean;
import action.CommandAction;

public class LogonModifyFormAction implements action.CommandAction {// ?öå?õê?†ïÎ≥? ?àò?†ï ?èº Ï≤òÎ¶¨

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	request.setCharacterEncoding("utf-8");
		
		String u_id = request.getParameter("u_id");

		LogonDBBean dbPro = LogonDBBean.getInstance();
		LogonDataBean users = dbPro.getUsers(u_id);

		// ?ï¥?ãπ Î∑∞Ïóê?Ñú ?Ç¨?ö©?ï† ?Üç?Ñ±
		request.setAttribute("users", users);

		return "/Jo/logon/modifyForm.jsp";// ?ï¥?ãπÎ∑?
	}
}
