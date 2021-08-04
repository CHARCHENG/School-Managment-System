package com.charlie.dao;

import com.charlie.entity.Course;
import com.charlie.entity.Stuinfo;
import com.charlie.entity.Teacher;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherDao
{
    /**
     * 根据老师教工号获得信息
     * @param tno 号
     * @return {@link Stuinfo}
     */
    Teacher getTeacherMessageByTno(@Param("tno") String tno);

    /**
     * 得到教授课程信息
     * @param tno tno
     * @return {@link List<Course>}
     */
    List<Course> getCourseMessage(@Param("tno") String tno);
}
