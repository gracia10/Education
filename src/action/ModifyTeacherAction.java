package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;
import manage.ManageDataBean;

public class ModifyTeacherAction implements CommandAction {

	public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {		
		request.setCharacterEncoding("utf-8");
		
		String teacherid = request.getParameter("t_id");
		System.out.println("선생님아이디 : "+teacherid);
						
		ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
		//데이터 불러오기!
		ManageDataBean teacherList = dbPro.getMemberTeacher(teacherid);

        request.setAttribute("t_id", teacherList.getT_id());
        request.setAttribute("t_name", teacherList.getT_name());
        request.setAttribute("t_pass", teacherList.getT_pass());
        request.setAttribute("t_tel", teacherList.getT_tel());
        request.setAttribute("t_birth", teacherList.getT_birth());
        request.setAttribute("t_addr", teacherList.getT_addr());
        request.setAttribute("zipcode", teacherList.getZipcode());
        
        //데이터 수정하기!
		String t_id = request.getParameter("t_id");
		String t_pass = request.getParameter("t_pass");
		String t_name = request.getParameter("t_name");
		String t_tel = request.getParameter("t_tel");
		String t_birth = request.getParameter("t_birth");
		String t_addr = request.getParameter("t_addr");
		String zipcode = request.getParameter("zipcode");
		System.out.println("asdfasdfasdfds");
		
		System.out.println(request.getParameter("update"));
		String update = request.getParameter("update");
		if (update != null) {
			dbPro.updateTeacher(t_id, t_pass, t_name, t_tel, t_birth, t_addr, zipcode);
			System.out.println("선생님 수정 ok");
		} 
        
		return "/administer/ModifyTeacher.jsp";
	}
}
