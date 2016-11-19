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
<meta name="viewport" content="width=device-width, initial-scale=1.0, webkit">
<title>Untitled Document</title>
<link rel="stylesheet" href="css/bootstrap.css">
    <style type="text/css">
      
		#STATICMENU { margin: 2.5pt; padding: 0pt;  position:absolute; right: 8%; top: 85%; height:30pt; width:23px;'}
    </style>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body style="background-color:#FAF8EE">
<nav class="navbar navbar-inverse" style="border-color:#FAF8EE; background-color:#FAF8EE">
  <div class="container-fluid" style="background-color:#FAF8EE">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="background-color: #69bd8d; border-color: #69bd8d;" >
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#inverseNavbar1" style="border-color:#fff; background-color:#69bd8d; column-rule-color:#69bd8d;"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      
     <a class="navbar-brand" href="#" style="color:#fff; font-size:24px; text-align:center; margin-left:20px; margin-top:-3px" onClick="location='MAIN.html'"><span class="glyphicon glyphicon-credit-card" aria-hidden="true" style="margin-right:-10px">&nbsp;</span>주문으로...</a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="inverseNavbar1" align="center" style="background-color: #69BD8D; border-color: #FAF8EE; margin-top: -6px;">
      <ul class="nav navbar-nav navbar-right" style="border-color: #FAF8EE; color: #69bd8d; margin-bottom: 12px;">
      <div class="btn-group" role="group">
      <button type="button" class="alert-info" style="margin-right:5px">속도UP</button>
      <button type="button" class="alert-warning" style="margin-left:5px" onClick="location='SETTING.html'">설정하기</button>
      <button type="button" class="alert-success" style="margin-left:5px; background-color:#e9e4f0; border-color:#b9b5bf; color:#7129d3" onClick="location='ORDERED.html'">배송보기</button>
       </div>
      </ul>
</div>
<br>
    
   <div>
	<form action=FAVplus.jsp>
		<div class="input-group">
			<span class="input-group-addon">이름</span> 
			<input id="item_name" type="text" class="form-control" name="item_name" placeholder="Write item name" charset="utf-8"></div>
		<div class="input-group">
			<span class="input-group-addon">갯수</span> 
			<input id="item_count" type="text" class="form-control" name="item_count" placeholder="Insert item number"> 
			<span class="input-group-addon">EA</span></div>
		<div class="input-group">
			<span class="input-group-addon">즐겨찾기 이름</span> 
			<input id="bookmark_name" type="text" class="form-control" name="bookmark_name" placeholder="Write favorite group">
			<span class="input-group-addon" style="background-color: rgba(92, 184, 92, 1.00)"> 
			<input id = "submit" type="submit" name="submit" value="추가" class="btn btn-success" 
			style="height: 100%; margin-left: -10px; margin-right: -10px; margin-bottom: -15px; margin-top: -18px; padding-bottom: 20px; font-size:12px; border-color:rgba(92,184,92,1.00);">
	</form>
	</span>
	</div>
	<hr>
	</form>
    <div align="center">
    <input type="search" placeholder="즐겨찾기 이름" style="text-align:center"/>
    <button class="btn"  style="color:#ffffff; background-color:#BD934E;">검색하기</button><br>
    </div>
    
    <div class="tab-pane fade in active" id="LIST">
          <br>
            <div id ="Odered_list" style="width:100%; height:440px; overflow:auto" align="center">
            <table id="list" class="sortable" width="100%" border="0">
  	<thead>
    	<tr>
            <th class="name" style="text-align:center">
            	<a href="index.php?sort=name">이름</a>
            </th>
             <th class="company" style="text-align:center">
            	<a href="index.php?sort=company">회사</a>
            </th>
			 <th class="number" style="text-align:center">
            	<a href="index.php?sort=number">갯수</a>
            </th>
         </tr>
     </thead>
  <tbody>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center">100</td>
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
 </nav>
 <form id="STATICMENU" style="background:#none">
