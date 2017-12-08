package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class DBUtil {
  private static final Logger logger = LogManager.getLogger();
  private static ThreadLocal<Connection> connectionHolder = new ThreadLocal<Connection>();
  static {
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException ex) {
      throw new ExceptionInInitializerError(ex);
    }
  }

  public static Connection getConnection() throws SQLException {
    Connection conn = connectionHolder.get();
    if (conn == null) {
      conn = getConn();
      connectionHolder.set(conn);
    }
    return conn;
  }

  public static void close() throws SQLException {
    Connection conn = connectionHolder.get();
    if (conn == null) {
      return;
    }

    conn.close();
    connectionHolder.remove();
  }

  public static void closeQuietyAndLogger() {
    Connection conn = connectionHolder.get();
    if (conn == null) {
      return;
    }

    try {
      conn.close();
      // TODO: logger
      System.err.println("success to closeQuiety");
    } catch (SQLException ex) {
      // ignore ex
      // TODO: logger
      logger.error("========failed to closeQuiety the connection", ex);
    } finally {
      connectionHolder.remove();
    }
  }


  public static Connection getConn() throws SQLException {
    Connection conn = null;

    // TODO: use configuration file
    conn =
        DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/mydb01?useUnicode=true&characterEncoding=utf8", "test",
            "1234");
    return conn;
  }

  public static void close(Connection conn) throws SQLException {
    if (conn == null) {
      return;
    }

    conn.close();

  }

  public static void closeQuiety(Connection conn) {
    if (conn == null) {
      return;
    }
    try {
      conn.close();
    } catch (Exception ex) {
      // Ignore ex
      logger.error("========failed to closeQuiety the connection", ex);
    }
  }

  public static void closeQuiety(Statement stmt) {
    if (stmt == null) {
      return;
    }
    try {
      stmt.close();
    } catch (Exception ex) {
      // Ignore ex
      logger.error("========failed to closeQuiety the statement", ex);
    }
  }

  public static void closeQuiety(ResultSet rs) {
    if (rs == null) {
      return;
    }
    try {
      rs.close();
    } catch (Exception ex) {
      // Ignore ex
      logger.error("========failed to closeQuiety the resultSet", ex);
    }
  }
}
