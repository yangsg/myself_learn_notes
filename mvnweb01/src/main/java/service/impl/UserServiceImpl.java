package service.impl;

import java.sql.PreparedStatement;
import java.util.Map;

import service.UserService;
import util.DBUtil;
import util.TransactionManager;
import dao.UserDao;
import dao.impl.UserDaoJdbcImpl;
import entity.User;
import exception.DaoException;
import exception.EntityExistedException;

public class UserServiceImpl implements UserService {
  private UserDao userdao = new UserDaoJdbcImpl();

  public void save(User user) throws DaoException, EntityExistedException {
    try {
      TransactionManager.begintTransaction();
      if (userdao.findUserByName(user.getName()) != null) {
        throw new EntityExistedException();
      }
      userdao.insertNewUser(user);
      TransactionManager.commit();
    } catch (DaoException | EntityExistedException e) {
      TransactionManager.rollback(); // TODO
      throw e;
    }
  }

  @Override
  public Map<Long, User> loadAllUsers() throws DaoException {
    return userdao.loadAllUsers();
  }

  @Override
  public void removeUserById(Long id) throws DaoException {
    try {
      TransactionManager.begintTransaction();
      userdao.deleteUserById(id);
      TransactionManager.commit();
    } catch (DaoException e) {
      TransactionManager.rollback(); // TODO
      throw e;
    }
  }
}
