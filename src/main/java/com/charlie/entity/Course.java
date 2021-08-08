package com.charlie.entity;

import org.springframework.stereotype.Component;

@Component
public class Course
{
    private Integer cno;
    private String cname;
    private Integer term;
    private Integer cscore;
    private Integer locked;
    private String classroom;
    private Integer weekend;
    private Integer capacity;
    private String csname;
    private String testClassroom;
    private String testTimes;
    private Integer indexs;
    private Times times;
    private Teacher teacher;

    public Course()
    { }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Integer getCscore() {
        return cscore;
    }

    public void setCscore(Integer cscore) {
        this.cscore = cscore;
    }

    public Integer getLocked() {
        return locked;
    }

    public void setLocked(Integer locked) {
        this.locked = locked;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public Integer getWeekend() {
        return weekend;
    }

    public void setWeekend(Integer weekend) {
        this.weekend = weekend;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public String getCsname() {
        return csname;
    }

    public void setCsname(String csname) {
        this.csname = csname;
    }

    public Times getTimes() {
        return times;
    }

    public void setTimes(Times times) {
        this.times = times;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getTestClassroom() {
        return testClassroom;
    }

    public void setTestClassroom(String testClassroom) {
        this.testClassroom = testClassroom;
    }

    public String getTestTimes() {
        return testTimes;
    }

    public void setTestTimes(String testTimes) {
        this.testTimes = testTimes;
    }

    public Integer getIndexs() {
        return indexs;
    }

    public void setIndexs(Integer indexs) {
        this.indexs = indexs;
    }
}
