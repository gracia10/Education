package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import logon.LogonDataBean;
import action.CommandAction;

public class PassCheckProAction implements action.CommandAction {// ?öå?õê?Éà?á¥ Ï≤òÎ¶¨

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		String u_id = request.getParameter("u_id");
		String u_pass = request.getParameter("u_pass");

		LogonDBBean dbPro = LogonDBBean.getInstance();
		int check = dbPro.passCheck(u_id, u_pass);

		// ?ï¥?ãπ Î∑∞Ïóê?Ñú ?Ç¨?ö©?ï† ?Üç?Ñ±
		request.setAttribute("check", new Integer(check));
		request.setAttribute("u_id", u_id);

		return "/Jo/logon/passCheckPro.jsp";// ?ï¥?ãπÎ∑?
	}
}