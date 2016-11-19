<%@page import="java.sql.SQLException"%>
<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tbody.Loop {
	display: block;
	height: 600px;
	overflow:auto;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DB Table Test</title>
</head>
<body>

	<h2>목록</h2>
	<table id="cart" class="sortable" width="100%" border="0">
		<thead>
			<tr>
				<th class="check" style="text-align: center"><a
					style="color: rgba(51, 122, 183, 1.00)">체크</a></th>
				<th class="id" style="text-align: center"><a
					href="index.php?sort=id">아이디</a></th>
				<th class="name" style="text-align: center"><a
					href="index.php?sort=name">이름</a></th>
				<th class="stock_count" style="text-align: center"><a
					href="index.php?sort=number">재고</a></th>
				<th class="price" style="text-align: center"><a
					href="index.php?sort=price">가격</a></th>
			</tr>
		</thead>
		<tbody id="myDiv" class="Loop js-loop" >
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				int p = 0;
				int DB_id[] = new int[600];
				String DB_name[] = new String[600];
				String DB_stock_count[] = new String[600];
				String DB_price[] = new String[600];
				int ids =0;
				String name = null;
				String stock_count = null;
				String price = null;

				try {
					conn = DBconn.getConnection();
					String sql = "Select id,name,stock_count,price from item order by id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						ids = rs.getInt("id");
						name = rs.getString("name");
						stock_count = rs.getString("stock_count");
						price = rs.getString("price");
						DB_id[p] = ids;
						DB_name[p] = name;
						DB_stock_count[p] = stock_count;
						DB_price[p] = price;
						p++;
								
			%>
			<tr id="Test<%=ids%>" class="test" style="overflow:auto;height:100px;">
				<th scope="row" style="text-align: center;">
				<input type="checkbox">
				</th>
				<td style="text-align: center"><%=ids%></td>
				<td style="text-align: center"><%=name%></td>
				<td style="text-align: center"><input type="number"
					style="width: 60px"></td>
				<td style="text-align: center"><%=price%></td>
			</tr>
			<%
				}
			%>
			<%
				for (int i = 0; i < 500; i++) {
			%>
			<tr id="Test<%=i%>" class="test is-clone">
				<th scope="row" style="text-align: center"><input
					type="checkbox"></th>
				<td style="text-align: center"><%=i%></td>
				<td style="text-align: center"><%=DB_name[i]%></td>
				<td style="text-align: center"><input type="number"
					style="width: 60px"></td>
				<td style="text-align: center"><%=DB_price[i]%></td>
			</tr>
			<%
				}
			%>

			<%
				} catch (SQLException se) {
					System.out.println(se.getMessage());
				} finally {

				}
			%>
			
		</tbody>
	</table>
	<script type="text/javascript">
		var doc = window.document, context = doc
				.getElementsByClassName('js-loop')[0], clones = context
				.getElementsByClassName('is-clone'), disableScroll, scrollHeight, scrollPos, clonesHeight, i;
		function getScrollPos() {
			return (context.pageYOffset || context.scrollTop)
					- (context.clientTop || 0);
		}

		function setScrollPos(pos) {
			context.scrollTop = pos;
		}

		function getClonesHeight() {
			clonesHeight = 0;
			i = 0;

			for (i; i < clones.length; i += 1) {
				clonesHeight = clonesHeight + clones[i].offsetHeight;
			}

			return clonesHeight;
		}

		function reCalc() {
			scrollPos = getScrollPos();
			scrollHeight = context.scrollHeight;
			clonesHeight = getClonesHeight();

			if (scrollPos <= 0) {
				setScrollPos(1); // Scroll 1 pixel to allow upwards scrolling
			}
		}

		// Calculate variables
		window.requestAnimationFrame(reCalc);

		function scrollUpdate() {
			if (!disableScroll) {
				scrollPos = getScrollPos();

				if (clonesHeight + scrollPos >= scrollHeight) {
					// Scroll to the top when you’ve reached the bottom
					setScrollPos(1); // Scroll down 1 pixel to allow upwards scrolling
					disableScroll = true;
				} else if (scrollPos <= 0) {
					// Scroll to the bottom when you reach the top
					setScrollPos(scrollHeight - clonesHeight);
					disableScroll = true;
				}
			}

			if (disableScroll) {
				// Disable scroll-jumping for a short time to avoid flickering
				window.setTimeout(function() {
					disableScroll = false;
				}, 40);
			}
		}

		context.addEventListener('scroll', function() {
			window.requestAnimationFrame(scrollUpdate);
		}, false);

		window.addEventListener('resize', function() {
			window.requestAnimationFrame(reCalc);
		}, false);

		// Just for the demo: Center the middle block on page load
		window.onload = function() {
			setScrollPos(Math.round(clones[0].getBoundingClientRect().top
					+ getScrollPos()
					- (window.innerHeight - clones[0].offsetHeight) / 2));
		};

		var elem = document.getElementById("myDiv");
		
		//elem.addEventListener('onmousewheel', wheel, false);
		elem.onmousewheel = wheel;

		function wheel(event) {
			var delta = 0;
			
			//alert(event.wheelDelta);
			if (event.wheelDelta) {
				delta = event.wheelDelta / 120;
				//alert(event.wheelDelta);
			} else if (event.detail) {
				delta = -event.detail / 3;
				//alert(event.detail);
			}
			handle(delta);
			
			//		  if(event.preventDefault)
			//			  event.preventDefault();
			event.returnValue = false;
		}

		function handle(delta) {

			
			//시간
			var time = 1000;
			//div7에대한 위치
			var dist2 = document.getElementById("cart");
//			var row_s = document.getElementById("cart").rows.length;
			//alert(row_s);
			//dist2.position();
			//var dist2 = document.getElementById("50");
			
			//var tr_test = document.getElementById('#myDiv').getElementById('#Test10');
			//alert(tr_test.Position());
			
			
			
			//var distance = $('#div1').position();
			//var distance2 = $('#div20').position();
			//거리 얼마나 움직일지
			var dist = 500;
			
			
			console.log(dist2.scrollTop);
			//alert(dist2.scrollTop)
			//alert(distance.top);
			
			
//			if ($('#myDiv').scrollTop() < distance.top + 100
//					&& $('#myDiv').scrollTop() > distance.top - 100) {
//				$('#myDiv').stop().animate({
//					//scrollTop : $('#div' +id).scrollTop() - (dist * delta)
//					scrollTop : $('#myDiv').scrollTop() - (dist * delta)
//				}, time);
//			}
			//	  		alert(distance2.top);
			//			if( $('#myDiv').scrollTop() < distance2.top + 150 && $('#myDiv').scrollTop() > distance2.top - 150){	 
			//		  		$('#myDiv').stop().animate({
			//		  			//scrollTop : $('#div' +id).scrollTop() - (dist * delta)
			//		  			scrollTop : $('#myDiv').scrollTop() - (dist * delta)
			//				},time);
			//		  	}

			//			else{
			//		  		$('#myDiv').stop().animate({
			//scrollTop : $('#div' +id).scrollTop() - (dist * delta)
			//		  			scrollTop : $('#myDiv').scrollTop()
			//				},10);
			//		  	}	  		

		}
	</script>
</body>
</html>