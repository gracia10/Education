package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import Jo.teacher.TeacherDBBean;
import action.CommandAction;

public class ConfirmIdAction implements action.CommandAction {// ?��?��?�� �? 처리

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// ?���? ?��코딩

		String u_id = request.getParameter("u_id");// ?��?��?��?��?�� ?��?��?��
		String t_id = request.getParameter("u_id");// ?��?��?��?��?�� ?��?��?��
		
		LogonDBBean dbPro = LogonDBBean.getInstance();// DB처리
		TeacherDBBean tdbPro = TeacherDBBean.getInstance();// DB처리
		int check = dbPro.confirmId(u_id);
		int tcheck = tdbPro.confirmId(t_id);

		// ?��?�� 뷰에?�� ?��?��?�� ?��?��
		request.setAttribute("u_id", u_id);
		request.setAttribute("check", new Integer(check));
		request.setAttribute("u_id", t_id);
		request.setAttribute("tcheck", new Integer(tcheck));

		return "/Jo/logon/confirmId.jsp";// ?��?�� �?
	}
}
