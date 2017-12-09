package junit_in_action_2nd.ch02_internals;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

// book: <JUnit in Action: 2 edition>
public class TestCaseA {
  @Test
  public void testA1() {
    assertEquals("Dummy test-case", 1 + 1, 2);
  }
}
