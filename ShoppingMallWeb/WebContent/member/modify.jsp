<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<%
		String id = session.getAttribute("sessionID").toString();
	
		MemberDBBean manager = MemberDBBean.getInstance();
		MemberBean memberBean = manager.getMember(id);
	%>
<title>회원정보 수정화면</title>

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
    
    <script type="text/javascript">
    
 
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
    </script>

</head>
<body>

 <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="../member/modify_Ok.jsp" onsubmit="return checkValue()">
       
            
              
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td id="title"><%=memberBean.getId() %></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=memberBean.getPassword()%>">
                    </td>
                </tr>
                <tr>
                    <td id="title">이름</td>
                    <td><%=memberBean.getName() %></td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td><%=memberBean.getGender()%></td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <%=memberBean.getYy() %>년 
                        <%=memberBean.getMm() %>월 
                        <%=memberBean.getDd() %>일
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail" maxlength="50" 
                            value="<%=memberBean.getMail() %>">
                       
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" value="<%=memberBean.getPhone1()+"-"+memberBean.getPhone2()+"-"+memberBean.getPhone3() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address1" id="address_kakao"
                            value="<%=memberBean.getAddress1() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">상세 주소</td>
                    <td>
                        <input type="text" size="50" name="address2"
                            value="<%=memberBean.getAddress2() %>"/>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="center">
            		<input type="submit" value="수정"/>  
            		<input type="button" value="취소" onclick="javascript:window.location='../index.jsp'">
                </td>
                </tr>
            </table>
        </form>

      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>

</body>
</html>