package action.SH;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import diary.DiaryDBBean;
import diary.DiaryDataBean;

public class DiaryUpdateAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("=====================================");
		System.out.println("[다이어리업뎃액션::해당 게시글 가져옴]");
		
		int d_num = Integer.parseInt(request.getParameter("d_num"));
		
		DiaryDataBean article = DiaryDBBean.getInstance().getArticle(d_num);
		List dateList  = DiaryDBBean.getInstance().getDate(article.getS_no());
		String set_date = LocalDate.of(article.getD_yy(),article.getD_mm(),article.getD_dd()).toString();
		
		request.setAttribute("article", article);
		request.setAttribute("set_date", set_date);
		request.setAttribute("dateList", dateList);
		
		return "/Sunghee/Diary/diary_update.jsp";
	}

}
