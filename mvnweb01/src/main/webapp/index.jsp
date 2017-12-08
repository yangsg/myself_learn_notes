<%@ page session="false"%>
<%
  /* 	RequestDispatcher dispatcher = getServletContext()
   .getRequestDispatcher("/index.page");
   dispatcher.forward(request, response); */
  response.sendRedirect("index");
%>
