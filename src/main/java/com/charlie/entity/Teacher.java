package com.charlie.entity;

import org.springframework.stereotype.Component;

@Component
public class Teacher
{
    private String tno;
    private String tname;
    private String tpassword;
    private String tbirthdat;
    private String title;
    private String graduationSchool;
    private String academicDegree;
    private int employeeDate;
    private String tsex;
    private Department department;

    public Teacher()
    { }

    public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTpassword() {
        return tpassword;
    }

    public void setTpassword(String tpassword) {
        this.tpassword = tpassword;
    }

    public String getTbirthdat() {
        return tbirthdat;
    }

    public void setTbirthdat(String tbirthdat) {
        this.tbirthdat = tbirthdat;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGraduationSchool() {
        return graduationSchool;
    }

    public void setGraduationSchool(String graduationSchool) {
        this.graduationSchool = graduationSchool;
    }

    public String getAcademicDegree() {
        return academicDegree;
    }

    public void setAcademicDegree(String academicDegree) {
        this.academicDegree = academicDegree;
    }

    public int getEmployeeDate() {
        return employeeDate;
    }

    public void setEmployeeDate(int employeeDate) {
        this.employeeDate = employeeDate;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

}
