<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%
  /*http://stackoverflow.com/questions/49547/making-sure-a-web-page-is-not-cached-across-all-browsers*/
  /*Making sure a web page is not cached, across all browsers*/
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
  response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>user edit page</h1>
  <div style="color: red">
    <c:out value="${requestScope.err_msg}" />
  </div>
  <form action="<c:url value='/action/user/user_new_do' />"
    method="post" autocomplete="off">
    <div>
      <label>username:</label><span></span><input type="text"
        name="username" value="" autocomplete="off" /><span>
    </div>
    <div>
      <label>salary: </label> <span><input type="text"
        name="salary" value="" autocomplete="off" /></span>
    </div>
    <div>
      <label>sex: </label><span><input type="text" name="sex"
        value="" autocomplete="off" /></span>
    </div>
    <div>
      <label>description: </label><span><input type="text"
        name="description" value="" autocomplete="off" /></span>
    </div>
    <div>
      <button type="submit">submit</button>
    </div>
  </form>
</body>
</html>