package com.charlie.servlet;


import com.charlie.entity.Stuinfo;
import com.charlie.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
public class ScServlet
{
    @Autowired
    private ScService scService;

    @RequestMapping(value = "/insertStuCourse", method = RequestMethod.GET)
    ModelAndView insertStuCourse(String sno, Integer cno)
    {
        ModelAndView mv = new ModelAndView("redirect:getAllCourse");
        scService.insertCourse(sno, cno);
        return mv;
    }

    @RequestMapping(value = "/deleteStuCourse", method = RequestMethod.GET)
    ModelAndView deleteStuCourse(String sno, Integer cno)
    {
        ModelAndView mv = new ModelAndView("redirect:getAllCourse");
        scService.returnCourse(sno,cno);
        return mv;
    }

    @RequestMapping(value = "/getAllSelectedCourseGrade", method = RequestMethod.GET)
    ModelAndView getAllSelectedCourseGrade(HttpSession session)
    {
        Stuinfo stuinfo = (Stuinfo) session.getAttribute("stuinfo");
        ModelAndView mv = new ModelAndView("stuGetGrade");
        List<Map<String, Object>> stuGrades = scService.getAllSelectedCourseGrades(stuinfo.getSno());
        mv.addObject("stuGrades",stuGrades);
        return mv;
    }

    @RequestMapping(value = "/updateStuGrade", method = RequestMethod.POST)
    ModelAndView updateStuGrade(String cno, String dailyPerformancePercentage, String experimentPerformancePercentage, String midtermPerfoemancePercentage, String finalexamPerformancePercentage, HttpServletRequest request, HttpSession session)
    {
        ModelAndView mv = new ModelAndView("redirect:getCourseStudents");
        List<String> snos = (List<String>) session.getAttribute("snos");
        String[] dailyPerformance = request.getParameterValues("dailyPerformance");
        String[] experimentPerformance = request.getParameterValues("experimentPerformance");
        String[] midtermPerfoemance = request.getParameterValues("midtermPerfoemance");
        String[] finalexamPerformance = request.getParameterValues("finalexamPerformance");
        Integer c = Integer.parseInt(cno);
        double dailyPercentage = Double.parseDouble(dailyPerformancePercentage);
        double experimentPercentage = Double.parseDouble(experimentPerformancePercentage);
        double midtermPercentage = Double.parseDouble(midtermPerfoemancePercentage);
        double finalexamPercentage = Double.parseDouble(finalexamPerformancePercentage);
        int len = snos.size();
        for(int i = 0; i < len; i++){
                System.out.println(dailyPerformance[i] + " " + experimentPerformance[i] + " " + midtermPerfoemance[i] + " " +  finalexamPerformance[i]);
                int d = Integer.parseInt(dailyPerformance[i]);
                int e = Integer.parseInt(experimentPerformance[i]);
                int m = Integer.parseInt(midtermPerfoemance[i]);
                int f = Integer.parseInt(finalexamPerformance[i]);
                Integer dailyGrade = Math.toIntExact(Math.round(dailyPercentage * d * 0.01));
                Integer experimentGrade = Math.toIntExact(Math.round(experimentPercentage * e * 0.01));
                Integer midtermGrade = Math.toIntExact(Math.round(midtermPercentage * m * 0.01));
                Integer finalexamGrade = Math.toIntExact(Math.round(finalexamPercentage * f * 0.01));
                Integer finalGrade = dailyGrade + experimentGrade + midtermGrade + finalexamGrade;
                scService.updateStudentCourseGrade(d,f,e,m,finalGrade,snos.get(i),c);
            }
        return mv;

    }

}
