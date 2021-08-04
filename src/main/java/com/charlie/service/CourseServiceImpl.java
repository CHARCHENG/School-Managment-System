package com.charlie.service;

import com.charlie.dao.CourseDao;
import com.charlie.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("courseService")
public class CourseServiceImpl implements CourseService
{

    @Autowired
    private CourseDao courseDao;

    @Override
    public List<Course> getAllCourse(Integer term, Integer de_id) {
        return courseDao.getAllCourseMessage(term,de_id);
    }

    @Override
    public Course getStudentSelectedCourse(int cno) {
        return courseDao.getStudentSelectedAllCourseMessage(cno);
    }
}
