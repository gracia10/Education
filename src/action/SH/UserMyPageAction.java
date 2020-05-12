package action.SH;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import student.StudentDBBean;
import users.UsersDBBean;

public class UserMyPageAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String u_id = request.getSession().getAttribute("memId").toString();
		
		List studentList = StudentDBBean.getInstance().getStudents(u_id);
		String u_name = UsersDBBean.getInstance().getName(u_id);
		
		request.setAttribute("studentList",studentList);
		request.setAttribute("u_name",u_name);
		
		return "/Sunghee/User/u_mypage.jsp";
	}

}
