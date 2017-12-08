package entity;

public class User {
  private Long id;
  private String name;
  private char sex;

  public User() {

  }

  public User(Long id, String name, char sex) {
    super();
    this.id = id;
    this.name = name;
    this.sex = sex;
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

  public char getSex() {
    return sex;
  }

  public void setSex(char sex) {
    this.sex = sex;
  }
}
