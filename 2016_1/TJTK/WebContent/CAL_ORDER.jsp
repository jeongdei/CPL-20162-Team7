<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, webkit">
<title>Untitled Document</title>
<link rel="stylesheet" href="css/calendar.css">
<style type="text/css">
html {
	font: 500 10px "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #333;
}

a {
	text-decoration: none;
}

ul, ol, li {
	list-style: none;
	padding: 0;
	margin: 0;
}

#demo {
	width: 300px;
	margin: 30px auto;
}

p {
	margin: 0;
}

input {
	margin: 30px auto;
	height: 28px;
	width: 30px;
	padding: 0 6px;
	border: 1px solid #ccc;
	outline: none;
	chechked
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var chart = new CanvasJS.Chart("chartContainer", {
			theme : "theme2",
			title : {
				text : "Basic Column Chart - CanvasJS"
			},
			animationEnabled : true,
			data : [ {
				type : "column",
				dataPoints : [ {
					label : "수입",
					y : 30
				}, {
					label : "지출",
					y : 60
				} ]
			} ]
		});
		chart.render();
</script>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script language="javascript">
	// 조건 <input type="checkbox" value="305=1473489733"> 이면
		window.onload = function() {
			var input = document.getElementsByTagName('input');
			for (var i = 0; i < input.length; i++) {
				if (input[i].type == 'checkbox')
					input[i].checked = true;
			}
		};
</script>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/calendar.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #FAF8EE">
	<nav class="navbar navbar-inverse"
		style="border-color:#FAF8EE; background-color:#FAF8EE">
	<div class="container-fluid" style="background-color: #FAF8EE">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header"
			style="background-color: #69bd8d; border-color: #69bd8d;">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#inverseNavbar1"
				style="border-color: #fff; background-color: #69bd8d; column-rule-color: #69bd8d;">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"
				style="color: #fff; font-size: 24px; text-align: center; margin-left: 20px; margin-top: -3px"
				onClick="location='MAIN.html'"><span
				class="glyphicon glyphicon-home" aria-hidden="true"
				style="margin-right: -10px">&nbsp;</span>홈으로...</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="inverseNavbar1"
			align="center"
			style="background-color: #69BD8D; border-color: #FAF8EE; margin-top: -6px;">
			<ul class="nav navbar-nav navbar-right"
				style="border-color: #FAF8EE; color: #69bd8d; margin-bottom: 12px;">
				<div class="btn-group" role="group">
					<button type="button" class="alert-info" style="margin-right: 5px">속도UP</button>
					<button type="button" class="alert-warning"
						style="margin-left: 5px" onClick="location='SETTING.html'">설정하기</button>
					<!-- <button type="button" class="alert-success" style="margin-left:5px; background-color:#e9e4f0; border-color:#b9b5bf; color:#7129d3" onClick="location='ORDERED.html'">배송보기</button> -->
				</div>
			</ul>
		</div>
		<br>

		<%
			ArrayList<String> Array_company0 = new ArrayList<String>();
			ArrayList<String> Array_company1 = new ArrayList<String>();

			ArrayList<String> Array_item0 = new ArrayList<String>();
			ArrayList<String> Array_item1 = new ArrayList<String>();

			ArrayList<Integer> Array_count0 = new ArrayList<Integer>();
			ArrayList<Integer> Array_count1 = new ArrayList<Integer>();

			ArrayList<Integer> Array_type = new ArrayList<Integer>();

			ArrayList<Integer> Array_price0 = new ArrayList<Integer>();
			ArrayList<Integer> Array_price1 = new ArrayList<Integer>();

			ArrayList<String> Comp_list = new ArrayList<String>();

			int gume = 0;
			int panme = 0;

			request.setCharacterEncoding("UTF-8");
			String code = request.getParameter("code");
			Connection conn = DBconn.getConnection();

			//메인에서 cal_order 들어왔을 때
			//먼저 선택된 날짜 메인화면에서 받아옴(sel_day) 
			String sel_day = request.getParameter("plz");
			//System.out.println(sel_day);

			//그러고나 디비연결하고 데이터 받아오기ㅣ 
			Statement st = conn.createStatement();
			Statement st2 = conn.createStatement();
		%>
		<div align="center" style="font-size: 25px">
			<%=sel_day.charAt(0) + "" + sel_day.charAt(1) + "" + sel_day.charAt(2) + "" + sel_day.charAt(3) + ""
					+ "년 " + sel_day.charAt(4) + sel_day.charAt(5) + "월 " + sel_day.charAt(5) + sel_day.charAt(6)
					+ "일 "%>
		</div>
		<br>
		<div></div>
		<div role="tabpanel">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home1"
					data-toggle="tab" role="tab" aria-controls="tab1"
					style="color: #000000">주문 내역</a></li>
				<li role="presentation"><a href="#paneTwo1" data-toggle="tab"
					role="tab" aria-controls="tab2" style="color: #000000">들어온주문</a></li>
				<li role="presentation" class="dropdown"><a href="#"
					id="tabDropOne1" class="dropdown-toggle" data-toggle="dropdown"
					role="tab" aria-controls="tab3" aria-haspopup="true"
					aria-expanded="false" style="color: #000000">매출<span
						class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="tabDropOne1">
						<li><a href="#tabDropDownOne1" tabindex="-1"
							data-toggle="tab">날짜별 매출보기</a></li>
						<li><a href="#tabDropDownTwo1" tabindex="-1"
							data-toggle="tab">월별 매출보기</a></li>
					</ul></li>
			</ul>
			<div id="tabContent1" class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="home1">
					<!--여기에 선택한 날짜에 구매한 목록 회사별 테이블로 보여줌-->
					<div align="center">
						<br>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default"
								style="background-color: #E69B9C; color: #ffffff; margin-right: 5px"
								onclick="location='ACCEPT_1.jsp'">바로주문하기</button>
							<!-- 누르면 배송지 입력 페이지로 이동-->
							<button type="button" class="btn btn-default"
								style="background-color: #69BD8D; color: #ffffff; margin-left: 5px"
								onclick="location='ORDER.html'">추가주문하기</button>
							<!-- 누르면 배송지 주문하기 페이지로 이동-->


						</div>
						<br>
					</div>
					<br>
					<table align="center" width="100%" style="margin-bottom: 10px">
						<thead>
							<tr>
								<th id="check" style="text-align: center" width="40%">회사
									<button class="btn" onclick="sortTD(0)"
										style="background-color: #FAF8EE; font-size: 10px; width: 4px; padding-left: 0px">▲</button>
									<button class="btn"
										style="background-color: #FAF8EE; font-size: 10px; width: 4px; padding-left: 0px"
										onclick="reverseTD(0)">▼</button>
								</th>
								<th id="name" style="text-align: center" width="30%">이름</th>
								<th id="number" style="text-align: center" width="40%">갯수</th>
							</tr>
						</thead>
					</table>
					<div id="Shopping_Cart"
						style="width: 100%; height: 300px; overflow: auto" align="center">
						<table id="cart" class="sortable" width="100%" border="0">
							<tbody>
								<%
									//회사이름, 아이템 이름, 아이템 가격, 주문량, 판매인지 구매인지 구분
									String sql = "Select i.comp_name,o.order_type,i.price,i.name,oi.order_count from item i,order_item oi,order2 o where o.order_id=oi.order_id and oi.item_id=i.id and date_format(o.order_date,'%Y%m%d')=date_format("
											+ sel_day + ",'%Y%m%d')";
									String sql2 = "Select i.comp_name from item i,order_item oi,order2 o where o.order_id=oi.order_id and oi.item_id=i.id and date_format(o.order_date,'%Y%m%d')=date_format("
											+ sel_day + ",'%Y%m%d') group by i.comp_name";
									ResultSet rs = st.executeQuery(sql);
									ResultSet rs2 = st2.executeQuery(sql2);
									int pnum=0;
									int gnum=0;
									
									while (rs2.next()) {
										String cn = rs2.getString("i.comp_name");
										Comp_list.add(cn);
									}
									while (rs.next()) {

										String company_name = rs.getString("i.comp_name");
										String item_name = rs.getString("i.name");
										int order_count = rs.getInt("oi.order_count");
										int price = rs.getInt("i.price");
										int type = rs.getInt("o.order_type");

										//매출을 여기서 먼저 계산해줌!
										if (type == 0)//type=0이면 판매내역
										{
											panme += price;
											Array_company0.add(company_name);
											Array_item0.add(item_name);
											Array_count0.add(order_count);
											Array_price0.add(price);
											pnum++;
											
										} else {
											gume += price;
											Array_company1.add(company_name);
											Array_item1.add(item_name);
											Array_count1.add(order_count);
											Array_price1.add(price);
											gnum++;
										}
									}
									for (int i = 0; i < Comp_list.size(); i++) {
								%>
								<tr>
									<td width="40%" style="text-align: center"><input
										type="checkbox"><br> <span><%=Comp_list.get(i)%></span></td>

									<td><table width="100%">
											<%
												for (int j = 0; j < gnum; j++) {
														//if (Array_company1.get(j).equals(Comp_list.get(i))) {
											%>
											<tr>
												<td width="50%" style="text-align: center"><%=Array_item1.get(j)%></td>
												<td width="50%" style="text-align: center"><input
													type="number" style="width: 60px"
													value="<%=Array_count1.get(j)%>"></td>
											</tr>
											<%
												//}
													}
											%>
										</table></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="paneTwo1">
					<!--여기에 선택한 날짜에 들어온 주문 목록 회사별 테이블로 보여줌-->
					<br>
					<table align="center" width="100%">
						<thead>
							<tr>
								<th id="check2" style="text-align: center" width="40%">회사
									<button class="btn" onclick="sortTD2(0)"
										style="background-color: #FAF8EE; font-size: 10px; width: 4px; padding-left: 0px">▲</button>
									<button class="btn"
										style="background-color: #FAF8EE; font-size: 10px; width: 4px; padding-left: 0px"
										onclick="reverseTD2(0)">▼</button>
								</th>
								<th id="name2" style="text-align: center" width="30%">이름</th>
								<th id="number2" style="text-align: center" width="40%">갯수</th>
							</tr>
						</thead>
					</table>
					<div id="Shopping_Cart2"
						style="width: 100%; height: 300px; overflow: auto" align="center">
						<table id="cart2" class="sortable" width="100%" border="0">
							<tbody>
								<%
									for (int i = 0; i < Comp_list.size(); i++) {
								%>
								<tr>
									<td width="40%" style="text-align: center"><input
										type="checkbox"><br> <span> <%=Comp_list.get(i)%></span></td>

									<td><table width="100%">
											<%
												for (int j = 0; j < pnum; j++) {
														//if (Array_company0.get(j).equals(Comp_list.get(i))){
											%>
											<tr>
												<td width="50%" style="text-align: center"><%=Array_item0.get(j)%></td>
												<td width="50%" style="text-align: center"><input
													type="number" style="width: 60px"
													value="<%=Array_count0.get(j)%>"></td>
											</tr>
											<%
											//	}
													}
											%>
										</table></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="tabDropDownOne1">
					<div>
						<div class="panel-group" id="accordion1" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion1"
											href="#collapseTwo1">당일 수입 총액 </a>
									</h4>
								</div>
								<div id="collapseTwo1" class="panel-collapse collapse">
									<div class="panel-body">
										<div id="panme_here"><%=panme%>원
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion1"
											href="#collapseThree1">당일 지출 총액 </a>
									</h4>
								</div>
								<div id="collapseThree1" class="panel-collapse collapse">
									<div class="panel-body">
										<div id="gume_here"><%=gume%>원
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="tabDropDownTwo1">
					<div class="panel-group" id="accordion2" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion2"
										href="#collapseTwo2">총 수입</a>
								</h4>
							</div>
							<div id="collapseTwo2" class="panel-collapse collapse">
								<div class="panel-body">Content for Accordion Panel 2</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion2"
										href="#collapseThree2">총 지출</a>
								</h4>
							</div>
							<div id="collapseThree2" class="panel-collapse collapse">
								<div class="panel-body">Content for Accordion Panel 3</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		rs.close();
		st.close();
		DBconn.close();
		System.out.println(panme);
		System.out.println(gume);
	%> <!-- /.container-fluid --> </nav>
	<footer class="footer" id="footer" align="right"
		style="color:#8ba0e8; margin-right:10px"> <br>
	Three J Two K company</footer>
	<script type="text/javascript">
		function sortingNumber(a, b) {

				if (typeof a == "number" && typeof b == "number")
					return a - b;

				// 천단위 쉼표와 공백문자만 삭제하기.  
				var a = (a + "").replace(/[,\s\xA0]+/g, "");
				var b = (b + "").replace(/[,\s\xA0]+/g, "");

				var numA = parseFloat(a) + "";
				var numB = parseFloat(b) + "";

				if (numA == "NaN" || numB == "NaN" || a != numA || b != numB)
					return false;

				return parseFloat(a) - parseFloat(b);
			}

			/* changeForSorting() : 문자열 바꾸기. */

			function changeForSorting(first, second) {

				// 문자열의 복사본 만들기. 
				var a = first.toString().replace(/[\s\xA0]+/g, " ");
				var b = second.toString().replace(/[\s\xA0]+/g, " ");

				var change = {
					first : a,
					second : b
				};

				if (a.search(/\d/) < 0 || b.search(/\d/) < 0 || a.length == 0
						|| b.length == 0)
					return change;

				var regExp = /(\d),(\d)/g; // 천단위 쉼표를 찾기 위한 정규식. 

				a = a.replace(regExp, "$1" + "$2");
				b = b.replace(regExp, "$1" + "$2");

				var unit = 0;
				var aNb = a + " " + b;
				var numbers = aNb.match(/\d+/g); // 문자열에 들어있는 숫자 찾기 

				for (var x = 0; x < numbers.length; x++) {

					var length = numbers[x].length;
					if (unit < length)
						unit = length;
				}

				var addZero = function(string) { // 숫자들의 단위 맞추기 

					var match = string.match(/^0+/);

					if (string.length == unit)
						return (match == null) ? string : match + string;

					var zero = "0";

					for (var x = string.length; x < unit; x++)
						string = zero + string;

					return (match == null) ? string : match + string;
				};

				change.first = a.replace(/\d+/g, addZero);
				change.second = b.replace(/\d+/g, addZero);

				return change;
			}

			/* byLocale() */

			function byLocale() {

				var compare = function(a, b) {

					var sorting = sortingNumber(a, b);

					if (typeof sorting == "number")
						return sorting;

					var change = changeForSorting(a, b);

					var a = change.first;
					var b = change.second;

					return a.localeCompare(b);
				};

				var ascendingOrder = function(a, b) {
					return compare(a, b);
				};
				var descendingOrder = function(a, b) {
					return compare(b, a);
				};

				return {
					ascending : ascendingOrder,
					descending : descendingOrder
				};
			}

			/* replacement() */

			function replacement(parent) {
				var tagName = parent.tagName.toLowerCase();
				if (tagName == "table")
					parent = parent.tBodies[0];
				tagName = parent.tagName.toLowerCase();
				if (tagName == "tbody")
					var children = parent.rows;
				else
					var children = parent.getElementsByTagName("li");

				var replace = {
					order : byLocale(),
					index : false,
					array : function() {
						var array = [];
						for (var x = 0; x < children.length; x++)
							array[x] = children[x];
						return array;
					}(),
					checkIndex : function(index) {
						if (index)
							this.index = parseInt(index, 10);
						var tagName = parent.tagName.toLowerCase();
						if (tagName == "tbody" && !index)
							this.index = 0;
					},
					getText : function(child) {
						if (this.index)
							child = child.cells[this.index];
						return getTextByClone(child);
					},
					setChildren : function() {
						var array = this.array;
						while (parent.hasChildNodes())
							parent.removeChild(parent.firstChild);
						for (var x = 0; x < array.length; x++)
							parent.appendChild(array[x]);
					},
					ascending : function(index) { // 오름차순 
						this.checkIndex(index);
						var _self = this;
						var order = this.order;
						var ascending = function(a, b) {
							var a = _self.getText(a);
							var b = _self.getText(b);
							return order.ascending(a, b);
						};
						this.array.sort(ascending);
						this.setChildren();
					},
					descending : function(index) { // 내림차순
						this.checkIndex(index);
						var _self = this;
						var order = this.order;
						var descending = function(a, b) {
							var a = _self.getText(a);
							var b = _self.getText(b);
							return order.descending(a, b);
						};
						this.array.sort(descending);
						this.setChildren();
					}
				};
				return replace;
			}

			function getTextByClone(tag) {
				var clone = tag.cloneNode(true); // 태그의 복사본 만들기. 
				var br = clone.getElementsByTagName("br");
				while (br[0]) {
					var blank = document.createTextNode(" ");
					clone.insertBefore(blank, br[0]);
					clone.removeChild(br[0]);
				}
				var isBlock = function(tag) {
					var display = "";
					if (window.getComputedStyle)
						display = window.getComputedStyle(tag, "")["display"];
					else
						display = tag.currentStyle["display"];
					return (display == "block") ? true : false;
				};
				var children = clone.getElementsByTagName("*");
				for (var x = 0; x < children.length; x++) {
					var child = children[x];
					if (!("value" in child) && isBlock(child))
						child.innerHTML = child.innerHTML + " ";
				}
				var textContent = clone.textContent || clone.innerText;
				return textContent;
			}
	</script>
	<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.js" type="text/javascript"></script>
	<script type="text/javascript">
		var myTable = document.getElementById("cart");
			var myTable2 = document.getElementById("cart2");
			function sortTD(index) {
				replacement(myTable).ascending(index);
			}
			function sortTD2(index) {
				replacement(myTable2).ascending(index);
			}
			function reverseTD(index) {

				replacement(myTable).descending(index);
			}
			function reverseTD2(index) {
				replacement(myTable2).descending(index);
			}
		}
	</script>
</body>
</html>