package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDataBean;
import logon.LogonDBBean;
import action.CommandAction;

public class LogonModifyProAction implements action.CommandAction {// ?öå?õê?†ïÎ≥¥Ïàò?†ï Ï≤òÎ¶¨

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");

		String u_id = request.getParameter("u_id");

		LogonDataBean users = new LogonDataBean();
		users.setU_pass(request.getParameter("u_pass"));
		users.setU_name(request.getParameter("u_name"));
		users.setU_birth(request.getParameter("u_birth"));
		users.setU_tel(request.getParameter("u_tel"));
		users.setU_id(request.getParameter("u_id"));
		users.setZipcode(request.getParameter("zipcode"));
		users.setU_addr(request.getParameter("u_addr"));
        System.out.println(request.getParameter("zipcode"));
        System.out.println(request.getParameter("u_addr"));
		LogonDBBean dbPro = LogonDBBean.getInstance();
		dbPro.updateUsers(users);
		return "/Jo/logon/modifyPro.jsp";// ?ï¥?ãπ Î∑?
	}
}