<img src="icon/console.png" width="35" height="55" onclick="click_test()" alt=""/>
</form>

    <script type="text/javascript">
 var stmnLEFT = 10; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 150; // 스크롤 시작위치 
 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
 var stmnTimer; 
 var flag = 0;
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
 // document.getElementById('STATICMENU').style.backgroundColor="#dde8f0"; //크기 보고 싶어서 색 바꿔 놓음 #dde8f0
  
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  //document.getElementById('STATICMENU').style.backgroundImage = url(icon/test.png);
  RefreshStaticMenu();
  }
 
 function click_test(){
	var obj = document.getElementById('STATICMENU');
	 
	if(flag == 0)
	{
		
		var btnupdate = document.createElement('img');
	    btnupdate.setAttribute('id', 'b1');
	    //btnupdate.setAttribute('type', 'button');
	    btnupdate.setAttribute('src', 'icon/lace.png');
	    btnupdate.setAttribute('style','position :relative; right : 0px; bottom :90px ; height:25pt; width:25px; solid : #0000');
	    btnupdate.onclick = function() {  alert('test1');  };
	    obj.appendChild(btnupdate);
	    
	    var btnupdate = document.createElement('img');
	    btnupdate.setAttribute('id', 'b2');
	    //btnupdate.setAttribute('type', 'button');
	    btnupdate.setAttribute('src', 'icon/credit-card.png');
	    btnupdate.setAttribute('style','position :relative; right : 33px; bottom :99px ; height:23pt; width:30px; solid : #0000')
	    btnupdate.onclick = function() {  alert('test');  };
	    obj.appendChild(btnupdate);
		
		 var btnupdate = document.createElement('img');
	    btnupdate.setAttribute('id', 'b3');
	    //btnupdate.setAttribute('type', 'button');
	    btnupdate.setAttribute('src', 'icon/delivery-truck.png');
	    btnupdate.setAttribute('style','position :relative; right :35px; bottom:95px ; height:25pt; width:30px; solid : #0000')
	    btnupdate.onclick = function() {  alert('test');  };
	    obj.appendChild(btnupdate); 
	    
	    var btnupdate = document.createElement('img');
	    btnupdate.setAttribute('id', 'b4');
	    //btnupdate.setAttribute('type', 'button');
	    btnupdate.setAttribute('src', 'icon/fix.png');
	    btnupdate.setAttribute('style','position :relative; right :15px; bottom : 96px ; height:25pt; width:25px; solid : #0000')
	    btnupdate.onclick = function() {  alert('test');  };
	    obj.appendChild(btnupdate);
	    
	    flag = 1;
	}
	
	else if(flag == 1)
	{
	
		var btn = document.getElementById("b1");
		obj.removeChild(btn);
		
		var btn = document.getElementById("b2");
		obj.removeChild(btn);
		
		var btn = document.getElementById("b3");
		obj.removeChild(btn);
		
		var btn = document.getElementById("b4");
		obj.removeChild(btn);
		
		flag = 0;
	}
	
	
 }
</script>
<footer class="footer" id="footer" align="right" style="color:#8ba0e8; margin-right:10px">Three J Two K company</footer>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>


<%
	int i = 0;
	int count = 0;
	int item_id = 0;
	int bookmark_id = 0;
	int flag = 0;
	
	request.setCharacterEncoding("UTF-8"); 
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
	
	System.out.println(item_name1);

	if(item_name1!=null && item_name1.equals("+")==false)
	{
		
		System.out.println("1"+item_name);
		if(item_name!=null && item_name.compareTo("")!=0)
		{
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
		System.out.println(item_name);
		sql = "select id from item where name='" + item_name + "'";
		rs = st.executeQuery(sql);
		if (rs.next()) {
			System.out.println(rs.getInt("id"));
			item_id = rs.getInt("id");
		}

		st = conn.createStatement();
		sql = "insert into favorite values(" + bookmark_id + "," + item_id + "," + item_count+")";
		st.executeUpdate(sql);
		
		/* bookmark_name = null;
		item_name= null;
		item_count= null;
		 */
		
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
		else{
			%>
				<script>
				alert("아이템을 입력하지 않으셨습니다!!");
				</script>
			<% 
		}
	
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
