<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<%
	int bookmark_id = 0;
	int item_id = 0;
	String item_name = request.getParameter("name");
	int flag = 0;
	String item_count = request.getParameter("count");

	String bookmark_name = request.getParameter("bookmark_name");

	Connection conn = DBconn.getConnection();
	Statement st = null;
	String sql = null;
	ResultSet rs = null;

	st = conn.createStatement();
	sql = "select bookmark_id from bookmark where bookmark_name='" + bookmark_name + "'";
	rs = st.executeQuery(sql);
	if (rs.next()) {
		bookmark_id = rs.getInt("bookmark_id");
		flag = 1;
	}
	if(flag == 0)
	{
		String sql1 = null;	
		sql1 = "insert into bookmark values(0,'"+bookmark_name+"',0)";
		st.executeUpdate(sql1);
		
		sql1 = "select bookmark_id from bookmark where bookmark_name='" + bookmark_name+"'";
		rs = st.executeQuery(sql1);
		if(rs.next())
		{
			bookmark_id = rs.getInt("bookmark_id");
		}
	}
	st = conn.createStatement();
	sql = "select id from item where name='" + "책장" + "'";
	rs = st.executeQuery(sql);
	if (rs.next()) {
		item_id = rs.getInt("id");
	}

	st = conn.createStatement();
	sql = "insert into favorite values(" + bookmark_id + "," + item_id + ","+ item_count+")";
	System.out.println(sql);
	st.executeUpdate(sql);
	st.close();
%>

<script>
	function init() {
		alert('asd');
	}
</script>
