<%-- 
    Document   : miniprjct
    Created on : Aug 5, 2017, 2:08:18 PM
    Author     : student6
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.db_connection" id="obj"></jsp:useBean>


<head>
 <script src="../jquery/jquery.min.js">
        </script>
        <script>
            function selplace(distid)
            {
                alert(distid)
                $.ajax({url: "ajax.jsp?districtid="+distid,success:function(result)
                        {
                            $("#sel1").html(result);
                        
                    }});
            }
            cript>
            function selplace1(place_id)
            {
                alert(place_id)
                $.ajax({url: "ajax.jsp?districtid="+place_id,success:function(result)
                        {
                            $("#sel1").html(result);
                        
                    }});
            }
            </script> 
<script>
function valid()
{
	 if(document.getElementById("name").value=="")
	{
	alert("enter name");
        return false;
	}
	else if(document.getElementById("address").value=="")
	{
	alert("enter address");
        return false;
	}
        else if((frm.gender[0].checked==false)&&(frm.gender[1].checked==false))
	{
	alert("select gender");
        return false;
	}
         else if(document.frm.q.value=="1")
	{
	alert("select qualification");
        return false;
	}
	else
	{
	var p1=document.getElementById("password").value;
	var p2=document.getElementById("re-enter").value;
	if(p1===p2)
	{
	alert("success");
        return true;
	}
	else
	{
	alert("password mismatch");
        return false;
	}
	}
	}
	
</script>
</head>

    <%
    String submit=request.getParameter("sub");
    if(submit!=null)
    {
        String name=request.getParameter("name");
        String address=request.getParameter("address");
        String gender=request.getParameter("gender");
        String email=request.getParameter("email");
        String sel=request.getParameter("sel");
        String password=request.getParameter("password");
        String ins="insert into tbl_mini(reg_name,reg_address,reg_gender,reg_email,reg_quali,reg_pswd)values('"+name+"','"+address+"','"+gender+"','"+email+"','"+sel+"','"+password+"')";
        System.out.println(ins);
        boolean b=obj.insert(ins);
        out.println(b);
         }
    %>
    <%
    String submit1=request.getParameter("sub");
    if(submit!=null)
    {
        String name=request.getParameter("name");
        String address=request.getParameter("address");
        String gender=request.getParameter("gender");
        String email=request.getParameter("email");
        String sel=request.getParameter("sel");
        String password=request.getParameter("password");
        String place_name=request.getParameter("place");
        String district_name=request.getParameter("name1");
    }
  %>
<form name="frm" method="post">
<table>
<tr>
<td>Name:</td><td><input type="text" name="name" id="name"></td>
</tr>
<tr>
<td>Address:</td><td><input type="textarea" name="address" id="address"></textarea></td>
</tr>
<tr>
<td>gender:</td><td><input type="radio"  id="gender"  value="male" name="gender">male
<input type="radio" name="gender" value="female">female</td>
</tr>
<tr>
<td>e-mail:</td><td><input type="e-mail" name="email"></td>
</tr>
<tr>
<td>qualification:</td><td><select name="sel" id="q">
        <option value="1">select</option>        
<option value="2">mca</option>
<option value="3">mba</option>
<option value="4">mtech</option></select></td>
</tr>
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
<td>place Name:</td><td><select name="name" onchange="selplace1(this.value)" id="sel1">
 <option value="select">select</option>
    <%
        String sel1="select * from tbl_place";
        ResultSet rs1=obj.select(sel1);
        while(rs1.next())
        {%>
        <option value="<%=rs1.getString("place_id")%>"><%=rs1.getString("place_name")%></option>
        <%
        
        }
    %>
    
</select></td>
        </tr>
<tr>
<td>password:</td><td><input type="password"  name="password" id="password"></td>
</tr><tr>
<td>re-enter password:</td><td><input type="password" name="password" id="re-enter"></td>
</tr>
<tr>
<td><input type="submit" name="sub" onClick="return valid()" value="submit" ></td>
<td><input type="reset" name="reset" value="reset"><td>
</tr>
</table>
</form>



