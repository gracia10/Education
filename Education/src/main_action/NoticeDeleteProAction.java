package main_action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import manage.FileBoardDataBean;
import manage.ManageDBBean;

public class NoticeDeleteProAction implements action.CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		String pageNum = request.getParameter("pageNum");
		
		MainDBBean dbPro = MainDBBean.getInstance();
		
		int check = dbPro.delete_NoticeArticle(n_num);
		System.out.println(check);
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", new Integer(check));		
		
		return "/main/NoticeDeletePro.jsp";
	}
	
}
