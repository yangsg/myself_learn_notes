package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.CookieUtil;
import util.ServletUtil;

@WebServlet("/action/login/*")
public class LoginAction extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static final String actionBasePath = "/action/login/*";

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String uri = request.getRequestURI();
    String action =
        uri.substring(request.getContextPath().length() + actionBasePath.lastIndexOf("/*"));


    if ("/login_entry".equals(action)) {
      CookieUtil.saveCookie("t_", "used cookie deleted", response);
      CookieUtil.saveCookie("alc_", "used cookie enable", response);
      ServletUtil.forwardJsp("login/login_page", this, request, response);
      return;
    } else if ("/login_do".equals(action)) {
      String time = CookieUtil.getCookieValue("t_", request);
      String cookieEnable = CookieUtil.getCookieValue("alc_", request);
      if (time == null || cookieEnable == null) {
        PrintWriter out = response.getWriter();
        out.println("<h1>cookie disabled</h1>");
        out.close();
        return;
      } else if (true) {
        PrintWriter out = response.getWriter();
        out.println("<h1>cookie enable</h1>");
        out.close();
        return;
      }
      String username = request.getParameter("username");
      System.out.println(username == null);
      if ("hello".equals(username)) {
        ServletUtil.redirect("login/login_success", request, response);
      } else {
        ServletUtil.forwardJsp("login/login_error", this, request, response);
      }
    } else {
      PrintWriter out = response.getWriter();
      out.println("<h1>" + action + "</h1>");
      out.close();
      // response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

}
