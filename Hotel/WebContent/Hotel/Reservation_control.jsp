<%-- 유저가 로그인, 예약가능한 호텔리스트, 정보수정, 예약된 호텔리스트 보는걸 control하는 페이지 --%>

<%@page import="org.eclipse.jdt.internal.compiler.ast.Clinit"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="Reservation_error.jsp"
	import="Login.*, java.util.*" errorPage="Reservation_error.jsp"%>

<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="clientbean" scope="page" class="Login.ClientBean" />
<jsp:useBean id="clientdao" class="Login.ClientDAO">
	<jsp:setProperty property="*" name="clientdao" />
</jsp:useBean>

<jsp:useBean id="roomdao" class="Login.RoomDAO">
	<jsp:setProperty property="*" name="roomdao" />
</jsp:useBean>

<% 
	String action = request.getParameter("action");
	String password = "";
	String input_password = "";
	String name = "";
	String client_id = "";
	
	//예약가능한 방들 보여주기
	if (action.equals("list")) {
		ArrayList<RoomDAO> available_rooms = clientbean.getAvailableRoom();
        request.setAttribute("available_rooms", available_rooms);

        System.out.println("See available list: "+ session.getAttribute("name"));

        pageContext.forward("Reservation_available.jsp");
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
				
				ArrayList<RoomDAO> available_rooms = clientbean.getAvailableRoom();
                request.setAttribute("available_rooms", available_rooms);

                System.out.println("Login: " + session.getAttribute("name"));
                
				pageContext.forward("Reservation_available.jsp");
			}
		}
	
	
	//로그아웃
	else if (action.equals("form")) {
		
		System.out.println("Logout: " + session.getAttribute("name"));
		
		//로그아웃하니깐 속성값없애기
		//session.removeAttribute("available_rooms");
		//session.removeAttribute("booked_rooms");
		session.removeAttribute("name");
		session.removeAttribute("client_id");
		session.removeAttribute("client_password");
		
		response.sendRedirect("Login_form.jsp");
		throw new Exception("처음화면으로 가기 오류");
	} 
	
	//회원가입
	else if(action.equals("sign_up")){
		pageContext.forward("Sign_up.jsp");
	}
	
	//회원만들기
	else if(action.equals("make")){
		String a = request.getParameter("client_id");
		String b = request.getParameter("client_password");
		String c = request.getParameter("client_name");
		String d = request.getParameter("mail1") + '@'+ request.getParameter("mail2");
		String e = request.getParameter("phone_number");
		String f = request.getParameter("address");
		String g = request.getParameter("country");
		
		System.out.println(a+b+c+d+e+f);
		
		if(clientbean.make_User(a, b, c, e, g, f, d)){
			out.println("<script> alert('회원가입이 완료되었습	니다')</script>");
		pageContext.forward("Login_form.jsp");
		}
		else{
			out.println("<script> alert('회원가입 오류!')</script>");
			pageContext.forward("Login_form.jsp");
		}
	}
	
	//회원정보수정
	else if(action.equals("edit_user")) {
		pageContext.forward("Edit_user.jsp");
	}
	//수정뒤
	else if(action.equals("update_user")){
        clientbean.updateUser(clientdao);
        session.setAttribute("name", clientdao.getClient_name());
        pageContext.forward("Reservation_available.jsp");
        System.out.println("Update: " + session.getAttribute("name"));
    }
	
	else if(action.equals("show")) {
	
	ArrayList<RoomDAO> booked_rooms = clientbean.getUserReservation((String)session.getAttribute("name"));
    request.setAttribute("booked_rooms", booked_rooms);

    System.out.println("See reservation: " + session.getAttribute("name"));

    pageContext.forward("User_reservation_info.jsp");
	
	}
	else {
		response.sendRedirect("Reservation_control.jsp?action=form");
	}
%>