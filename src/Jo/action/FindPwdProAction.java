package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import logon.LogonDataBean;
import Jo.teacher.TeacherDBBean;
import action.CommandAction;

public class FindPwdProAction implements action.CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

			request.setCharacterEncoding("utf-8");// ?���? ?��코딩

			String u_id = request.getParameter("u_id"); // ?��?��?�� ?��?��
			String u_name = request.getParameter("u_name");
			String t_id = request.getParameter("u_id");
			String t_name = request.getParameter("u_name");

			LogonDBBean dbPro = LogonDBBean.getInstance();// DB처리
			TeacherDBBean tdbPro = TeacherDBBean.getInstance();// DB처리
			
			LogonDataBean users = dbPro.getUsers(u_id);
			
			int pwcheck = dbPro.findPwd(u_id, u_name);
			int tpwcheck = tdbPro.findPwd(t_id, t_name);

			// ?��?�� 뷰에?�� ?��?��?�� ?��?��
			request.setAttribute("pwcheck", new Integer(pwcheck));
			request.setAttribute("u_id", u_id);
			request.setAttribute("u_name", u_name);
			request.setAttribute("tpwcheck", new Integer(tpwcheck));
			request.setAttribute("u_id", t_id);
			request.setAttribute("u_name", t_name);

			// ?��?�� 뷰에?�� ?��?��?�� ?��?��
			request.setAttribute("users", users);

			return "/Jo/logon/findPwdPro.jsp";// ?��?�� �?
		}
	}
