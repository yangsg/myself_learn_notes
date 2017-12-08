package action;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ServletUtil;
import util.TokenProccessor;
import util.Validator;



@WebServlet("/action/login/*")
public class LoginAction extends AppServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = getRoutePath(request);
    boolean isGet = request.getMethod() == "GET";
    boolean isPost = request.getMethod() == "POST";

    if (isGet && path.equals("/login/login_input.page")) {
      String loginToken = TokenProccessor.getInstance().makeToken();
      HttpSession session = request.getSession();
      Map<String, Boolean> loginTokens = (Map<String, Boolean>) session.getAttribute("loginTokens");
      if (loginTokens == null) {
        loginTokens = Collections.synchronizedMap(new HashMap<String, Boolean>());
        session.setAttribute("loginTokens", loginTokens);
      }
      loginTokens.put(loginToken, true);
      request.setAttribute("loginToken", loginToken);
      ServletUtil.forwardJsp("/login/login_input.jsp", this, request, response);
      return;
    }

    if (isPost && path.equals("/login/login.do")) {
      login(request, response);
      return;
    }

    super.doGet(request, response);
  }

  public void login(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String token = request.getParameter("token");
    HttpSession session = request.getSession(false);

    if (session == null) {
      ServletUtil.redirect("/action/login/login_input.page", request, response);
      return;
    }
    Map<String, Boolean> loginTokens = (Map<String, Boolean>) session.getAttribute("loginTokens");
    if (token == null || loginTokens == null || !loginTokens.containsKey(token)) {
      ServletUtil.redirect("/action/login/login_input.page", request, response);
      return;
    } else {
      loginTokens.remove(token);
    }

    String name = request.getParameter("username");
    String password = request.getParameter("password");

    Validator vd = new Validator();
    {
      boolean isOk = true;
      // TODO
      isOk =
          vd.checking(name, "username_err_msg") && vd.isNotNull() && vd.isNotEmpty()
              && vd.isNotWhiteSpace() && isOk;
      isOk =
          vd.checking(password, "password_err_msg") && vd.isNotNull() && vd.isNotEmpty()
              && vd.isNotWhiteSpace() && isOk;
      if (!isOk || vd.getErrMsges().size() != 0) {
        request.setAttribute("errMsges", vd.getErrMsges());
        ServletUtil.redirect("/action/login/login_input.page", request, response);
        return;
      }

      //OLDuSER
      // validate and put session
      ServletUtil.redirect("/action/product/main.page", request, response);
    }
  }

}
