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
  <%
    String my = "<h1 class=" + '"' + "abc" + '"' + ">helloworld</h1>";
    request.setAttribute("my", my);
  %>
  <c:out value="${my}">
     yes
  </c:out>
  <c:out value="${null}">
    ${1+1}
    <h1>hello world</h1>
    <b>bold</b>
  </c:out>

  <%--
    <c:set value="<h1>command</h1>" var="username" />
  <input value="<c:out value="${pageScope.username}" />" />
  <input value='${fn:escapeXml("<h1>yes world</h1>")}' />
  <br />
  <c:url value="/index.jsp" var="myURL">
    <c:param name="trackingId" value="1234" />
    <c:param name="reportType" value="summary" />
  </c:url>
  <a href="${pageScope.myURL}">link</a>
   --%>


</body>
</html>