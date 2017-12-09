package junit_in_action_2nd.ch03_mastering;

// book: <JUnit in Action: 2 edition>
public class ErrorResponse implements Response {
  private Request originalRequest;

  private Exception originalException;

  public ErrorResponse(Request request, Exception exception) {
    this.originalRequest = request;
    this.originalException = exception;
  }

  public Request getOriginalRequest() {
    return this.originalRequest;
  }

  public Exception getOriginalException() {
    return this.originalException;
  }
}
