package util;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUtil {
  private static boolean isViewMin = false;

  // http://stackoverflow.com/questions/22928427/how-to-redirect-to-jsp-inside-web-inf-folder
  public static void forwardJsp(String jspPath, HttpServlet servlet, HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher dispatcher =
        servlet.getServletContext().getRequestDispatcher(ServletUtil.getViewPath(jspPath));
    dispatcher.forward(request, response);
  }

  // http://stackoverflow.com/questions/4967482/redirect-pages-in-jsp
  public static void redirect(String redirectPath, HttpServletRequest request,
      HttpServletResponse response) throws IOException {
    response.sendRedirect(Paths.get(request.getContextPath(), redirectPath).toString());
  }



  private static String getViewPath(String jspPathRelativeToViewDir) {
    if (isViewMin) {
      return getViewMinPath(jspPathRelativeToViewDir);
    }
    return Paths.get("/WEB-INF/views", jspPathRelativeToViewDir).toString();
  }

  private static String getViewMinPath(String relativeToViewsPathOfJsp) {
    return Paths.get("/WEB-INF/viewmin/", relativeToViewsPathOfJsp).toString();
  }
}
