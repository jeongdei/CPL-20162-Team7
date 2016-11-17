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
			<div align="center">

				<div>
					<form action=FAVplus.jsp>
						<div class="input-group">
							<span class="input-group-addon">이름</span> <input id="item_name"
								type="text" class="form-control" name="item_name"
								placeholder="Write item name">
						</div>
						<div class="input-group">
							<span class="input-group-addon">갯수</span> <input id="item_count"
								type="text" class="form-control" name="item_count"
								placeholder="Insert item number"> <span
								class="input-group-addon">EA</span>
						</div>
						<div class="input-group">
							<span class="input-group-addon">즐겨찾기 이름</span> <input
								id="bookmark_name" type="text" class="form-control"
								name="bookmark_name" placeholder="Write favorite group">
							<span class="input-group-addon"
								style="background-color: rgba(92, 184, 92, 1.00)"> <!--         <input id="test" type="submit" name="submit" onClick = "test(item_name.value,item_count.value,bookmark_name.value)" value="추가" class="btn btn-success" style="height: 100%; margin-left: -10px; margin-right: -10px; margin-bottom: -15px; margin-top: -18px; font-size:12px; border-color:rgba(92,184,92,1.00);"> -->
								<input type="submit" name="submit" value="추가"
								class="btn btn-success"
								style="height: 100%; margin-left: -10px; margin-right: -10px; margin-bottom: -15px; margin-top: -18px; font-size: 12px; border-color: rgba(92, 184, 92, 1.00);">
					</form>
					</span>
				</div>
				<hr>
				</form>
				<div>
					<div align="center">
						<input type="search" placeholder="즐겨찾기 이름"
							style="text-align: center" />
						<button class="btn"
							style="color: #ffffff; background-color: rgba(230, 155, 156, 1.00); border-bottom-color: rgba(230, 155, 156, 1.00)">검색하기</button>
						<br>
					</div>

					<div class="tab-pane fade in active" id="LIST">
						<br>
						<div id="Odered_list"
							style="width: 100%; height: 440px; overflow: auto" align="center">
							<table id="list" class="sortable" width="100%" border="0">
								<thead>
									<tr>
										<th class="name" style="text-align: center"><a
											href="index.php?sort=name">이름</a></th>
										<th class="company" style="text-align: center"><a
											href="index.php?sort=company">회사</a></th>
										<th class="number" style="text-align: center"><a
											href="index.php?sort=number">갯수</a></th>
									</tr>
								</thead>
								<tbody id=table_body>
									<tr>
										<td style="text-align: center">치킨</td>
										<td style="text-align: center">통큐</td>
										<td style="text-align: center">100</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->

		</div>

	</nav>
	<footer class="footer" id="footer" align="right"
		style="color: #FFFFFF; margin-right: 10px">Three J Two K
		company</footer>
	<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>

<%
	int i = 0;
	int count = 0;
	int item_id = 0;
	int bookmark_id = 0;
	int flag = 0;
	String item_name = request.getParameter("item_name");
	String item_count = request.getParameter("item_count");
	String bookmark_name = request.getParameter("bookmark_name");
	Connection conn = DBconn.getConnection();
	Statement st = null;
	String sql = null;
	ResultSet rs = null;

	String Array_name[] = new String[0];
	int Array_price[] = new int[0];
	int Array_count[] = new int[0];
	String Array_bookmark[] = new String[0];

	String item_name1 = request.getParameter("submit");
	
	if(!item_name1.equals("+")){
		st = conn.createStatement();
		sql = "select bookmark_id from bookmark where bookmark_name='" + bookmark_name + "'";
		rs = st.executeQuery(sql);
		if (rs.next()) {
			bookmark_id = rs.getInt("bookmark_id");
			flag = 1;
		}
		if (flag == 0) {
			String sql1 = null;
			sql1 = "insert into bookmark values(0,'" + bookmark_name + "',0)";
			st.executeUpdate(sql1);

			sql1 = "select bookmark_id from bookmark where bookmark_name='" + bookmark_name + "'";
			rs = st.executeQuery(sql1);
			if (rs.next()) {
				bookmark_id = rs.getInt("bookmark_id");
			}

		}

		st = conn.createStatement();
		sql = "select id from item where name='" + item_name + "'";
		rs = st.executeQuery(sql);
		if (rs.next()) {
			item_id = rs.getInt("id");
		}

		st = conn.createStatement();
		sql = "insert into favorite values(" + bookmark_id + "," + item_id + "," + item_count+")";
		st.executeUpdate(sql);
		
		st = conn.createStatement();
		sql = "select count(*) as count from item i, favorite f, bookmark b where f.bookmark_id = "
				+ bookmark_id + " and f.item_id = i.id and b.bookmark_id=f.bookmark_id";
		rs = st.executeQuery(sql);
		if (rs.next()) {
			count = rs.getInt("count");
		}
		Array_name = new String[count];
		Array_price = new int[count];
		Array_count = new int[count];
		Array_bookmark = new String[count];

		st = conn.createStatement();
		sql = "select i.name,i.price, f.count, b.bookmark_name from item i, favorite f, bookmark b where f.bookmark_id = "
				+ bookmark_id + " and f.item_id = i.id and b.bookmark_id=f.bookmark_id";
		rs = st.executeQuery(sql);
		while (rs.next()) {
			Array_name[i] = rs.getString("name");
			Array_price[i] = rs.getInt("price");
			Array_count[i] = rs.getInt("count");
			Array_bookmark[i] = rs.getString("bookmark_name");
			i++;
		}
		st.close();
	}
		

	
%>

<script>

var result = '';
var count = "<%=count%>";
var ary_count = new Array();
var ary_name = new Array();
var ary_bookmark = new Array();
var ary_price = new Array();

<%for (int k = 0; k < count; k++) {%>
	
	ary_count[<%=k%>] = '<%=Array_count[k]%>';
	ary_name[<%=k%>] = '<%=Array_name[k]%>';
	ary_bookmark[<%=k%>] = '<%=Array_bookmark[k]%>';
	ary_price[<%=k%>] = '<%=Array_price[k]%>';
<%}%>
	var tbody = document.getElementById("table_body");
	for (var n = 0; n < count; n++) {

		var tr = document.createElement('tr');

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
