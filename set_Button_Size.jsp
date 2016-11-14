<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id=test_div onclick="knowPosition('test_div');"
		style="overflow: scroll; background-color: powderblue; width: 600px; height: 600px; top: 120px; border: 1px solid red;"
		id=test>
		<%
			int count = 0;
			int Total_size = 0;
			int Array_count[];
			int Array_id[];
			String Array_name[];
			int i = 0;

			String code = request.getParameter("code");
			Connection conn = DBconn.getConnection();

			Statement st = conn.createStatement();
			String sql = "Select count(*) as count from bookmark";
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) { //검색된 결과가 존재하면 true
				count = rs.getInt("count");

			} else {
				out.println("입력하신 " + code + "는 존재하지 않습니다.");
			}
			rs.close();
			st.close();
			st = conn.createStatement();
			sql = "Select id,count,name from bookmark order by count DESC";
			rs = st.executeQuery(sql);
			Array_count = new int[count];
			Array_name = new String[count];
			Array_id = new int[count];
			while (rs.next()) {
				int Bookmark_id = rs.getInt("id");
				int Bookmark_count = rs.getInt("count");
				String Bookmark_name = rs.getString("name");
				Array_id[i] = Bookmark_id;
				Array_name[i] = Bookmark_name;
				Array_count[i] = Bookmark_count;
				Total_size += Bookmark_count;
				i++;
			}

			rs.close();
			st.close();
			DBconn.close();
		%>
		<script type="text/javascript">
		var result = '';
		var count = "<%=count%>";
		var ary_count = new Array();
		var Total_size = "<%=Total_size%>";
		var ary_name = new Array();
		var ary_id = new Array();
		
		<%for (int k = 0; k < count; k++) {%>
			
			ary_count[<%=k%>] = '<%=Array_count[k]%>';
			ary_name[<%=k%>] = '<%=Array_name[k]%>';
			ary_id[<%=k%>] = '<%=Array_id[k]%>';
		<%}%>
		
		elm = document.getElementById("test_div");
		var form = document.createElement('form');
		form.setAttribute("method","POST");
		form.setAttribute("action","print_Items.jsp");
		elm.appendChild(form);
			for (var n = 0; n < count; n++) {
				var size = ary_count[n];
				
				var input_element = document.createElement('input');
				input_element.setAttribute("type","submit");
				input_element.setAttribute("name","submit");
				input_element.setAttribute("value",ary_id[n]);
				
				input_element.style.height = 100 + 'px';
			
				if(size*7 < 80)
					input_element.style.width = 80+'px';
				else
					input_element.style.width = size*7+'px';
				
				form.appendChild(input_element);
			}
		</script>

	</div>
</body>

</html>
