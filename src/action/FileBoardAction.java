package action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class FileBoardAction implements CommandAction {
    public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {

        request.setCharacterEncoding("utf-8");//한글 인코딩
        
        String pageNum = request.getParameter("pageNum");//페이지 번호
    	String search =  request.getParameter("search");
    	String string =  request.getParameter("string");
        
        if (pageNum == null) {
            pageNum = "1";
        }
        int pageSize = 6;//한 페이지의 글의 개수
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number=0;
        
        
        List articleList = null;
        ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
        
        
        if(search==null) { // 서치가 없을떄
        	count = dbPro.getFileBoardCount(); // 전체 글 수
        	if(count > 0) {
        		articleList = dbPro.getFileBoardlist(startRow, endRow);//현재 페이지에 해당하는 글 목록
        		System.out.println("안들어옴");
        	} else {
                articleList = Collections.EMPTY_LIST;
            }
        } else { // 서치가 있을때
        	count = dbPro.getFileBoardCount(search, string);
        	if(count > 0) {
        		articleList = dbPro.getFileBoardlist(startRow, endRow, search, string);
        		request.setAttribute("search1", 1);
        	}
        }
        
        number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
        //해당 뷰에서 사용할 속성 뷰에서 쓸내용이면 다 셋어트리뷰트로 때려박으면됨.
        request.setAttribute("currentPage", new Integer(currentPage)); // 인티져 안해줘도 자동으로 바껴서 들어감
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
        request.setAttribute("number", new Integer(number));
        request.setAttribute("articleList", articleList);
        
        request.setAttribute("string", string);
        request.setAttribute("search", search);
        
        return "/administer/FileBoard.jsp";//해당 뷰
    }
}
