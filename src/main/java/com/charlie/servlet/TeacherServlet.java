package com.charlie.servlet;

import com.charlie.entity.Course;
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

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes(value = {"snos"})
public class TeacherServlet
{
     @Autowired
     StuinfoService stuinfoService;

     @Autowired
     ScService scService;

     @Autowired
     TeacherService teacherService;

     @RequestMapping(value = "/getCourseStudents", method = RequestMethod.GET)
     ModelAndView getCourseStudents(HttpSession httpSession)
     {
         Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
         ModelAndView mv = new ModelAndView("teacher/teacherInputGrade");
         List<Course> courses = teacherService.teachCourse(teacher.getTno());
         mv.addObject("courses",courses);
         return mv;
     }

     @RequestMapping(value = "/getStudentList", method = RequestMethod.GET)
     ModelAndView getStudentList(String cno)
     {
          ModelAndView mv = new ModelAndView("teacher/teacherInputStuGrade");
          List<Stuinfo> stuMessages = new ArrayList<>();
          List<String> snos = scService.getCourseSelectSno(Integer.parseInt(cno));
          for(String sno:snos) {
              stuMessages.add(stuinfoService.getUsersMessage(sno));
          }
          mv.addObject("snos",snos);
          mv.addObject("stuMessages",stuMessages);
          return mv;
     }



}
