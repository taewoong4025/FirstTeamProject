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
<title>ȸ������ ����ȭ��</title>

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
    
 
        // ��й�ȣ �Է¿��� üũ
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
        }
        
    </script>

</head>
<body>

 <br><br>
        <b><font size="6" color="gray">ȸ������ ����</font></b>
        <br><br><br>
        
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ��� -->
        <form method="post" action="../member/modify_Ok.jsp" onsubmit="return checkValue()">
       
            
              
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td id="title"><%=memberBean.getId() %></td>
                </tr>
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=memberBean.getPassword()%>">
                    </td>
                </tr>
                <tr>
                    <td id="title">�̸�</td>
                    <td><%=memberBean.getName() %></td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td><%=memberBean.getGender()%></td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td>
                        <%=memberBean.getYy() %>�� 
                        <%=memberBean.getMm() %>�� 
                        <%=memberBean.getDd() %>��
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�̸���</td>
                    <td>
                        <input type="text" name="mail" maxlength="50" 
                            value="<%=memberBean.getMail() %>">
                       
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�޴���ȭ</td>
                    <td>
                        <input type="text" name="phone" value="<%=memberBean.getPhone1()+"-"+memberBean.getPhone2()+"-"+memberBean.getPhone3() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">�ּ�</td>
                    <td>
                        <input type="text" size="50" name="address1" id="address_kakao"
                            value="<%=memberBean.getAddress1() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">�� �ּ�</td>
                    <td>
                        <input type="text" size="50" name="address2"
                            value="<%=memberBean.getAddress2() %>"/>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="center">
            		<input type="submit" value="����"/>  
            		<input type="button" value="���" onclick="javascript:window.location='../index.jsp'">
                </td>
                </tr>
            </table>
        </form>

      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //�ּ��Է�ĭ�� Ŭ���ϸ�
        //īī�� ���� �߻�
        new daum.Postcode({
            oncomplete: function(data) { //���ý� �Է°� ����
                document.getElementById("address_kakao").value = data.address; // �ּ� �ֱ�
            }
        }).open();
    });
}
</script>

</body>
</html>