<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>order</title>
<link href="jquery-mobile/jquery.mobile.theme-1.3.0.min.css" rel="stylesheet" type="text/css">
<link href="jquery-mobile/jquery.mobile.structure-1.3.0.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="jquery-mobile/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="jquery-mobile/jquery.mobile-1.3.0.min.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
<div data-role="page" id="order_head">
  <div data-role="header"> <a href="#" data-icon="home" data-role="button" onClick="location='main.html'"> HOME </a>     
   	<button>x2</button>
   	<h1>Color Full 도매</h1>
  </div>
	<div data-role="fieldcontain" style="padding-left: 10px; padding-right: 10px" align="center">
      <span class="label label-info" style="font-size: 30px; color: rgba(0,0,0,1.00); background-color: rgba(243,243,243,1.00);"> 검색주문 </span>
      <br>
      <span>
      <input type="text" autocomplete="on">
      <a href="#" class="ui-bar-e" data-inline="true" data-role="button">검색</a>
      </span>
    <br> 
    <div id=favorite_div data-inline="true" data-type="horizontal" align="center">
        <a href="#" class="ui-bar" data-inline="true" data-icon="star" data-role="button" data-iconpos="notext"></a>
        <a href="#" class="ui-bar-a" data-inline="true" data-role="button" style="width:70px; text-align:center"></a>
        <a href="#" class="ui-bar-b" data-inline="true" data-role="button" style="width:70px; text-align:center"></a>
        <a href="#" class="ui-bar-d" data-inline="true" data-role="button" style="width:70px; text-align:center"></a> 
        <a href="#" class="ui-bar" data-inline="true" data-icon="plus" data-role="button" data-iconpos="notext"></a>
    	<form method="POST" action="insert_add_Favorite_info.jsp">
    		<input type="submit" name="submit" value="add"/>
    	</form>
    </div>
</div>

  <span data-role="fieldcontain" style="padding-left:10px; padding-right:10px;" align="center"> <span class="label label-info" style="font-size: 30px; color: rgba(0,0,0,1.00); background-color: rgba(243,243,243,1.00);"> 장바구니</span> <br>
    <input name="text" type="text" autocomplete="on">
    <strong><a href="#" class="ui-bar-e" data-inline="true" data-role="button">주문하기</a></strong>
    <fieldset data-role="controlgroup">
      <input name="shoppingBox" type="checkbox" class="custom" id="shoppingBox_0" value="" checked />
      <label for="shoppingBox_0">item_name</label>
      <input name="shoppingBox" type="checkbox" class="custom" id="shoppingBox_1" value="" checked />
      <label for="shoppingBox_1">item_name</label>
      <input name="shoppingBox" type="checkbox" class="custom" id="shoppingBox_2" value="" checked />
      <label for="shoppingBox_2">item_name</label>
      <input name="shoppingBox" type="checkbox" class="custom" id="shoppingBox_3" value="" checked />
      <label for="shoppingBox_3">item_name</label>
      <input name="shoppingBox" type="checkbox" class="custom" id="shoppingBox_4" value="" checked />
      <label for="shoppingBox_4">item_name</label>
      <input name="shoppingBox" type="checkbox" class="custom" id="shoppingBox_5" value="" checked />
      <label for="shoppingBox_5">item_name</label>
    </fieldset>
  </span>
  <div data-role="content">
    <span data-role="fieldcontain" style="padding-left:10px; padding-right:10px;" align="center"> </span>
</div>

	<div data-role="footer">
 	 <h6 class="ui-android-2x-fixed" style="font-size:10px">전김강정조 company</h6>
	</div>
</div>
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

			String sql = "Select id,count,name from bookmark order by count DESC";
			ResultSet rs = st.executeQuery(sql);
			Array_count = new int[3];
			Array_name = new String[3];
			Array_id = new int[3];
			while (rs.next()) {

				int Bookmark_id = rs.getInt("id");
				int Bookmark_count = rs.getInt("count");
				String Bookmark_name = rs.getString("name");
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
		var count = 3;
		var ary_count = new Array();
		var ary_name = new Array();
		var ary_id = new Array();
		
		<%for (int k = 0; k < 3; k++) {%>
		
			ary_name[<%=k%>] = '<%=Array_name[k]%>';
			
		<%}%>
			elm = document.getElementById("favorite_div");
			var form = document.createElement('form');
			form.setAttribute("method", "POST");
			elm.appendChild(form);
			for (var n = 0; n < count; n++) {
				
				var input_element = document.createElement('input');
				input_element.setAttribute("type", "submit");
				input_element.setAttribute("name", "submit");
				input_element.setAttribute("value", ary_name[n]);

				form.appendChild(input_element);
			}
		
		
		</script>
