<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../base/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="../base/javascripts.jsp" %>

<style>
.err_msg {
	color: red;
}
</style>
<script>
  $(document).ready(function() {
    $('a#switchVcode').on('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      $('img#vcode').attr('src', constants.ROOT_PATH + '/vcode?t=' + new Date().getTime());
    });
    /*
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
     */
  });
</script>
</head>
<body>
<h1>${rootPath}</h1>
  <img id="vcode" src="${pageContext.request.contextPath}/vcode" />
  <a href="javasript:void(0)" id="switchVcode">switch another</a>
</body>
</html>
