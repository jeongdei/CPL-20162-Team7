<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, webkit">
<title>Untitled Document</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

</head>

<body style="background-color: #E69B9C">
	<nav class="navbar navbar-inverse" style="border-color: #E69B9C">
		<div class="container-fluid" style="background-color: #E69B9C">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#inverseNavbar1"
					style="border-color: #ffffff">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"
					style="color: #FFFFFF; font-size: 24px; text-align: center"
					onClick="location='MAIN.html'">홈으로...</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="inverseNavbar1"
				align="center">
				<ul class="nav navbar-nav navbar-right"
					style="border-color: #E69B9C">
					<div class="btn-group" role="group">
						<button type="button" class="alert-info" style="margin-right: 5px">속도UP</button>
						<button type="button" class="alert-warning"
							style="margin-left: 5px">설정하기</button>
					</div>
				</ul>
			</div>
			<br>
			<div align="center">
				<div align="center">
					<input type="search" />
					<button class="btn"
						style="color: #ffffff; background-color: rgba(230, 155, 156, 1.00); border-bottom-color: rgba(230, 155, 156, 1.00)">검색하기</button>
					<br>
				</div>
				<div id=favorite_button_div>
<!-- 					<button type="button" class="btn btn-ss" -->
<!-- 						style="color: #FFFFFF; background-color: rgba(230, 155, 156, 1.00); border-color: rgba(230, 155, 156, 1.00); width: 10%; text-align: center" -->
<!-- 						onClick="location='FAVORITE.jsp'">#</button> -->
					<span id=favorite_button_span style="width: 70%;"> 
					
					

					</span>
					
<!-- 					<span id=favorite_button_span2> -->
<!-- 						<form action=FAVplus.jsp> -->
<!-- 							<input type="submit" name="submit" value="+" class="btn btn-ss" style="color: #FFFFFF; background-color: rgba(230, 155, 156, 1.00); border-color: rgba(230, 155, 156, 1.00); width: 10%; text-align: center" >  -->
<!-- 						</form> -->
<!-- 					</span> -->
					
					<button type="button" class="btn btn-ss"
						style="color: #FFFFFF; background-color: rgba(230, 155, 156, 1.00); border-color: rgba(230, 155, 156, 1.00); width: 10%; text-align: center"
						onClick="location='FAVplus.jsp'">+</button>
					<button type="button" class="btn btn-ss"
						style="color: #FFFFFF; background-color: rgba(230, 155, 156, 1.00); border-color: rgba(230, 155, 156, 1.00); width: 10%; text-align: center"
						onClick="location='FAVmius.html'">-</button>

				</div>
				<hr>
				<div align="center">
					<input type="search" />
					<button class="btn"
						style="color: #ffffff; background-color: rgba(230, 155, 156, 1.00); border-bottom-color: rgba(230, 155, 156, 1.00)">주문하기</button>
				</div>
				<div id="Shopping_Cart"
					style="width: 100%; height: 320px; overflow: auto" align="center">
					<table id="cart" class="sortable" width="100%" border="0">
						<thead>
							<tr>
								<th class="check" style="text-align: center"><a
									style="color: rgba(51, 122, 183, 1.00)">체크</a></th>
								<th class="name" style="text-align: center"><a
									href="index.php?sort=name">이름</a></th>
								<th class="company" style="text-align: center"><a
									href="index.php?sort=company">회사</a></th>
								<th class="number" style="text-align: center"><a
									href="index.php?sort=number">갯수</a></th>
							</tr>
						</thead>
						<tbody id = table_body>
					

						</tbody>
					</table>
				</div>
				<br>
			</div>

		</div>

	</nav>
	<footer class="footer" id="footer" align="right"
		style="color: #FFFFFF; margin-right: 10px">
		<br>Three J Two K company
	</footer>
	<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>

<%
	int count = 0;
	int Total_size = 0;
	int Array_count[] = new int[0];
	int Array_id[] = new int[0];
	String Array_name[] = new String[0];
	int i = 0;
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	Connection conn = DBconn.getConnection();
	

	int item_count = 0;
	
	//메인에서 order 들어왔을 때

		Statement st = conn.createStatement();

		String sql = "Select bookmark_id,bookmark_name,weight from bookmark order by weight DESC";
		ResultSet rs = st.executeQuery(sql);
		Array_count = new int[3];
		Array_name = new String[3];
		Array_id = new int[3];
		while (rs.next()) {
			
			int Bookmark_id = rs.getInt("bookmark_id");
			int Bookmark_count = rs.getInt("weight");
			String Bookmark_name = rs.getString("bookmark_name");
			Array_id[i] = Bookmark_id;
			Array_name[i] = Bookmark_name;
			Array_count[i] = Bookmark_count;
			Total_size += Bookmark_count;
			i++;
			if (i == 3)
				break;
		}

		rs.close();
		st.close();
		DBconn.close();
%>

