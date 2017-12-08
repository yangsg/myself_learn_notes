package service;

import java.util.Map;

import entity.User;
import exception.DaoException;
import exception.EntityExistedException;

public interface UserService {
  void save(User user) throws DaoException, EntityExistedException;

  Map<Long, User> loadAllUsers() throws DaoException;

  void removeUserById(Long id) throws DaoException;
}
