package action.SH;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import diary.DiaryDBBean;
import diary.DiaryDataBean;

public class DiaryWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		  DiaryDataBean article = new DiaryDataBean();
		  article.setD_yy(Integer.parseInt(request.getParameter("d_yy")));
		  article.setD_mm(Integer.parseInt(request.getParameter("d_mm")));
		  article.setD_dd(Integer.parseInt(request.getParameter("d_dd")));
		  article.setD_subject(request.getParameter("d_subject"));
		  article.setD_content(request.getParameter("d_content"));
		  article.setD_date(new Timestamp(System.currentTimeMillis()));
		  article.setS_no(Integer.parseInt(request.getParameter("s_no")));
		  
		  DiaryDBBean dbPro = DiaryDBBean.getInstance();
		  dbPro.insertArticle(article);
		  
		  int s_no = article.getS_no();
		
		return "/Education/Diary/diary_list.do?s_no="+s_no;
	}
}
