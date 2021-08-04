package com.charlie.servlet;

import com.charlie.entity.Stuinfo;
import com.charlie.entity.Teacher;
import com.charlie.service.ScService;
import com.charlie.service.StuinfoService;
import com.charlie.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@Controller
@SessionAttributes(value = {"stuinfo","courseMessage","courseCno","teacher"})
public class StuinfoServlet
{
    @Autowired
    private StuinfoService stuinfoService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ScService scService;

    @RequestMapping( value = "/login", method = RequestMethod.POST)
    public ModelAndView login(String num, String spassword, String identify, HttpServletResponse response) throws IOException
    {
        response.setContentType("text/html;charset = utf-8");
        if(identify.equals("student"))
        {
            Stuinfo stuinfo = stuinfoService.getUsersMessage(num);
            List<Integer> courseCno = scService.getStudentSelectCno(stuinfo.getSno());;
            if(stuinfo != null && spassword.equals(stuinfo.getSpassword()))
            {
                ModelAndView mv = new ModelAndView("stuIndex");
                mv.addObject("stuinfo",stuinfo);
                mv.addObject("courseCno",courseCno);
                return mv;
            }
        }
        else if(identify.equals("teacher"))
        {
            Teacher teacher = teacherService.getTeacherMessage(num);
            if(teacher != null && spassword.equals(teacher.getTpassword()))
            {
                ModelAndView mv = new ModelAndView("teacher/teacherIndex");
                mv.addObject("teacher",teacher);
                return  mv;
            }
        }
        PrintWriter out = response.getWriter();
        out.write("<script>");
        out.write("alert('用户名或密码错误');");
        out.write("location.href='login.jsp'");
        out.write("</script>");
        return null;
    }

}
