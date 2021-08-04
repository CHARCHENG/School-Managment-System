package com.charlie.dao;

import com.charlie.entity.Sc;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface ScDao
{


    /**
     * 获取学生所有选择课程的学号
     * @param sno 学号
     * @return {@link List<Integer>}
     */
    List<Integer> getStudentSelectCourseCno(String sno);

    /**
     * 根据课程号获得选择该课程的所有学生的sno
     * @param cno 碳氮氧
     * @return {@link List<String>}
     */
    List<String> getCourseSelectedSno(int cno);

    /**
     * 将信息插入sc
     * @param sno 学号
     * @param cno 课程号
     */

    void insertMessageIntoSc(@Param("sno") String sno, @Param("cno") int cno);

    /**
     * 从sc删除消息
     * @param sno 学号
     * @param cno 课程号
     */
    void deleteMessageFromSc(@Param("sno") String sno, @Param("cno")int cno);

    /**
     * 得到所有选定的课程成绩
     *
     * @param sno 学号
     * @return {@link List<Sc>}
     */
    List<Map<String, Object>> getAllSelectedCourseGrades(String sno);

}
