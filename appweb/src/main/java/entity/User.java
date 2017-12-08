package entity;

import java.sql.Date;

public class User {
  private Long id;
  private String name;
  private String sex;
  private Date birthday;

  public User() {}

  public User(String name, String sex, Date birthday) {
    this.name = name;
    this.sex = sex;
    this.birthday = birthday;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public Date getBirthday() {
    return birthday;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }

}
