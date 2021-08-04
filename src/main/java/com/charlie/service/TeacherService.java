package com.charlie.service;

import com.charlie.entity.Course;
import com.charlie.entity.Teacher;

import java.util.List;


public interface TeacherService
{
    /**
     * 得到老师的信息
     * @param tno tno
     * @return {@link Teacher}
     */
    Teacher getTeacherMessage(String tno);


    /**
     * 教授课程
     * @param tno tno
     * @return {@link List<Course>}
     */
    List<Course> teachCourse(String tno);
}
