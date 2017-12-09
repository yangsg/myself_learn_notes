package junit_in_action_2nd.ch03_mastering;

// book: <JUnit in Action: 2 edition>
public interface Controller {
  Response processRequest(Request request);

  void addHandler(Request request, RequestHandler requestHandler);
}
