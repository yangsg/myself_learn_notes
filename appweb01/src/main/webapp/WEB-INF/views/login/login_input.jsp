<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.err_msg {
	color: red;
}
</style>
<script src="<c:url value='/public/ext/jquery-1.11.3.js' />"></script>
<script>
/*   $(document).ready(function() {

    $("#login_form").on("submit", function(e) {
      alert("hello owrld");
      e.preventDefault();
      $.ajax({
        type: "POST",
        cache: false,
        url: "<c:url value='/action/login/login.do' />",
        data: $("#login_form").serialize(),
      }).done(function(data, textStatus, jqXHR) {
        alert("suc: " + textStatus);
      }).always(function(data, textStatus, jqXHR) {
        alert("complet: " + textStatus);
      });
    });
  }); */
</script>
</head>
<body>
  <h1>login page</h1>
  <form id="login_form"
    action="<c:url value="/action/login/login.do" />" method="post">
    <input type="hidden" name="token"
      value="<c:out value='${requestScope.loginToken}' />" />
    <p>
      username: <input name="username" value="" /><span class="err_msg"><c:out
          value="${requestScope.errMsges.username_err_msg}" /></span>
    </p>
    <p>
      password: <input name="password" value="" /><span class="err_msg"><c:out
          value="${requestScope.errMsges.password_err_msg}" /></span>
    </p>
    <button type="submit">login</button>
  </form>
</body>
</html>