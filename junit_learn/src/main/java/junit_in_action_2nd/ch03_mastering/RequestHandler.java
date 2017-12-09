package junit_in_action_2nd.ch03_mastering;

// book: <JUnit in Action: 2 edition>
public interface RequestHandler {
  Response process(Request request) throws Exception;
}
