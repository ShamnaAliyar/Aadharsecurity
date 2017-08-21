<%-- 
    Document   : DistrictDetails
    Created on : Aug 7, 2017, 12:49:38 PM
    Author     : student6
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="db.db_connection" id="obj"></jsp:useBean>
<html>
<head>
    </head>
    <body>
        <form name="frm">
            
            <%
         if(request.getParameter("did")!=null)
         {
             String del="delete from tbl_place where place_id='"+request.getParameter("did")+"'";
             boolean b=obj.insert(del);
             out.print(b);
         
         if(b)
         {
             response.sendRedirect("PlaceDetails.jsp");
         }
         
         }
             
     
   
    String submit=request.getParameter("sub");
    if(submit!=null)
    {
        String place=request.getParameter("place_name");
        String name=request.getParameter("name");
        String ins="insert into tbl_place(place_name,district_id)values('"+place+"','"+name+"')";
        System.out.println(ins);
        out.println(ins);
        boolean b=obj.insert(ins);
        out.println(b);
         }
    %>
     
        
    
<table>
<tr>
<td>District Name:</td><td><select name="name" id="sel">
 <option value="select">select</option>
    <%
        String sel="select * from tbl_district";
        ResultSet rs=obj.select(sel);
        while(rs.next())
        {%>
        <option value="<%=rs.getString("id")%>"><%=rs.getString("district_name")%></option>
        <%
        
        }
    %>  
    
    
</select>
 </td></tr>
 <tr>
     <td>place Name:</td><td><input type="text" name="place_name" id="place"></td></tr>
<tr>
    <td><input type="submit" name="sub" value="submit"></td>
    
      <td><input type="button" name="cancel" value="cancel"></td>  
</tr>
</table>
    <table>
        <tr><td><h2>district</h2></td><td><h2>place name</h2></td></tr>
    <%
        String ss="select * from tbl_place p,tbl_district d where d.id=p.district_id";
        ResultSet rs1=obj.select(ss);
        while(rs1.next())
        { %>
       <tr><td>
               <%=rs1.getString("district_name")%></td><td><%=rs1.getString("place_name")%>  </td><td><a href="#">edit</a>
               <a href="PlaceDetails.jsp?did=<%=rs1.getString("place_id")%>">delete</a> </td></tr>
                  <% }
        %>
        
</table>
</form>
</body>
</html>

  

