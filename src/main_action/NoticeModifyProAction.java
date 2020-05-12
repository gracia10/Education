package main_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.NoticeDataBean;
import manage.FileBoardDataBean;
import manage.ManageDBBean;


public class NoticeModifyProAction implements action.CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		String n_subject = request.getParameter("n_subject");
		String n_content = request.getParameter("n_content");
		
		NoticeDataBean article = new NoticeDataBean();
			
		article.setN_num(n_num);
		article.setN_content(n_content);
		article.setN_subject(n_subject);
		
		MainDBBean dbPro = MainDBBean.getInstance();
		int check = dbPro.modify_NoticeArticle(article);
		request.setAttribute("check", new Integer(check));		
		
		return "/main/NoticeModifyPro.jsp";
	}

}
