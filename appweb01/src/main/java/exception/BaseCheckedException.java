package exception;

public class BaseCheckedException extends Exception {
  public BaseCheckedException() {
    super();
  }

  public BaseCheckedException(String message, Throwable cause, boolean enableSuppression,
      boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }

  public BaseCheckedException(String message, Throwable cause) {
    super(message, cause);
  }

  public BaseCheckedException(String message) {
    super(message);
  }

  public BaseCheckedException(Throwable cause) {
    super(cause);
  }
}
