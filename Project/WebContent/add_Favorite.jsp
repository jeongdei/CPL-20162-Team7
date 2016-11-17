<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	String bookmark_id = request.getParameter("id");
	out.println(bookmark_id);
	String bookmark_name = request.getParameter("name");
	out.println(bookmark_name);
	
	Connection conn = DBconn.getConnection();
	
	Statement st = conn.createStatement();
	String sql = "insert into bookmark values("+bookmark_id+",'"+bookmark_name+"',0)";
	st.executeUpdate(sql);
	st.close();
%>

<script>
function init()
{
	alert('asd');
}
</script>
