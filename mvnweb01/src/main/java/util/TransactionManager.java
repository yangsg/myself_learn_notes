package util;

import java.sql.Connection;
import java.sql.SQLException;

import exception.DaoException;

public class TransactionManager {
  public static void begintTransaction() throws DaoException {
    try {
      Connection conn = DBUtil.getConnection();
      conn.setAutoCommit(false);
    } catch (SQLException e) {
      throw new DaoException(e);
    }
  }

  public static void commit() throws DaoException {
    try {
      Connection conn = DBUtil.getConnection();
      conn.commit();
    } catch (SQLException e) {
      throw new DaoException(e);
    } finally {
      try {
        DBUtil.close();
      } catch (SQLException e) {
        DBUtil.closeQuietyAndLogger();
      }
    }
  }

  public static void rollback() throws DaoException {
    try {
      Connection conn = DBUtil.getConnection();
      conn.rollback();
    } catch (SQLException e) {
      throw new DaoException(e);
    } finally {
      try {
        DBUtil.close();
      } catch (SQLException e) {
        DBUtil.closeQuietyAndLogger();
      }
    }
  }
}
