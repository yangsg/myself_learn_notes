package util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.InitServletUtil;

public class CookieUtil {
  private static final String ROOT_PATH = InitServletUtil.getContextPath();
  private static final int MAX_AGE = 365 * 24 * 3600;
  private static final String UTF_8 = "UTF-8";

  public static void saveCookie(String name, String value, HttpServletResponse response, int maxAge)
      throws UnsupportedEncodingException {
    Cookie cookie = new Cookie(name, URLEncoder.encode(value, UTF_8));
    cookie.setPath(ROOT_PATH);
    cookie.setMaxAge(maxAge);
    response.addCookie(cookie);
  }

  public static void saveCookie(String name, String value, HttpServletResponse response)
      throws UnsupportedEncodingException {
    saveCookie(name, value, response, MAX_AGE);
  }

  public static String getCookieValue(Cookie[] cookies, String cookieName, String defaultValue)
      throws UnsupportedEncodingException {
    if (cookies == null) {
      return defaultValue;
    }
    for (Cookie cookie : cookies) {
      if (cookie.getName().equals(cookieName)) {
        return URLDecoder.decode(cookie.getValue(), UTF_8);
      }
    }
    return defaultValue;
  }

  public static String getCookieValue(String name, HttpServletRequest request, String defaultValue)
      throws UnsupportedEncodingException {
    Cookie[] cookies = request.getCookies();
    return getCookieValue(cookies, name, defaultValue);
  }

  public static String getCookieValue(String name, HttpServletRequest request)
      throws UnsupportedEncodingException {
    Cookie[] cookies = request.getCookies();
    return getCookieValue(cookies, name, null);
  }

  public static void removeCookie(String name, HttpServletResponse response) {
    Cookie cookie = new Cookie(name, "");
    cookie.setMaxAge(0);
    cookie.setPath(ROOT_PATH);
    response.addCookie(cookie);
  }
}
