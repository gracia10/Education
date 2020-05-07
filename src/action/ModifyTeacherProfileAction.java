package action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import manage.FileBoardDataBean;
import manage.ManageDBBean;
import manage.ManageDataBean;
import manage.TeacherProfileDataBean;

public class ModifyTeacherProfileAction implements CommandAction {
public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
	
		String teacherid = request.getParameter("t_id");
		
		System.out.println("선생님아이디 : "+teacherid);		
				
		ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
		TeacherProfileDataBean teacherList = dbPro.getTeacherProfileList(teacherid);
		
        request.setAttribute("t_id", teacherList.getT_id());
        request.setAttribute("t_intro", teacherList.getT_intro());
        request.setAttribute("t_career", teacherList.getT_career());
        request.setAttribute("t_img", teacherList.getT_img());
        
        return "/administer/ModifyTeacherProfile.jsp";
	}
}
