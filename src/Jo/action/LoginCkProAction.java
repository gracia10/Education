package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import Jo.teacher.TeacherDBBean;
import action.CommandAction;

public class LoginCkProAction implements action.CommandAction {// ???Έμ¦? μ²λ¦¬

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// ?κΈ? ?Έμ½λ©

		String u_id = request.getParameter("u_id");
		String u_pass = request.getParameter("u_pass");
		String t_id = request.getParameter("u_id");
		String t_pass = request.getParameter("u_pass");

		LogonDBBean dbPro = LogonDBBean.getInstance();// DBμ²λ¦¬
		TeacherDBBean tdbPro = TeacherDBBean.getInstance();// DBμ²λ¦¬
		int check = dbPro.userCheck(u_id, u_pass);
		int tcheck = tdbPro.userCheck(t_id, t_pass);
		
/*		if(check==1) {
			request.setAttribute("check", check);
		} else {
			request.setAttribute("check", tcheck);
		}*/

		// ?΄?Ή λ·°μ? ?¬?©?  ??±
		request.setAttribute("check", new Integer(check));
		request.setAttribute("u_id", u_id);
		request.setAttribute("tcheck", new Integer(tcheck));
		request.setAttribute("u_id", t_id);

		return "/Jo/logon/loginCkPro.jsp";// ?΄?Ή λ·?
	}
}
