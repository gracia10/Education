package action.SH;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.CommandAction;
import manage.ManageDBBean;
import manage.ScheduleDataBean;
import manage.VacationDataBean;
import teacher.TeacherDBBean;

public class VacationListAction implements CommandAction {
    public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {

    	System.out.println("===========================================");
		System.out.println("[베케이션리스트 액션]실행!"+request.getSession().getAttribute("memId").toString());
    	
    	
        request.setCharacterEncoding("utf-8");//한글 인코딩
       
        Calendar cal = Calendar.getInstance();
                
        String strYear = request.getParameter("year");
        String strMonth = request.getParameter("month");

        int year = cal.get(Calendar.YEAR); // 오늘 년 월 일
        int month = cal.get(Calendar.MONTH);
        
        int today_year = cal.get(Calendar.YEAR); 
        int today_month = cal.get(Calendar.MONTH);
        int today_date = cal.get(Calendar.DATE);

        if(strYear != null)
        {
          year = Integer.parseInt(strYear);
          month = Integer.parseInt(strMonth);
        }

        //년도/월 셋팅
        cal.set(year, month, 1);

        int startDay = cal.getMinimum(java.util.Calendar.DATE);				// 그 달이 언제부터?
        int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);	// 그 달이 언제까지?
        int start = cal.get(java.util.Calendar.DAY_OF_WEEK);			// 1일이 언제부터 시작인지
        int newLine = 0;

        //오늘 날짜 저장.
        Calendar todayCal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String intToday = sdf.format(todayCal.getTime());

        ManageDBBean dbPro = ManageDBBean.getInstance();//DB처리
        ArrayList<ScheduleDataBean> list = dbPro.Vacation(); // 달력에 휴가 승인된놈들 표시!!
        ArrayList<ScheduleDataBean> list2 = dbPro.Holiday(); // 기념일
        ArrayList<VacationDataBean> list3 = dbPro.Vacation_submit(); // 휴가 신청만
        int vacation_number = 1;
                
        request.setAttribute("year", year);
        request.setAttribute("month", month);
        request.setAttribute("startDay", startDay);
        request.setAttribute("endDay", endDay);
        request.setAttribute("start", start);
        request.setAttribute("newLine", newLine);
        request.setAttribute("intToday", intToday);
        request.setAttribute("list", list);
    	request.setAttribute("list2", list2);
    	request.setAttribute("today_year", today_year);
    	request.setAttribute("today_month", today_month);
    	request.setAttribute("today_date", today_date);

    	request.setAttribute("vacationSubmitList", list3);
    	request.setAttribute("vacation_number", vacation_number);
    	
        return "/Sunghee/Teacher/vacationList.jsp";//해당 뷰
    }
}
