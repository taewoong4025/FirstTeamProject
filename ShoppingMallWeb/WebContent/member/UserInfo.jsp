<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<html>
<head>
    <title>���� �������� ���ȭ��</title>
    
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
        
        // ���ǿ� ����� ���̵� �����ͼ�
        // �� ���̵� �ش��ϴ� ȸ�������� �����´�.
        MemberDBBean manager = MemberDBBean.getInstance();
        MemberBean memberBean = manager.getMember(id);
                
    %>
 
        <br><br>
        <b><font size="6" color="gray">�� ����</font></b>
        <br><br><br>
                        <!-- ������ ȸ�������� ����Ѵ�. -->
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%=memberBean.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td><%=memberBean.getPassword() %></td>
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
                    <%=memberBean.getMail() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">�޴���ȭ</td>
                <td><%=memberBean.getPhone1()+memberBean.getPhone2()+memberBean.getPhone3() %></td>
            </tr>
            <tr>
                <td id="title">�ּ�</td>
                <td>
              	  <%=memberBean.getAddress1()+" "+ memberBean.getAddress2()%>
                </td>
            </tr>
            <tr>
            <td colspan="2" align="center">
        	<input type="button" value="ȸ������ ����" onclick="changeForm(0)">
        	<input type="button" value="ȸ��Ż��" onclick="changeForm(1)">
         	<input type="button" value="�ڷ�" onclick="changeForm(-1)">
            </td>
            </tr>
        </table>
        
</body>
</html>