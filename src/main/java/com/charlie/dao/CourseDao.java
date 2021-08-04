package com.charlie.dao;

import com.charlie.entity.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CourseDao
{
    /**
     * 获取学生选择所有课程的信息
     * @param cno 课程号
     * @return {@link Course}
     */
    Course getStudentSelectedAllCourseMessage(int cno);

    /**
     * 获取所有课程信息
     * @param term  学期
     * @param de_id 学部号
     * @return {@link List<Course>}
     */
    List<Course> getAllCourseMessage(@Param("term") Integer term,@Param("de_id") Integer de_id);
}
