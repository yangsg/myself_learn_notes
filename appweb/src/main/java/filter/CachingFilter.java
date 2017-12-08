package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/static/ext/*")
public class CachingFilter implements Filter {

  public void destroy() {}

  //http://stackoverflow.com/questions/11949718/enable-browser-caching-in-jsp
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.setHeader("Pragma", "private");
    httpResponse.setHeader("Cache-Control", "private");
    httpResponse.setDateHeader("Expires", System.currentTimeMillis() + 604800000L); // one week
    httpResponse.setDateHeader("Max-Age", System.currentTimeMillis() + 604800000L);

    chain.doFilter(request, response);
  }

  public void init(FilterConfig fConfig) throws ServletException {}

}
