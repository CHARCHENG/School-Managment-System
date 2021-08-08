package com.charlie.servlet;

import com.charlie.entity.Course;
import com.charlie.entity.Stuinfo;
import com.charlie.entity.Teacher;
import com.charlie.service.CourseService;
import com.charlie.service.ScService;
import com.charlie.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes(value = {"courseCno"})
public class CourseServlet
{
    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private ScService scService;

    @RequestMapping(value = "/getAllCourse")
    public ModelAndView courseAndPages(HttpSession session)
    {
        ModelAndView mv = new ModelAndView("stuGetCourse");
        Stuinfo stuinfo = (Stuinfo) session.getAttribute("stuinfo");
        List<Integer> courseCno = scService.getStudentSelectCno(stuinfo.getSno());;
        List<Course> courses = courseService.getAllCourse(stuinfo.getTerm(),stuinfo.getClasses().getMajor().getDepartment().getDe_id());
        mv.addObject("courseCno",courseCno);
        mv.addObject("courses",courses);
        return mv;
    }

    @RequestMapping(value = "/getStuSelectMessage",method = RequestMethod.GET)
    public ModelAndView getStuSelectMessage(HttpSession session)
    {
        ModelAndView mv = new ModelAndView("stuCourseTimestable");
        Stuinfo stuinfo = (Stuinfo) session.getAttribute("stuinfo");
        List<Integer> courseCno = scService.getStudentSelectCno(stuinfo.getSno());;
        List<Course> courseMessage = new ArrayList<>();
        for(Integer cno :courseCno) {
            courseMessage.add(courseService.getStudentSelectedCourse(cno));
        }
        mv.addObject("courseCno",courseCno);
        mv.addObject("courseMessage",courseMessage);
        return mv;
    }


    @RequestMapping(value = "/updateCourseTestMessage", method = RequestMethod.GET)
    public ModelAndView updateCourseTestMessage(String testClassroom, String testTimes, Integer cno, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView("teacher/teacherInputCourseTestMessage");
        courseService.updateCourseTestMessage(testClassroom,testTimes,cno);
        Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
        List<Course> courses = teacherService.teachCourse(teacher.getTno());
        mv.addObject("courses",courses);
        return mv;
    }

}
