package com.charlie.servlet;

import com.charlie.dao.TeacherDao;
import com.charlie.entity.Course;
import com.charlie.entity.Teacher;
import com.charlie.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TeacherServlet
{
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

}
