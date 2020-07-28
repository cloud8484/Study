<%-- 유저가 로그인, 예약가능한 호텔리스트, 정보수정, 예약된 호텔리스트 보는걸 control하는 페이지 --%>

<%@page import="org.eclipse.jdt.internal.compiler.ast.Clinit"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="Reservation_error.jsp"
	import="Login.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="clientbean" scope="page" class="Login.ClientBean" />
<jsp:useBean id="clientdao" class="Login.ClientDAO">
	<jsp:setProperty property="*" name="clientdao" />
</jsp:useBean>
<%-- 
<jsp:useBean id="roomdao" class="Login.RoomDAO">
	<jsp:setProperty property="*" name="roomdao" />
</jsp:useBean>
--%>
<% 
	String action = request.getParameter("action");
	String password = "";
	String input_password = "";
	String name = "";
	String client_id = "";
	
	//예약가능한 방들 보여주기
	if (action.equals("list")) {

	}
	
	//로그인하기
		else if(action.equals("login")){
			password = clientbean.getUserPassword(clientdao.getClient_id());
			input_password = request.getParameter("client_password");
			if (!password.equals(input_password))
				out.println("<script> alert('아이디 또는 비밀번호 틀림!'); history.go(-1); </script>");
			else {
				client_id = request.getParameter("client_id");
				name = clientbean.getUserName(request.getParameter("client_id"));
				
				//client_name, client_number, client_password는 가지고 있기(이름)
				session.setAttribute("name", name);
				session.setAttribute("client_id", client_id);
				session.setAttribute("client_password", password);
				
				pageContext.forward("Reservation_available.jsp");
			}
		}
	
	
	//로그아웃
	else if (action.equals("form")) {
		
		System.out.println("Logout: " + session.getAttribute("name"));
		
		//로그아웃하니깐 속성값없애기
	
		session.removeAttribute("name");
		session.removeAttribute("client_id");
		session.removeAttribute("client_password");
		
		response.sendRedirect("Login_form.jsp");
		throw new Exception("처음화면으로 가기 오류");
	} 
	else {
		response.sendRedirect("Reservation_control.jsp?action=form");
	}
%>
