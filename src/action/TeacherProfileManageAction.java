package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import manage.ManageDBBean;
import manage.ManageDataBean;

public class TeacherProfileManageAction implements CommandAction {
	public String requestPro(HttpServletRequest request,HttpServletResponse response)throws Throwable {
		
		request.setCharacterEncoding("utf-8");        
		
		String t_id = request.getParameter("id");
		String t_intro = request.getParameter("t.t_intro");
		String t_career = request.getParameter("t_career");
		String t_img = request.getParameter("t_img");		
		
        ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
        ArrayList profile = dbPro.getTeacherProfile(t_id);
        
        request.setAttribute("profile", profile);
        
        //System.out.println("이건 삭제Action의 t_id: "+);
        request.setAttribute("t.t_id", t_id);
        request.setAttribute("t.t_career", t_career);
        request.setAttribute("t.t_intro", t_intro);
        request.setAttribute("t.t_img", t_img);
        
        
		return "/administer/TeacherProfileManage.jsp";//해당 뷰
	 }
}
