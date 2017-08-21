<%-- 
    Document   : local
    Created on : Aug 12, 2017, 10:46:47 AM
    Author     : student6
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="db.db_connection" id="obj"></jsp:useBean>
<html>
    <head>
        <script src="../jquery/jquery.min.js">
        </script>
        <script>
            function selplace(distid)
            {
                alert(distid)
                $.ajax({url: "ajaxplace.jsp?districtid="+distid, success:function(result)
                        {
                            $("#sel1").html(result);
                        
                    }});
            }
            </script>
       
    </head>
    <body>
          <form name="frm">
          <%
              String local_name="",place_id="",district_id="";
              String Editid="";
              if(request.getParameter("eid")!=null)
              {
                  String sel="select * from tbl_local l,tbl_place p,tbl district d where l.place_id=p.place_id and p.dis_id=d.dis_id";
                  ResultSet rs2=obj.select(sel);
                  if(rs2.next())
                  {
                   
                  
                      local_name=rs2.getString("local_name");
                      place_id=rs2.getString("place_id");
                      district_id=rs2.getString("district_id");
                  }
              }
              if(request.getParameter("did")!=null)
              {
                  String del="delete from tbl_local where local_id='"+request.getParameter("did")+"'";
                  boolean b=obj.insert(del);
                  if(b)
                  {
                      response.sendRedirect("local_details.jsp");
              }
              
              
              %>
     <%
    String submit=request.getParameter("sub");
    if(submit!=null)
    {  
        String local_name1=request.getParameter("local_name1");
        String place_name=request.getParameter("place_name");
        String ins="insert into tbl_local(local_name,place_id)values('"+local_name1+"','"+place_name+"')";
        System.out.println(ins);
        out.println(ins);
        boolean b1=obj.insert(ins);
        out.println(b1);
         }
    %>
    <table>
<tr>
<td>District Name:</td><td><select name="name" onchange="selplace(this.value)" id="sel">
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
</select></td>
        </tr>
<tr>
<td>place Name:</td><td>
    <select name="place_name" id="sel1">
 <option value="select">select</option>
    <%
        String sel1="select * from tbl_place";
        ResultSet rr=obj.select(sel1);
        while(rr.next())
        {%>
        <option value="<%=rr.getString("place_id")%>"><%=rr.getString("place_name")%></option>
        <%
        
        }
    %> 
     
    
</select></td>
        
</tr>
<tr>
    <td>local name:<input type="text" name="local_name" id="local_name" ></td>
 </tr>
 <tr>  
<td><input type="submit" name="sub" name="sub" value="submit" ></td>
<td><input type="submit" name="cancel" name="sub" value="cancel" ></td>
</tr>
</table>
</form>
    </body>
</html>