<script type="text/javascript">
		// 그리는거 
		var count = 3;
		var ary_count = new Array();
		var ary_name = new Array();
		var ary_id = new Array();
		
		<%for (int k = 0; k < 3; k++) {%>
			ary_id[<%=k%>] = '<%=Array_id[k]%>';
			ary_name[<%=k%>] = '<%=Array_name[k]%>';
<%}%>
	elm = document.getElementById("favorite_button_span");
	var form = document.createElement('form');
	form.setAttribute("method", "POST");
	form.setAttribute("action","FAVORITE.jsp");
	
	
	var button_add_fav = document.createElement('button');

	button_add_fav.setAttribute("style","border:hidden; color:#FFFFFF; background-color:rgba(255,155,156,1.0); border-color:rgba(230,155,156,1.00)");
	button_add_fav.setAttribute("class","glyphicon glyphicon-star");
	button_add_fav.setAttribute("onClick","location = 'FAVORITE.jsp'");
	
	form.appendChild(button_add_fav);
	elm.appendChild(form);
	
 	var form2 = document.createElement('form');
 	form2.setAttribute("method","POST");
 	form2.setAttribute("action","ORDER.jsp");
 	elm.appendChild(form2);
	for (var n = 0; n < count; n++) {
		
		var input_element = document.createElement('input');
		input_element.setAttribute("type", "submit");
		input_element.setAttribute("name", "bookmark_id");
		input_element.setAttribute("value", ary_id[n]);
		input_element.style.width = "10%";
		switch (n) {
		case 0:
			input_element.setAttribute("class", "btn btn-info");
			break;
		case 1:
			input_element.setAttribute("class", "btn btn-success");
			break;
		case 2:
			input_element.setAttribute("class", "btn btn-warning");
			break;
		default:
			break;
		}

		form2.appendChild(input_element);
	}
	
	elm2 = document.getElementId('favorite_button_span2');
	
	var plus_form = document.createElement('form');
	plus_form.setAttribute("method","POST");
	plus_form.setAttribute("action","FAVplus.jsp");
	
	var plus_input = document.createElement('input');
	plus_input.setAttribute("type", "submit");
	plus_input.setAttribute("name", "submit");
	plus_input.setAttribute("value", "+");
	plus_form.appendChild(plus_input);
	elm.appendChild(plus_form);
	

	var minus_form = document.createElement('form');
	minus_form.setAttribute("method","POST");
	minus_form.setAttribute("action","FAVminus.html");
	
	var minus_input = document.createElement('input');
	minus_input.setAttribute("type", "submit");
	minus_input.setAttribute("name", "submit");
	minus_input.setAttribute("value", "-");
	minus_form.appendChild(minus_input);
	elm.appendChild(minus_form);
	
</script>


<!--  여기가 즐겨찾기 눌렀을 때 cart에 추가해주는 곳  -->
<%
	conn = DBconn.getConnection();
	st = null;
	sql = null;
	rs = null;
	Array_id = new int[0];
	Array_count = new int[0];
	int Array_price[] = new int[0];
	String bookmark_id = request.getParameter("bookmark_id");
	
	if(bookmark_id != null)
	{
		st = conn.createStatement();
		
		sql = "select count(*) as count "+
		"from favorite "+
				"where bookmark_id="+bookmark_id;
		
		rs = st.executeQuery(sql);
		if(rs.next()){
			count = rs.getInt("count");
		}
		Array_id = new int[count];
		Array_count = new int[count];
		Array_name = new String[count];
		Array_price = new int[count];
		
		st = conn.createStatement();
		sql = "select item_id, count "+
				"from favorite "+
						"where bookmark_id="+bookmark_id;
		
		rs = st.executeQuery(sql);
		i = 0;
		while(rs.next())
		{
			Array_id[i] = rs.getInt("item_id");
			Array_count[i] = rs.getInt("count");
			i++;
		}
		st.close();
		
		if(count > 0){
			st = conn.createStatement();
			sql = "select name, price "+
				"from item "+
					"where ";
			for(i = 0 ; i < count; i++)
			{
				sql += "id="+Array_id[i];
				if(i == count-1)
					break;
				sql += " or ";
			}
			System.out.println(sql);
			rs = st.executeQuery(sql);
			i = 0;
			while(rs.next())
			{
				Array_name[i] = rs.getString("name");
				Array_price[i] = rs.getInt("price");
				i++;
			}
		}
		for(i = 0; i < count; i++)
		{
			st = conn.createStatement();
			
			sql = "insert into cart values("+Array_id[i]+","+Array_count[i]+")";
			st.executeUpdate(sql);
			
		}
		
		
		st.close();
		
	%>
		
	<script>
	var ary_name = new Array();
	var ary_count = new Array();
	var ary_price = new Array();
	var count = "<%=count%>";
	
	<%for (int k = 0; k < count; k++) {%>
	
	ary_count[<%=k%>] = '<%=Array_count[k]%>';
	ary_name[<%=k%>] = '<%=Array_name[k]%>';
	ary_price[<%=k%>] = '<%=Array_price[k]%>';
<%}%>
var tbody = document.getElementById("table_body");
for (var n = 0; n < count; n++) {

	
	var tr = document.createElement('tr');
	
	var td_check = document.createElement('td');
	td_check.setAttribute("scope","row");
	td_check.setAttribute("style","text-align:center;");
	
	var check_input = document.createElement('input');
	check_input.setAttribute("type","checkbox");
	td_check.appendChild(check_input);
	tr.appendChild(td_check);
	
	var td_name = document.createElement('td');
	td_name.setAttribute("style", "text-align:center;");
	var cellText1 = document.createTextNode(ary_name[n]);
	td_name.appendChild(cellText1);
	tr.appendChild(td_name);

	var td_count = document.createElement('td');
	td_count.setAttribute("style", "text-align:center;");
	var cellText2 = document.createTextNode(ary_price[n]);
	td_count.appendChild(cellText2);
	tr.appendChild(td_count);

	var td_bookmark_name = document.createElement('td');
	td_bookmark_name.setAttribute("style", "text-align:center;");
	var cellText3 = document.createTextNode(ary_count[n]);
	td_bookmark_name.appendChild(cellText3);
	tr.appendChild(td_bookmark_name);

	tbody.appendChild(tr);

}
	</script>
		
	
	
	<% 
	}
%>




