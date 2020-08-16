<%-- client가 자신의 예약 호텔리스트를 볼 수 있는 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Reservation_error.jsp" import="java.util.*, Login.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<link rel="stylesheet" href="Design.css" type="text/css" media="screen"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script language=JavaScript>
	
	//아래 함수 고쳐야됨
		function check(ad_id) {
			pwd = prompt('예약취소를 원하신다면 계정 비밀번호를 넣으세요.');
			if(pwd != null){
				document.location.href = "Reservation_control.jsp?action=cancel_reservation&ad_id=" + ad_id + "&upasswd=" + pwd;
			}
		}
	</script>
	<title>예약한 목록</title>
</head>
<body>
	<jsp:useBean id="booked_rooms" scope="request" class="java.util.ArrayList"/>
	<div align="center">
		<h2>예약한 목록</h2>
		<hr>
		<form action="Reservation_control.jsp" name=toList method="post">
			<button type="submit" name="action" value="list" >예약가능 목록</button>
			<button type="submit" name="action" value="form" >로그아웃</button>
		</form>
		
		<form>
			
			<table border="1">
				<tr>
					<th>방번호</th>
					<th>방등급</th>
					<th>방뷰</th>
					<th>최대인원</th>
					<th>침대개수</th>
					<th>흡연가능여부</th>
					<th>체크인날짜</th>
					<th>체크아웃날짜</th>
					<th>요금</th>
				</tr>
				<%
					if(booked_rooms.isEmpty()){
				%>
					<h2>예약한 방이 없습니다.</h2>
				<%
					}else{
				%>
				
				<%

					for(RoomDAO room : (ArrayList<RoomDAO>)booked_rooms){	
				%>
				<tr>
					<td><a href="javascript:check(<%=room.getRoom_number()%>)"><%=room.getRoom_number() %></a></td>
					<td><%=room.getRoom_class() %></td>
					<td><%=room.getRoom_view() %></td>
					<td><%=room.getMax_number() %></td>
					<td><%=room.getBed_number() %></td>
					<td><%=room.isIs_smoke() %></td>
					<td><%=room.getCheckin_date() %></td>
					<td><%=room.getCheckout_date() %></td>
					<td><%=room.getTotal_fee() %></td>
				</tr>
				<% 
					}
					}
				%>
			</table>
		</form>
	</div>
</body>
</html>