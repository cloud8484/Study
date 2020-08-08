<%-- 로그인한 회원이 정보를 수정하는 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="Reservation_error.jsp"
    pageEncoding="UTF-8" import="Login.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Design.css" type="text/css" media="screen"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script language=JavaScript>
		function updatecheck(){
			result = confirm("정말로 수정하시겠습니까?");
			
			if(result == true){
				document.form1.action.value="update_user";
				document.form1.submit();
			}
			else{
				return;
				//document.form1.action.value="edit_user";
               // document.form1.submit();
			}
		}
	</script>
<title>회원정보 수정 페이지</title>
</head>
<body>
	<jsp:useBean id="clientbean" scope="request" class="Login.ClientBean" />
	<jsp:useBean id="user_edit" scope="request" class="Login.ClientDAO"/>
	<div align="center">
		<%
			String name = (String)session.getAttribute("name");
			String client_id = (String)session.getAttribute("client_id");
			user_edit = clientbean.getOneUser(client_id);//ClientDAO 객체 반환
			
		%>
		<h2><%=name %>님의 정보</h2>
		<hr>

		<form action="Reservation_control.jsp" name=toList method="post">
			<input type=hidden name="action" value="list">
				<input type="submit" value="예약가능목록">
		</form>
		
		<form name=form1 method=post action=Reservation_control.jsp>
		<input type=hidden name="action" value="edit_user">
		<input type="hidden" name="client_id" value="<%=user_edit.getClient_id() %>">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="client_name" value="<%=user_edit.getClient_name() %>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone_number" value="<%=user_edit.getPhone_number() %>"></td>
				</tr>
				<tr>
					<th>국적</th>
					<td><input type="text" name="country" value="<%=user_edit.getCountry() %>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=user_edit.getAddress() %>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="<%=user_edit.getEmail() %>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type="submit" value="저장" onClick="updatecheck()">
						<input type="reset" value="초기화">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>