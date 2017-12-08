package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/action/user/*")
public class UserAction extends AppServlet {
  private UserService userService = null; // TODO: singleton


  @Override
  public void init() throws ServletException {
    super.init();
    userService = getWebApplicationContext().getBean("userService", UserService.class);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = getRoutePath(request);
    boolean isGet = request.getMethod() == "GET";
    boolean isPost = request.getMethod() == "POST";

    if (isGet && path.equals("/user/add_input.page")) {
      PrintWriter out = response.getWriter();
      out.println("<h1>==add_input.page==</h1>");
      out.close();
      return;
    }
    if (isGet && path.equals("/user/edit_input.page")) {
      PrintWriter out = response.getWriter();
      out.println("<h1>==edit_input.page==</h1>");
      out.close();
      return;
    }

    if (isGet && path.equals("/user/list.do")) {
      list(request, response);
      return;
    }

    if (isGet && path.equals("/user/load.do")) {
      load(request, response);
      return;
    }

    if (isPost && path.equals("/user/add.do")) {
      add(request, response);
      return;
    }

    if (isPost && path.equals("/user/edit.do")) {
      edit(request, response);
      return;
    }
    if (isPost && path.equals("/user/delete.do")) {
      delete(request, response);
      return;
    }

    super.doGet(request, response);
  }

  public void list(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    /*
     * Map<Long, User> users = userService.loadAll(); PrintWriter out = response.getWriter(); for
     * (Entry<Long, User> entry : users.entrySet()) { User user = entry.getValue();
     * out.println("<h1>" + "\"" + user.getId() + "\t" + user.getName() + "\t" + user.getSex() +
     * "\t|<a href=" + getContextPath() + "/action/user/edit_input.page>edit</a></h1>"); }
     * out.close();
     */
  }

  public void load(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    out.println("<h1>==user.load==</h1>");
    out.close();
  }

  public void add(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    out.println("<h1>==user.add==</h1>");
    out.close();
  }

  public void edit(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    out.println("<h1>==user.edit==</h1>");
    out.close();
  }

  public void delete(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    out.println("<h1>==user.delete==</h1>");
    out.close();
  }

}
