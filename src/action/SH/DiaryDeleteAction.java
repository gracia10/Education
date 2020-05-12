package action.SH;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import diary.DiaryDBBean;

public class DiaryDeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int d_num = Integer.parseInt(request.getParameter("d_num"));
		
		DiaryDBBean dbPro = DiaryDBBean.getInstance();
		int s_no = dbPro.getArticle(d_num).getS_no();
		dbPro.deleteArticle(d_num);
		
		return "/Education/Diary/diary_list.do?s_no="+s_no;
	}

}
