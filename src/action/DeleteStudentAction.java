package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class DeleteStudentAction implements CommandAction {
	public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
		String s_no = request.getParameter("s_no");
		System.out.println("student_no : "+ s_no);
		
		 if (s_no == null) {
	            s_no = "1";
	        }
		int s_num = Integer.parseInt(s_no);
		
		System.out.println("이건 학생delte액션의 s_num"+s_num);
		
		//String student_no = request.getParameter("student_no");
		//System.out.println("student_no"+student_no);
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		dbPro.deleteStudent(s_num);
	        
					
		return "/administer/StudentManagePro.jsp";
	}
}
