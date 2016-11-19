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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body style="background-color: #E69B9C; width: 100%; height: 100%">
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
			<div>
				<div align = "center">
					<input type="search" />
					<button class="btn"
						style="color: #ffffff; background-color: rgba(230, 155, 156, 1.00); border-bottom-color: rgba(230, 155, 156, 1.00)">검색하기</button>
					<br>
				</div>
				<hr>
				<div
					style="width: 90%; height: 80%; background-color: rgba(230, 155, 156, 1.00)">

					<span id="block_button" 
						style="width: 80%; height: 70%; margin-left: 10px; margin-right: 10px">

				 
					</span>
				</div>
				<br>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->

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
	sql = "Select bookmark_id,weight,bookmark_name from bookmark order by weight DESC";
	rs = st.executeQuery(sql);
	Array_count = new int[count];
	Array_name = new String[count];
	Array_id = new int[count];
	while (rs.next()) {
		
		int Bookmark_id = rs.getInt("bookmark_id");
		int Bookmark_count = rs.getInt("weight");
		String Bookmark_name = rs.getString("bookmark_name");
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
	elm = document.getElementById("block_button");
	var form = document.createElement('form');
	form.setAttribute("method", "POST");
	form.setAttribute("action", "print_Items.jsp");
	elm.appendChild(form);
	for (var n = 0; n < count; n++) {
		var size = ary_count[n];

		var input_element = document.createElement('input');
		
		switch (n%3) {
		case 0:
			input_element.setAttribute("class", "btn btn-info");
			// this background color is not working....
			input_element.setAttribute("style","background-color:rgb(255,0,255,1.00); border-radius:13px");
			break;
		case 1:
			input_element.setAttribute("class", "btn btn-success");
			input_element.setAttribute("style","background-color:rgb(0,255,255,1.00); border-radius:13px");
			break;
		case 2:
			input_element.setAttribute("class", "btn btn-warning");
			input_element.setAttribute("style","background-color:rgb(255,255,0,1.00); border-radius:13px");
			break;
		default:
			break;
		}
		
		input_element.setAttribute("type", "submit");
		input_element.setAttribute("name", "submit");
		input_element.setAttribute("value", ary_id[n]);
		
		
		input_element.style.margin = 2.5 + 'px';
		
		if (size * 4 < 80)
			input_element.style.width = 80 + 'px';
		else
			input_element.style.width = size * 4 + 'px';
		input_element.style.height = 100 + 'px';
		
		form.appendChild(input_element);
	}
</script>


