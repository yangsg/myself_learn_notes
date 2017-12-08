package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ServletUtil;

@WebServlet("*.page")
public class JspViewServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = request.getRequestURI().substring(request.getContextPath().length());

    // ====
    if ("/index".equals(path.substring(0, path.lastIndexOf(".page")))) {
      ServletUtil.forwardJsp(path.substring(0, path.lastIndexOf(".page")), this, request, response);
      return;
    }

    response.sendError(HttpServletResponse.SC_NOT_FOUND);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

}
