package exception;

public class DaoException extends BaseCheckedException {

  public DaoException() {}

  public DaoException(String message, Throwable cause, boolean enableSuppression,
      boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }

  public DaoException(String message, Throwable cause) {
    super(message, cause);
  }

  public DaoException(String message) {
    super(message);
  }

  public DaoException(Throwable cause) {
    super(cause);
  }
}
