package util;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUtil {
  // http://stackoverflow.com/questions/22928427/how-to-redirect-to-jsp-inside-web-inf-folder
  public static void forwardJsp(String jspPath, HttpServlet servlet, HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher dispatcher =
        servlet.getServletContext().getRequestDispatcher(ServletUtil.getViewPath(jspPath));
    dispatcher.forward(request, response);
  }

  // http://stackoverflow.com/questions/4967482/redirect-pages-in-jsp
  public static void redirect(String relativeToViewsPathOfJsp, HttpServletRequest request,
      HttpServletResponse response) throws IOException {
    response.sendRedirect(Paths.get(request.getContextPath(), relativeToViewsPathOfJsp).toString());
  }



  public static String getViewPath(String relativeToViewsPathOfJsp) {
    if (true) {
      return getViewMinPath(relativeToViewsPathOfJsp);
    }
    return Paths.get("/WEB-INF/views", relativeToViewsPathOfJsp).toString();
  }

  private static String getViewMinPath(String relativeToViewsPathOfJsp) {
    return Paths.get("/WEB-INF/viewmin/", relativeToViewsPathOfJsp).toString();
  }

  public static String getNotEmptyTrimString(String value) {
    if (value == null) {
      return null;
    }
    String trimValue = value.trim();
    if (value.trim().length() == 0) {
      return null;
    }
    return trimValue;
  }

  public static Integer getInitValue(String value) {
    if (value == null || value.trim().length() == 0) {
      return null;
    }
    try {
      return Integer.parseInt(value);
    } catch (Exception ex) {
      return null;
    }
  }

  public static Double getDoubleValue(String value) {
    if (value == null || value.trim().length() == 0) {
      return null;
    }
    try {
      return Double.parseDouble(value);
    } catch (Exception ex) {
      return null;
    }
  }

  public static Character getNotSpaceCharValue(String value) {
    if (value == null) {
      return null;
    }

    String trimValue = value.trim();
    if (trimValue.length() != 1) {
      return null;
    }
    return trimValue.charAt(0);
  }

  public static Long getLongValue(String value) {
    if (value == null) {
      return null;
    }
    try {
      return Long.parseLong(value);
    } catch (Exception ex) {
      return null;
    }
  }
}
