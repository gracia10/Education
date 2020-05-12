package action.SH;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import action.CommandAction;
import diary.Diary_CommentDBBean;
import diary.Diary_CommentDataBean;

public class CommentUpdateAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		Diary_CommentDataBean comment = new Diary_CommentDataBean();
		comment.setDc_num(Integer.parseInt(request.getParameter("dc_num")));
		comment.setDc_content(request.getParameter("dc_content"));
		comment.setDc_reg_date(new Timestamp(System.currentTimeMillis()));
		
		Diary_CommentDBBean dbPro = Diary_CommentDBBean.getInstance();
		String result = dbPro.updateComment(comment);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
		
		return "AjaxCall";
	}

}
