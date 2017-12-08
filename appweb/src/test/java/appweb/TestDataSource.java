package appweb;


import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zaxxer.hikari.HikariDataSource;


public class TestDataSource {
  ApplicationContext ctx;
  {
    ctx = new ClassPathXmlApplicationContext();
  }

  @Test
  public void test() {
    System.out.println("hello world");

  }

  // org.springframework.jdbc.datasource.DriverManagerDataSource
  @Test
  public void testDataSource() throws SQLException {
    HikariDataSource dataSource = ctx.getBean("dataSource", HikariDataSource.class);
    Connection conn = dataSource.getConnection();
    System.out.println(dataSource.getConnection());
    conn.close();
    // dataSource.shutdown();
  }

}
