package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/action/register/*")
public class RegisterAction extends AppServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = getRoutePath(request);
    boolean isGet = request.getMethod() == "GET";
    boolean isPost = request.getMethod() == "POST";

    if (isGet && path.equals("/login/login_input.page")) {
      PrintWriter out = response.getWriter();
      out.println("<h1>==login_input.page==</h1>");
      out.close();
      return;
    }

    if (isPost && path.equals("/login/login.do")) {
      login(request, response);
      return;
    }

    super.doGet(request, response);
  }


  private void login(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {}


}
