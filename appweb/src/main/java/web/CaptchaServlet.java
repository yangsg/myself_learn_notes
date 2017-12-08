package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ImageVerifyCodeUtil;

@WebServlet("/vcode")
public class CaptchaServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession(true);
    String captcha = ImageVerifyCodeUtil.sendVerifyCode(response);
    session.setAttribute("captcha", captcha);
  }
}
