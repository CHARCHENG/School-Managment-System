package com.charlie.service;

import com.charlie.entity.Course;
import com.charlie.entity.Sc;
import org.apache.ibatis.annotations.Param;

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

    /**
     * 更新学生课程成绩
     *
     * @param dailyPerformance      日常表现
     * @param finalexamPerformance  finalexam性能
     * @param experimentPerformance 实验性能
     * @param midtermPerfoemance    中期perfoemance
     * @param finalGrade            最终成绩
     * @param sno                   学号
     * @param cno                   课程号
     */
    void updateStudentCourseGrade(Integer dailyPerformance, Integer finalexamPerformance, Integer experimentPerformance, Integer midtermPerfoemance, Integer finalGrade, String sno,Integer cno);



}
