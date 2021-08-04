package com.charlie.service;


import com.charlie.entity.Course;

import java.util.List;

public interface CourseService
{
    /**
     * 获得所有课程
     * @return {@link List<Course>}
     */
    List<Course> getAllCourse(Integer term, Integer de_id);

    /**
     * 获得学生选择课程
     * @param cno 学号
     * @return {@link Course}
     */
    Course getStudentSelectedCourse(int cno);

}
