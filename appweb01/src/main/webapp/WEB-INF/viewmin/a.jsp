<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ page session="false"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>Insert title here</title></head><body><% String my = "<h1 class=" + '"' + "abc" + '"' + ">helloworld</h1>"; request.setAttribute("my", my); %><c:out value="${my}">yes</c:out><c:out value="${null}">${1+1}<h1>hello world</h1><b>bold</b></c:out></body></html>