package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import exception.DaoException;
import exception.EntityExistedException;
import service.UserService;
import service.impl.UserServiceImpl;
import util.DBUtil;
import util.ServletUtil;

/**
 * Servlet implementation class UserAction
 */
@WebServlet("/action/user/*")
public class UserAction extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static final String actionBasePath = "/action/user/*";

  private UserService userService = new UserServiceImpl();

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String uri = request.getRequestURI();
    String action =
        uri.substring(request.getContextPath().length() + actionBasePath.lastIndexOf("/*"));


    if ("/user_list_do".equals(action)) {
      Map<Long, User> users;
      try {
        users = userService.loadAllUsers();
        request.setAttribute("users", users);
        ServletUtil.forwardJsp("user/user_list_success", this, request, response);
      } catch (DaoException e) {
        e.printStackTrace();// TODO: logger
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      }

      return;
    } else if ("/user_edit_page".equals(action)) {
      // load correspond user
      ServletUtil.forwardJsp("user/user_edit_page", this, request, response);
      return;
    } else if ("/user_edit_do".equals(action)) {

    } else if ("/user_delete_do".equals(action)) {
      Long id = ServletUtil.getLongValue(request.getParameter("id"));
      if (id == null) {
        ServletUtil.redirect("/action/user/user_list_do", request, response);
        return;
      }

      try {
        userService.removeUserById(id);
        ServletUtil.redirect("/action/user/user_list_do", request, response);
      } catch (DaoException e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      }
      return;
    } else if ("/user_new_page".equals(action)) {
      ServletUtil.forwardJsp("user/user_new_page", this, request, response);
      return;
    } else if ("/user_new_do".equals(action)) {
      String name = ServletUtil.getNotEmptyTrimString(request.getParameter("username"));
      Double salary = ServletUtil.getDoubleValue(request.getParameter("salary"));
      // Character sex = ServletUtil.getNotSpaceCharValue(request.getParameter("sex"));
      String description = ServletUtil.getNotEmptyTrimString(request.getParameter("description"));

      if (name == null || salary == null || description == null) {
        request.setAttribute("err_msg", "please input the correct data");
        ServletUtil.forwardJsp("user/user_new_page", this, request, response);
        return;
      }

      User user = new User();
      user.setName(name);
      user.setSalary(salary);
      user.setDescription(description);

      try {
        userService.save(user);

        ServletUtil.redirect("/action/user/user_list_do", request, response);
      } catch (DaoException e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      } catch (EntityExistedException e) {
        request.setAttribute("err_msg", "the user is existed");
        ServletUtil.forwardJsp("user/user_new_page", this, request, response);
      }
      return;
    } else {
      System.out.println(action);
      response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }


}
