package com.charlie.dao;

import com.charlie.entity.Stuinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface StuinfoDao
{
    /**
     * 通过学号获得学生信息
     * @param sno 学号
     * @return {@link Stuinfo}
     */
    Stuinfo getStudentMessageBySno(@Param("sno") String sno);

}
