<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
  /*http://stackoverflow.com/questions/49547/making-sure-a-web-page-is-not-cached-across-all-browsers*/
  /*Making sure a web page is not cached, across all browsers*/
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
  response.setDateHeader("Expires", 0); // Proxies.
%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="page" />

