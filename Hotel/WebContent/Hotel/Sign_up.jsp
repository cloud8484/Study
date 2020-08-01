<%-- 회원가입 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Reservation_error.jsp" import="java.util.*, Login.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="Design.css" type="text/css" media="screen"/>
	<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.sign.client_id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.sign.client_password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.sign.client_password.value != document.sign.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
        }
    </script>
	<title>회원가입 창</title>
<body>
    <div align="center">
        <h2>회원가입</h2>    
        <hr>
        <form name=sign method=post action=Reservation_control.jsp onsubmit="return checkValue()">
            <table>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" name="client_id" maxlength="10">
                        <input type="button" value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="client_password" maxlength="64">
                    </td>
                </tr>
                
                <tr>
                    <th>비밀번호 확인</th>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="64">
                    </td>
                </tr>
                    
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" name="client_name" maxlength="20">
                    </td>
                </tr>
                    
                <tr>
                    <th>이메일</th>
        
                    <td>
                        <input type="text" name="mail1" maxlength="40">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
				<tr>
                    <th>이메일</th>
                    <td>
                        <select name="country">
                            <option>KOR</option>
                            <option>JAPAN</option>
                            <option>USA</option>
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <th>휴대전화</th>
                    <td>
                        <input type="text" name="phone_number" maxlength="20"/>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" size="50" name="address" maxlength="50"/>
                    </td>
                </tr>
            </table>
            <br>
            <button name="action" value="make" type="submit">가입</button>
            <button name="action" value="form" type="submit">취소</button>
        </form>
    </div>
</body>
</html>