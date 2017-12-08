package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppServlet extends HttpServlet {
  protected final static String ACTION_PATH = "/action";
  private String contextPath;



  @Override
  public void init() throws ServletException {
    super.init();
    contextPath = getServletContext().getContextPath();
  }

  protected String getContextPath() {
    return contextPath;
  }

  protected String getRoutePath(HttpServletRequest request) {
    String uri = request.getRequestURI();

    String path =
        uri.substring(getServletContext().getContextPath().length()
            + UserAction.ACTION_PATH.length());
    return path;
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.sendError(HttpServletResponse.SC_NOT_FOUND);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

}
