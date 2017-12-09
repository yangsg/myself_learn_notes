package junit_in_action_2nd.ch02_internals;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

// book: <JUnit in Action: 2 edition>
@RunWith(value = Suite.class)
@SuiteClasses(value = {TestCaseB.class})
public class TestSuiteB {
}
