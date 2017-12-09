package junit_learn;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class TestBeforeAfterFixture {
  private static int count = 0;
  private final int id = ++count;

  @BeforeClass
  public static void appInit() {
    System.out.println("--appInit");
  }

  @AfterClass
  public static void appDestory() {
    System.out.println("--appDestory");
  }

  @Before
  public void init() {
    System.out.println("--init-id:" + id);
  }

  @After
  public void destroy() {
    System.out.println("--destroy-id:" + id);
  }

  @Test
  public void test01() {
    System.out.println("--test01-id:" + id);
  }

  @Test
  public void test02() {
    System.out.println("--test02-id:" + id);
  }

}
