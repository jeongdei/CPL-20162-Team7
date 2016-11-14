<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String Item_names[];
	int count = 0;
	int i = 0;
	String bookmark_id = request.getParameter("submit");
	Connection conn = DBconn.getConnection();

	Statement st = conn.createStatement();
	String sql = "Select count(*) as count from favorite f,item i where f.bookmark_id="+ bookmark_id + " and f.item_id = i.id";
	ResultSet rs = st.executeQuery(sql);
	
	if(rs.next()){
		count = rs.getInt("count");
		
	}
	else{
		out.println("아무 아이템이 없습니다.");
	}
	rs.close();
	st.close();
	st = conn.createStatement();
	sql = "Select i.name from favorite f,item i where f.bookmark_id="+bookmark_id + " and f.item_id = i.id";
	rs = st.executeQuery(sql);
	Item_names = new String[count];
	while(rs.next()){
		String item_name = rs.getString("name");
		out.println(item_name);
		Item_names[i] = item_name;
		i++;
	}
	rs.close();
	st.close();
	DBconn.close();
%>

<script>
function init()
{
	alert('asd');
}
</script>
