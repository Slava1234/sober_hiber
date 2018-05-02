package ru.sober.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "cv")
public class Cv {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "fio")
    private String fio;

    @Column(name = "birthdate")
    private String birthdate;

    @Column(name = "birth")
    private Date birth;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "sellary")
    private String sellary;


    @Column(name = "experiance_years")
    private String experiance_years;

    @Column(name = "experiance_places")
    private String experiance_places;

    @Column(name = "skills")
    private String skills;

    @Column(name = "about")
    private String about;

    @Column(name = "comment")
    private String comment;

    @Column(name = "bookmark")
    private Integer bookmark;

    public Cv() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSellary() {
        return sellary;
    }

    public void setSellary(String sellary) {
        this.sellary = sellary;
    }

    public String getExperiance_years() {
        return experiance_years;
    }

    public void setExperiance_years(String experiance_years) {
        this.experiance_years = experiance_years;
    }

    public String getExperiance_places() {
        return experiance_places;
    }

    public void setExperiance_places(String experiance_places) {
        this.experiance_places = experiance_places;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getBookmark() {
        return bookmark;
    }

    public void setBookmark(Integer bookmark) {
        this.bookmark = bookmark;
    }

    @Override
    public String toString() {
        return "Cv{" +
                "id=" + id +
                ", fio='" + fio + '\'' +
                ", birthdate='" + birthdate + '\'' +
                ", birth=" + birth +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", sellary='" + sellary + '\'' +
                ", experiance_years='" + experiance_years + '\'' +
                ", experiance_places='" + experiance_places + '\'' +
                ", skills='" + skills + '\'' +
                ", about='" + about + '\'' +
                ", comment='" + comment + '\'' +
                ", bookmark=" + bookmark +
                '}';
    }
}
