package action.SH;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import action.CommandAction;
import diary.Diary_CommentDBBean;
import diary.Diary_CommentDataBean;

public class GetCommentsAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		System.out.println("=================[코멘트 가져오기]=================================");
		
		int d_num = Integer.parseInt(request.getParameter("d_num"));
		
		
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		List<Diary_CommentDataBean> commentVO = Diary_CommentDBBean.getInstance().getComments(d_num);
		
		
		if(commentVO.size() > 0){
            for(int i=0; i<commentVO.size(); i++){
                HashMap hm = new HashMap();
                hm.put("commenter", commentVO.get(i).getCommenter());
                hm.put("dc_content", commentVO.get(i).getDc_content());
                hm.put("dc_reg_date", commentVO.get(i).getDc_reg_date());
                hm.put("dc_num", commentVO.get(i).getDc_num());
                
                hmlist.add(hm);
            }
            
        }
		
		JSONArray json = new JSONArray(hmlist);
		PrintWriter pw = response.getWriter();
		pw.print(json);
		
		return "A";
	}

}
