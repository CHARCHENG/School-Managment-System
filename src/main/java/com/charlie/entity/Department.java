package com.charlie.entity;

import org.springframework.stereotype.Component;

@Component
public class Department
{
    private Integer de_id;
    private String departName;

    public Department()
    { }

    public Department(Integer de_id, String departName) {
        this.de_id = de_id;
        this.departName = departName;
    }

    public Integer getDe_id() {
        return de_id;
    }

    public void setDe_id(Integer de_id) {
        this.de_id = de_id;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }
}
