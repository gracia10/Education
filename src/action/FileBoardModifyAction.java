package action;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.FileBoardDataBean;
import manage.FileBoardLoadDataBean;
import manage.ManageDBBean;

public class FileBoardModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
        request.setCharacterEncoding("utf-8");//한글 인코딩
        
		int f_num = Integer.parseInt(request.getParameter("f_num"));
		String pageNum = request.getParameter("pageNum");
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		FileBoardDataBean article = new FileBoardDataBean();
		article = dbPro.getArticle(f_num);
		
		ArrayList<FileBoardLoadDataBean> list_load = dbPro.getArticles_load(f_num);
		
		for(int i=0;i<list_load.size();i++) {
			String fl_subject = list_load.get(i).getFl_subject();
			String x=request.getContextPath()+"/fileSave/"+URLEncoder.encode(fl_subject,"UTF-8");
			list_load.get(i).setFl_realPath(x);
		}
		
		request.setAttribute("list_load", list_load);
		request.setAttribute("f_num", f_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		
		return "/administer/FileBoardModify.jsp";
	}

}
