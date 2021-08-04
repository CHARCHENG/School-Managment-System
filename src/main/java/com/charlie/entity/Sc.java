package com.charlie.entity;

import org.springframework.stereotype.Component;

@Component
public class Sc
{
    private Stuinfo stuinfo;
    private Integer dailyPerformance;
    private Integer finalexamPerformance;
    private Integer experimentPerformance;
    private Integer midtermPerfoemance;
    private Integer finalGrade;
    private Course course;

    public Sc()
    { }

    public Stuinfo getStuinfo() {
        return stuinfo;
    }

    public void setStuinfo(Stuinfo stuinfo) {
        this.stuinfo = stuinfo;
    }

    public Integer getDailyPerformance() {
        return dailyPerformance;
    }

    public void setDailyPerformance(Integer dailyPerformance) {
        this.dailyPerformance = dailyPerformance;
    }

    public Integer getFinalexamPerformance() {
        return finalexamPerformance;
    }

    public void setFinalexamPerformance(Integer finalexamPerformance) {
        this.finalexamPerformance = finalexamPerformance;
    }

    public Integer getExperimentPerformance() {
        return experimentPerformance;
    }

    public void setExperimentPerformance(Integer experimentPerformance) {
        this.experimentPerformance = experimentPerformance;
    }

    public Integer getFinalGrade() {
        return finalGrade;
    }

    public void setFinalGrade(Integer finalGrade) {
        this.finalGrade = finalGrade;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getMidtermPerfoemance() {
        return midtermPerfoemance;
    }

    public void setMidtermPerfoemance(Integer midtermPerfoemance) {
        this.midtermPerfoemance = midtermPerfoemance;
    }

    @Override
    public String toString() {
        return "Sc{" +
                "stuinfo=" + stuinfo +
                ", dailyPerformance=" + dailyPerformance +
                ", finalexamPerformance=" + finalexamPerformance +
                ", experimentPerformance=" + experimentPerformance +
                ", midtermPerfoemance=" + midtermPerfoemance +
                ", finalGrade=" + finalGrade +
                ", course=" + course +
                '}';
    }
}
