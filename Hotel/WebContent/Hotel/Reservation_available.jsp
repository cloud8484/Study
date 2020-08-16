<%-- 예약가능한 호텔 리스트를 보게하는 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Reservation_error.jsp" import="java.util.*, Login.*"%>
    
<!DOCTYPE html>

<html>
<head>>
    <link rel="stylesheet" href="Design.css" type="text/css" media="screen"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script language=JavaScript>
        function check_in(room_number) {
            pwd = prompt('예약하려면 계정 비밀번호를 넣으세요.');
            if(pwd != null){
                document.location.href = "Reservation_control.jsp?action=do_reservation&room_number=" + room_number + "&password=" + pwd;
            }
        }
    </script>
    <title>예약가능 목록</title>
</head>
<body>
    <jsp:useBean id="available_rooms" scope="request" class="java.util.ArrayList"/>
    <div align="center">
        <%
            String name = (String)session.getAttribute("name");
        %>
        <h2>환영합니다 <%=name %>님</h2>
        <h2>예약가능 목록</h2>
        <hr>

        <form action="Reservation_control.jsp" name=toList method="post">
            <button name="action" value="form" type="submit">로그아웃</button>
            <button name="action" value="show" type="submit">예약한 목록</button>
            <button name="action" type="submit" value="edit_user">회원정보수정</button>
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
                    <th>요금</th>
                </tr>
                <%
                    for(RoomDAO room : (ArrayList<RoomDAO>)available_rooms){
                %>
                <tr>
                    <td><a href="javascript:check_in(<%=room.getRoom_number()%>)"><%=room.getRoom_number() %></a></td>
                    <td><%=room.getRoom_class() %></td>
                    <td><%=room.getRoom_view() %></td>
                    <td><%=room.getMax_number() %></td>
                    <td><%=room.getBed_number() %></td>
                    <td><%=room.isIs_smoke() %></td>
                    <td><%=room.getRoom_fee() %></td>
                </tr>
                <% 
                    }
                %>
            </table>
        </form>


    </div>
</body>
</html>

