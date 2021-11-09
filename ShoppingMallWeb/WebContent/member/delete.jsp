<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>

    <title>탈퇴 화면</title>
    
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
    
<!--     <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script> -->
    
</head>
<body>
 
    <br><br>
    <b><font size="6" color="gray">탈퇴하시려면 비밀번호를 입력해 주세요.</font></b>
    <br><br><br>
 
    <form name="delete" method="post" action="./delete_Ok.jsp">
 
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
       			 <input type="submit" value="탈퇴" /> 
       	        <input type="button" value="취소" onclick="javascript:window.location='../index.jsp'">
            	</td>
            </tr>
        </table>
        
    </form>
    
    	<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

