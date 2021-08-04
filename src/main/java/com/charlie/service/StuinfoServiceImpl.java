package com.charlie.service;

import com.charlie.dao.StuinfoDao;
import com.charlie.entity.Stuinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("stuinfoService")
public class StuinfoServiceImpl implements StuinfoService
{
    @Autowired
    private StuinfoDao stuinfoDao;

    @Override
    public Stuinfo getUsersMessage(String sno)
    {
        return stuinfoDao.getStudentMessageBySno(sno);
    }
}
