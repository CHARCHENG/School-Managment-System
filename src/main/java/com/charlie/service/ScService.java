package com.charlie.service;

import com.charlie.entity.Course;
import com.charlie.entity.Sc;

import java.util.List;
import java.util.Map;

public interface ScService
{
    /**
     * 获得所有学生选择课程号
     * @param sno sno
     * @return {@link List<Course>}
     */
    List<Integer> getStudentSelectCno(String sno);

    /**
     * 得到选择一门课程的所有学生的sno
     * @param cno 课程号
     * @return {@link List<Integer>}
     */
    List<String> getCourseSelectSno(int cno);

    /**
     * 插入课程
     * @param sno 学号
     * @param cno 课程号
     */
    void insertCourse(String sno, Integer cno);

    /**
     * 返回课程
     * @param sno 学号
     * @param cno 课程号
     */
    void returnCourse(String sno, Integer cno);

    /**
     * 得到所有选定的课程成绩
     * @param sno sno
     * @return {@link List<Sc>}
     */
    List<Map<String, Object>> getAllSelectedCourseGrades(String sno);

}
