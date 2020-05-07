package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.FileBoardDataBean;
import manage.ManageDBBean;

public class FileBoardDeleteProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
		int f_num = Integer.parseInt(request.getParameter("f_num"));
		String pageNum = request.getParameter("pageNum");
		String f_pass = request.getParameter("f_pass");
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		
		int check = dbPro.delete_FileBoardArticle(f_num, f_pass);
		
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", new Integer(check));		
		
		return "/administer/FileBoardDeletePro.jsp";
	}
	
}
