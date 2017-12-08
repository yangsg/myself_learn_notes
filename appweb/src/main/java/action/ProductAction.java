package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ServletUtil;

@WebServlet("/action/product/*")
public class ProductAction extends AppServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = getRoutePath(request);
    boolean isGet = request.getMethod() == "GET";
    boolean isPost = request.getMethod() == "POST";

    if (isGet && path.equals("/product/main.page")) {
      ServletUtil.forwardJsp("/product/main.jsp", this, request, response);
      return;
    }


    super.doGet(request, response);
  }

}
