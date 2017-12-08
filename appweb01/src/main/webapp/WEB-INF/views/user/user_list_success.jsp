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
  <h1>all user list</h1>
  <%--
  //Loop through a Map with JSTL
    <c:forEach var="entry" items="${myMap}">
    Key: <c:out value="${entry.key}" />
    Value: <c:out value="${entry.value}" />
  </c:forEach>
   --%>


  <table>
    <c:forEach var="entry" items="${users}" varStatus="loop">
      <c:set var="user" value="${entry.value}" />
      <tr style='${loop.index%2==0 ? "color:red" : "color:green"}'>
        <td><c:out value="${user.id}" /></td>
        <td><c:out value="${user.name}" /></td>
        <td><c:out value="${user.salary}" /></td>
        <td><c:out value="${user.description}" /></td>
        <td><c:out value="${loop.index}" /></td>
        <td><c:out value="${loop.count}" /></td>
        <td><c:out value="${loop.first}" /></td>
        <td><c:out value="${loop.last}" /></td>
        <td><a
          href="<c:url value='/action/user/user_delete_do'><c:param name="id" value="${user.id}" /></c:url>">delete</a></td>
      <td><a
        href="<c:url value='/action/user/user_edit_do'><c:param name="id" value="${user.id}" /></c:url>">edit</a></td>
      </tr>
    </c:forEach>
  </table>

</body>
</html>