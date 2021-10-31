<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>회원 정보</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript" charset="UTF-8">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(userInfo.password.value==""){
                alert("비밀번호를 입력해 주세요.");
               userInfo.password.focus();
               return;
            }
        }
    </script>
    
</head>
<body>
 
    <br><br>
    <b><font size="6" color="gray">회원 정보 변경을 위한 비밀번호를 입력해 주세요.</font></b>
    <br><br><br>
 
    <form name="userInfo" method="post" action="../member/modify.jsp">
 
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
       			 <input type="submit" value="확인" onclick="checkValue();" /> 
       	        <input type="button" value="취소" onclick="javascript:window.location='../index.jsp'">
            	</td>
            </tr>
        </table>
    </form>
    
</body>
</html>

