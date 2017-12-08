package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public abstract class AppServlet extends HttpServlet {
  protected final static String ACTION_PATH = "/action";
  private String contextPath;
  private WebApplicationContext webApplicationContext;

  public WebApplicationContext getWebApplicationContext() {
    return webApplicationContext;
  }

  @Override
  public void init() throws ServletException {
    super.init();
    contextPath = getServletContext().getContextPath();

    webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
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

