package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import logon.LogonDBBean;
import teacher.TeacherDBBean;*/
import action.CommandAction;

public class FindIdProAction implements action.CommandAction {// ?öå?õê?ù∏Ï¶? Ï≤òÎ¶¨

		public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

/*			request.setCharacterEncoding("utf-8");// ?ïúÍ∏? ?ù∏ÏΩîÎî©

			String u_id = request.getParameter("u_id");
			String u_pass = request.getParameter("u_pass");
			String t_id = request.getParameter("u_id");
			String t_pass = request.getParameter("u_pass");

			LogonDBBean dbPro = LogonDBBean.getInstance();// DBÏ≤òÎ¶¨
			TeacherDBBean tdbPro = TeacherDBBean.getInstance();// DBÏ≤òÎ¶¨
			int check = dbPro.userCheck(u_id, u_pass);
			int tcheck = tdbPro.userCheck(t_id, t_pass);

			// ?ï¥?ãπ Î∑∞Ïóê?Ñú ?Ç¨?ö©?ï† ?Üç?Ñ±
			request.setAttribute("check", new Integer(check));
			request.setAttribute("u_id", u_id);
			request.setAttribute("tcheck", new Integer(tcheck));
			request.setAttribute("u_id", t_id);*/

			return "/Jo/logon/findIdPro.jsp";// ?ï¥?ãπ Î∑?
		}
	}
