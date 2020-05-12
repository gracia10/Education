package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.FileBoardDataBean;
import manage.ManageDBBean;


public class FileBoardModifyProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
		int f_num = Integer.parseInt(request.getParameter("f_num"));
		String f_subject = request.getParameter("f_subject");
		String f_content = request.getParameter("f_content");
		String f_pass = request.getParameter("f_pass");
		
		FileBoardDataBean article = new FileBoardDataBean();
			
		article.setF_num(f_num);
		article.setF_content(f_content);
		article.setF_subject(f_subject);
		article.setF_pass(f_pass);
		System.out.println("f_num:::"+f_num);
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		int check = dbPro.modify_FileBoardArticle(article);
		request.setAttribute("check", new Integer(check));		
		System.out.println("check:::"+check);
		
		return "/administer/FileBoardModifyPro.jsp";
	}

}
