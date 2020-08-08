<%-- 호텔 예약을 하기위해 로그인 하는 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Reservation_error.jsp"%>
<%@page import="Login.ClientDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Design.css" type="text/css"
    media="screen" />
<title>호텔예약사이트</title>
</head>
<body>
    <div align="center">
        <h2>호텔예약 : 로그인화면</h2>
        <hr>

        <form name=form1 method=post action=Reservation_control.jsp>

            <table border="1">
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="client_id" maxlength="10"></td>
                </tr>
                <tr>
                    <th>PASSWORD</th>
                    <td><input type="password" name="client_password"></td>
                </tr>
                <tr>
                    <td colspan=2 align=center>
                        <button name="action" value="login" type="submit" onclick="a();">로그인</button>
                        <input type=reset value="초기화">
                        <button name="action" value="sign_up" type="submit">회원가입</button>

                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>