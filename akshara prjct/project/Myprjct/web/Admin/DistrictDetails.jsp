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
<script>   
function valid()
     {
          if(document.getElementById("txt_name").value=="")
	{
	alert("enter name");
        return false;
	}
     }
 </script>
    </head>
    
        <body> 
          <%
              String distname="",distid="";
            if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_district where id='"+request.getParameter("eid")+"'";
                ResultSet rs=obj.select(sel);
                if(rs.next())
                {
                    
                   distname=rs.getString("district_name");
                  
            }
            }
    
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_district where id='"+request.getParameter("did")+"'";
                boolean b=obj.insert(del);
                out.print(b);
                if(b)
                {
                    response.sendRedirect("DistrictDetails.jsp");
                }
            }         
     String submit=request.getParameter("sub");
    if(submit!=null)
    {
       
        String txt_name=request.getParameter("txt_name");
        String ins="insert into tbl_district(district_name)values('"+txt_name+"')";
        System.out.println(ins);
        boolean b=obj.insert(ins);
        out.println(b);
    }
             %>
    
    
    <form>
<table>
<tr>
<td>district Name:</td><td><input type="text" value="<%=distname%>" name="txt_name" id="name">             
</tr>
<tr>
<td><input type="submit" name="sub" onClick="return valid()" value="submit" ></td>
</tr>
</table>
   <table>

    <%
        String sel="select * from tbl_district";
        ResultSet rs=obj.select(sel);
        while(rs.next())
        { %>
       
            <tr><td><%=rs.getString("district_name")%></td><td><a href="DistrictDetails.jsp?eid=<%=rs.getString("id")%>">Edit</a>
                    <a href="DistrictDetails.jsp?did=<%=rs.getString("id")%>">delete</a></td></tr>
<%   
        }
    %>  
    </select></td></tr>
        
        </table>
</body>
 </form>
</html>

  

