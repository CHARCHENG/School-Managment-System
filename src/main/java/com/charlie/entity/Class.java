package com.charlie.entity;

import org.springframework.stereotype.Component;

@Component
public class Class
{
    private String cid;
    private String className;
    private Major major;

    public Class()
    { }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }
}
