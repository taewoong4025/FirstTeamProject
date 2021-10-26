<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
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
    
        function changeForm(val){
            if(val == "-1"){
                location.href="../index.jsp";
            }else if(val == "0"){
                location.href="../member/UserInfoForm.jsp";
            }else if(val == "1"){
                location.href="../member/delete.jsp";
            }
        }
        
    </script>
    
</head>
<body>
    <%
        String id = session.getAttribute("sessionID").toString();
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDBBean manager = MemberDBBean.getInstance();
        MemberBean memberBean = manager.getMember(id);
                
    %>
 
        <br><br>
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=memberBean.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=memberBean.getPassword() %></td>
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
                    <%=memberBean.getMail() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=memberBean.getPhone1()+memberBean.getPhone2()+memberBean.getPhone3() %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
              	  <%=memberBean.getAddress1()+" "+ memberBean.getAddress2()%>
                </td>
            </tr>
            <tr>
            <td colspan="2" align="center">
        	<input type="button" value="회원정보 변경" onclick="changeForm(0)">
        	<input type="button" value="회원탈퇴" onclick="changeForm(1)">
         	<input type="button" value="뒤로" onclick="changeForm(-1)">
            </td>
            </tr>
        </table>
        
</body>
</html>