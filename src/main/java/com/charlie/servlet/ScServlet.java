package com.charlie.servlet;


import com.charlie.entity.Sc;
import com.charlie.entity.Stuinfo;
import com.charlie.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

}
