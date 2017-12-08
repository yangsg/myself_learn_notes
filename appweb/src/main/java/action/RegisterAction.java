package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ServletUtil;

@WebServlet("/action/register/*")
public class RegisterAction extends AppServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = getRoutePath(request);
    boolean isGet = request.getMethod() == "GET";
    boolean isPost = request.getMethod() == "POST";

    if (isGet && path.equals("/register/register_input.page")) {
      ServletUtil.forwardJsp("/register/register_input.jsp", this, request, response);
      return;
    }

    if (isPost && path.equals("/register/register.do")) {
      register(request, response);
      return;
    }

    super.doGet(request, response);
  }


  private void register(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {}


}
