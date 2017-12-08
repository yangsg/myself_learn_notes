package appweb;

import java.nio.file.Path;
import java.nio.file.Paths;

public class Test01 {

  public Test01() {
    // TODO Auto-generated constructor stub
  }

  public static void main(String[] args) {
    Path a = Paths.get("/A", "B");
    System.out.println(a.toString());

  }

}
