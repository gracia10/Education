package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import Jo.teacher.TeacherDBBean;
import action.CommandAction;

public class ConfirmIdAction implements action.CommandAction {// ?…? ¥?œ ê¸? ì²˜ë¦¬

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// ?•œê¸? ?¸ì½”ë”©

		String u_id = request.getParameter("u_id");// ?‚¬?š©??…? ¥ ?•„?´?””
		String t_id = request.getParameter("u_id");// ?‚¬?š©??…? ¥ ?•„?´?””
		
		LogonDBBean dbPro = LogonDBBean.getInstance();// DBì²˜ë¦¬
		TeacherDBBean tdbPro = TeacherDBBean.getInstance();// DBì²˜ë¦¬
		int check = dbPro.confirmId(u_id);
		int tcheck = tdbPro.confirmId(t_id);

		// ?•´?‹¹ ë·°ì—?„œ ?‚¬?š©?•  ?†?„±
		request.setAttribute("u_id", u_id);
		request.setAttribute("check", new Integer(check));
		request.setAttribute("u_id", t_id);
		request.setAttribute("tcheck", new Integer(tcheck));

		return "/Jo/logon/confirmId.jsp";// ?•´?‹¹ ë·?
	}
}
