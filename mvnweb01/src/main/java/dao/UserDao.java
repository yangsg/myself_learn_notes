package dao;

import java.util.Map;

import entity.User;
import exception.DaoException;

public interface UserDao {
  void insertNewUser(User user) throws DaoException;

  User findUserByName(String username) throws DaoException;

  Map<Long, User> loadAllUsers() throws DaoException;

  User findUserById(Long id) throws DaoException;

  void deleteUserById(Long id) throws DaoException;
}
