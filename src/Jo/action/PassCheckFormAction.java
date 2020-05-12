package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import logon.LogonDataBean;
import action.CommandAction;

public class PassCheckFormAction implements action.CommandAction {// ?öå?õê?ù∏Ï¶? Ï≤òÎ¶¨

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// ?ïúÍ∏? ?ù∏ÏΩîÎî©

		String u_id = request.getParameter("u_id");
		String u_pass = request.getParameter("u_pass");

		LogonDBBean dbPro = LogonDBBean.getInstance();// DBÏ≤òÎ¶¨
		LogonDataBean users = dbPro.getUsers(u_id);
		int check = dbPro.passCheck(u_id, u_pass);

		// ?ï¥?ãπ Î∑∞Ïóê?Ñú ?Ç¨?ö©?ï† ?Üç?Ñ±
		request.setAttribute("check", new Integer(check));
		request.setAttribute("u_id", u_id);
		request.setAttribute("users", users);

		return "/Jo/logon/passCheckForm.jsp";// ?ï¥?ãπ Î∑?
	}
}
