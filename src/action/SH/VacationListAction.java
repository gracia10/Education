package action.SH;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import manage.ManageDBBean;
import manage.ScheduleDataBean;
import manage.VacationDataBean;

public class VacationListAction implements CommandAction {
    public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {
        request.setCharacterEncoding("utf-8");
       
        Calendar cal = Calendar.getInstance();
                
        String strYear = request.getParameter("year");
        String strMonth = request.getParameter("month");

        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        
        int today_year = cal.get(Calendar.YEAR); 
        int today_month = cal.get(Calendar.MONTH);
        int today_date = cal.get(Calendar.DATE);

        if(strYear != null)
        {
          year = Integer.parseInt(strYear);
          month = Integer.parseInt(strMonth);
        }

        cal.set(year, month, 1);

        int startDay = cal.getMinimum(java.util.Calendar.DATE);
        int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
        int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
        int newLine = 0;

        Calendar todayCal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String intToday = sdf.format(todayCal.getTime());

        ManageDBBean dbPro = ManageDBBean.getInstance();
        ArrayList<ScheduleDataBean> list = dbPro.Vacation();
        ArrayList<ScheduleDataBean> list2 = dbPro.Holiday();
        ArrayList<VacationDataBean> list3 = dbPro.Vacation_submit();
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
    	
        return "/Sunghee/Teacher/vacationList.jsp";
    }
}
