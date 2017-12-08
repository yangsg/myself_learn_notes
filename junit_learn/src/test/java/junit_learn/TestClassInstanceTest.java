package junit_learn;

import org.junit.Test;

public class TestClassInstanceTest {
  private static int count = 0;
  {
    count++;
  }

  @Test
  public void test01() {
    System.out.println("Test01---------" + count);
  }

  @Test
  public void test02() {
    System.out.println("Test02---------" + count);
  }

}
