package com.charlie.service;

import com.charlie.dao.ScDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("scService")
public class ScServiceImpl implements ScService
{
    @Autowired
    private ScDao scDao;

    @Override
    public List<Integer> getStudentSelectCno(String sno) {
        return scDao.getStudentSelectCourseCno(sno);
    }

    @Override
    public List<String> getCourseSelectSno(int cno) {
        return scDao.getCourseSelectedSno(cno);
    }

    @Override
    public void insertCourse(String sno, Integer cno) {
        scDao.insertMessageIntoSc(sno,cno);
    }

    @Override
    public void returnCourse(String sno, Integer cno) {
        scDao.deleteMessageFromSc(sno,cno);
    }

    @Override
    public List<Map<String, Object>> getAllSelectedCourseGrades(String sno) {
        return scDao.getAllSelectedCourseGrades(sno);
    }
}
