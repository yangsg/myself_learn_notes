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
</head>
<body>
  <h1>index page</h1>
  <h1>ddd</h1>
  <h3>
    <a href="<c:url value='/index'></c:url>">/index</a>
  </h3>
  <h3>
    <a href='<c:url value='/index.page'></c:url>'>/index.page</a>
  </h3>
  <h3>
    <a href='<c:url value='/index'></c:url>'>index page</a>
  </h3>
  <h1>login</h1>
  <h3>
    <a href='<c:url value='/action/login/login_entry'></c:url>'>/action/login/login_entry</a>
  </h3>
  <h3>
    <a href='<c:url value='/action/user/user_new_page'></c:url>'>/action/user/user_new_page</a>
  </h3>
  <h3>
    <a href='<c:url value='/action/user/user_list_do'></c:url>'>/action/user/user_list_do</a>
  </h3>


</body>
</html>