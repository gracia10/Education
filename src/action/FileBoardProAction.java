package action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import manage.FileBoardDataBean;
import manage.MainImageDataBean;
import manage.ManageDBBean;

public class FileBoardProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		int x = dbPro.get_seq_f_num(); // 새 자료게시판 시퀀스 넘버
		FileBoardDataBean article = new FileBoardDataBean();
		
		article.setF_num(x);
		article.setF_pass(request.getParameter("f_pass"));
		article.setF_subject(request.getParameter("f_subject"));
		article.setF_content(request.getParameter("f_content"));
		article.setF_date(new Timestamp(System.currentTimeMillis()));
		article.setT_name(request.getParameter("t_name"));

		dbPro.insert_FileBoardArticle(article);
		
		return "/administer/FileBoardWritePro.jsp";
	}

}
