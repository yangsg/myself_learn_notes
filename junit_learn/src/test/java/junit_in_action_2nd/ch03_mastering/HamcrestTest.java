package junit_in_action_2nd.ch03_mastering;

import static org.hamcrest.CoreMatchers.anyOf;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.hasItem;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class HamcrestTest {

  private List<String> values;

  @Before
  public void setUpList() {
    values = new ArrayList<String>();
    values.add("x");
    values.add("y");
    values.add("z");
  }

  @Test
  public void testWithoutHamcrest() {
    assertTrue(values.contains("one") || values.contains("two") || values.contains("three"));
  }

  @Test
  public void testWithHamcrest() {
    assertThat(values, hasItem(anyOf(equalTo("one"), equalTo("two"), equalTo("three"))));
  }
}
