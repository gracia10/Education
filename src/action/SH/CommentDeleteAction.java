package action.SH;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import action.CommandAction;
import diary.Diary_CommentDBBean;

public class CommentDeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int dc_num = Integer.parseInt(request.getParameter("dc_num"));
		
		Diary_CommentDBBean dbPro = Diary_CommentDBBean.getInstance();
		String result = dbPro.deleteComment(dc_num);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
		return "AjaxCall";
	}

}
