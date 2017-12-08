package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import util.DBUtil;
import dao.UserDao;
import entity.User;
import exception.DaoException;

public class UserDaoJdbcImpl implements UserDao {

  @Override
  public void insertNewUser(User user) throws DaoException {
    PreparedStatement pstmt = null;
    try {
      Connection conn = DBUtil.getConnection();
      pstmt = conn.prepareStatement("insert into t_user(name,salary,description) values(?,?,?)");
      pstmt.setString(1, user.getName());
      pstmt.setDouble(2, user.getSalary());
      pstmt.setString(3, user.getDescription());
      pstmt.executeUpdate();
    } catch (SQLException e) {
      throw new DaoException(e);
    } finally {
      DBUtil.closeQuiety(pstmt);
    }
  }

  @Override
  public User findUserByName(String username) throws DaoException {
    User user = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      Connection conn = DBUtil.getConnection();
      pstmt =
          conn.prepareStatement("select id,name,salary,sex,description from t_user where name = ?");
      pstmt.setString(1, username);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        user = new User();
        user.setId(rs.getLong("id"));
        user.setName(rs.getString("name"));
        user.setSalary(rs.getDouble("salary"));
        user.setDescription(rs.getString("description"));
      }
      return user;
    } catch (SQLException e) {
      throw new DaoException(e);
    } finally {
      DBUtil.closeQuiety(rs);
      DBUtil.closeQuiety(pstmt);
    }
  }

  @Override
  public Map<Long, User> loadAllUsers() throws DaoException {
    Map<Long, User> users = new HashMap<Long, User>();
    Statement stmt = null;
    ResultSet rs = null;
    try {
      Connection conn = DBUtil.getConnection();
      stmt = conn.createStatement();
      rs = stmt.executeQuery("select id,name,salary,sex,description from t_user");
      while (rs.next()) {
        User user = new User();
        Long id = rs.getLong("id");
        user.setId(id);
        user.setName(rs.getString("name"));
        user.setSalary(rs.getDouble("salary"));
        // TODO:user.setSex
        user.setDescription(rs.getString("description"));
        users.put(id, user);
      }
      return users;
    } catch (SQLException e) {
      throw new DaoException(e);
    } finally {
      DBUtil.closeQuiety(rs);
      DBUtil.closeQuiety(stmt);
    }
  }

  @Override
  public User findUserById(Long id) throws DaoException {
    User user = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      Connection conn = DBUtil.getConnection();
      pstmt =
          conn.prepareStatement("select id,name,salary,sex,description from t_user where id = ?");
      pstmt.setLong(1, id);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        user = new User();
        user.setId(rs.getLong("id"));
        user.setName(rs.getString("name"));
        user.setSalary(rs.getDouble("salary"));
        // TODO:user.setSex
        user.setDescription(rs.getString("description"));
      }
      return user;
    } catch (SQLException e) {
      throw new DaoException(e);
    } finally {
      DBUtil.closeQuiety(rs);
      DBUtil.closeQuiety(pstmt);
    }
  }

  @Override
  public void deleteUserById(Long id) throws DaoException {
    PreparedStatement pstmt = null;
    try {
      Connection conn = DBUtil.getConnection();
      pstmt = conn.prepareStatement("delete from t_user where id = ?");
      pstmt.setLong(1, id);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      throw new DaoException(e);
    } finally {
      DBUtil.closeQuiety(pstmt);
    }
  }

}
