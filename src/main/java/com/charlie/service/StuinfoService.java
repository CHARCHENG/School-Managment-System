package com.charlie.service;

import com.charlie.entity.Stuinfo;


public interface StuinfoService
{
    /**
     * 得到用户信息
     * @param sno sno
     * @return {@link Stuinfo}
     */
    Stuinfo getUsersMessage(String sno);

}
