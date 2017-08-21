<%-- 
    Document   : ajax
    Created on : Aug 12, 2017, 12:36:35 PM
    Author     : student6
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.db_connection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String districtid=request.getParameter("districtid");
      %>
       
 <select name="place_name" id="sel1">
 <option value="select">select</option>
    <%
        String sel1="select * from tbl_place where district_id='"+districtid+"'";
        ResultSet rr=obj.select(sel1);
        while(rr.next())
        {%>
        <option value="<%=rr.getString("place_id")%>"><%=rr.getString("place_name")%></option>
        <%
        
        }
    %> 
     
    
</select>
   
    </body>
</html>
