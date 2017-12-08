package service.fake;

import java.util.HashMap;
import java.util.Map;

import service.UserService;
import entity.User;

public class UserServiceFake implements UserService {
  Map<Long, User> dataSource = new HashMap<Long, User>();

  {
    dataSource.put(1L, new User(1L, "user01", 'F'));
    dataSource.put(2L, new User(2L, "user01", 'M'));
    dataSource.put(3L, new User(3L, "user01", 'M'));
    dataSource.put(4L, new User(4L, "user01", 'F'));
  }

  public Map<Long, User> loadAll() {
    return dataSource;
  }

  public User loadById(Long id) {
    return dataSource.get(id);
  }

  public void save(User user) {
    dataSource.put(user.getId(), user);
  }

  public void modify(User user) {
    dataSource.put(user.getId(), user);
  }

  public void remove(Long id) {
    dataSource.remove(id);
  }

}
