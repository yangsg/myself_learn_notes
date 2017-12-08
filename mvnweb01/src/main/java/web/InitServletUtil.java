package web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class InitServletUtil extends HttpServlet {
  private static final long serialVersionUID = 1L;

  private static String CONTEXT_PATH;

  public static String getContextPath() {
    return CONTEXT_PATH;
  }

  @Override
  public void init() throws ServletException {
    super.init();
    CONTEXT_PATH = getServletContext().getContextPath();
  }
}
