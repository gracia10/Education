package Jo.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDataBean;
import logon.LogonDBBean;
import teacher.TeacherDataBean;
import teacher.TeacherDBBean;
import action.CommandAction;

public class UpdatePwdProAction implements action.CommandAction {// ?öå?õê?†ïÎ≥¥Ïàò?†ï Ï≤òÎ¶¨

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");

		String u_id = request.getParameter("u_id");
		String u_pass = request.getParameter("u_pass");

		LogonDataBean users = new LogonDataBean();
		users.setU_id(request.getParameter("u_id"));
		users.setU_pass(request.getParameter("u_pass"));

		LogonDBBean dbPro = LogonDBBean.getInstance();
		dbPro.updatePwd(users);
		return "/Jo/logon/updatePwdPro.jsp";// ?ï¥?ãπ Î∑?
	}
}