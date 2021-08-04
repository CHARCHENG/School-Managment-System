package com.charlie.service;

import com.charlie.dao.TeacherDao;
import com.charlie.entity.Course;
import com.charlie.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService
{
    @Autowired
    TeacherDao teacherDao;

    @Override
    public Teacher getTeacherMessage(String tno) {
        return teacherDao.getTeacherMessageByTno(tno);
    }

    @Override
    public List<Course> teachCourse(String tno) {
        return teacherDao.getCourseMessage(tno);
    }
}
