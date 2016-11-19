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
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome, safari">
<style type="text/css">
#cart
{
	width :300px;
}
.Loop {
	display: block;
	height: 600px;
	overflow:auto;
}
@-webkit-keyframes mynewmove {
    from {top: 40px}
    to {top: 60px}
}
@keyframes mynewmove{
	from {top:40px}
	to {top: 60px}
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset="utf8">
<title>DB Table Test</title>
</head>
<body>

	<h2>목록</h2>
	<table>
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
	</table > <!--"sortable", style="overflow:auto;"-->
		
	<div id = "cart" class="Loop js-loop">
	<table border="0" height="600px" >	
		<tbody id ="myDiv">
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
			<tr id="Test<%=ids%>" class="test" height:100px;">
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
			<tr  id="<%=i%>" class="test is-clone">
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
	</div>
	
	<script type="text/javascript">
		var doc = window.document,context = doc
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

		context.addEventListener('resize', function() {
			window.requestAnimationFrame(reCalc);
		}, false);

		// Just for the demo: Center the middle block on page load
		context.onload = function() {
			setScrollPos(Math.round(clones[0].getBoundingClientRect().top
					+ getScrollPos()
					- (window.innerHeight - clones[0].offsetHeight) / 2));
		};

		var elem = document.getElementById("cart");
		
		
		if (elem.addEventListener){
			//elem.addEventListener('onmousewheel', wheel, false);
			elem.addEventListener('scroll',wheel,false);
		}

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
			handle(delta,event);
			
			//		  if(event.preventDefault)
			//			  event.preventDefault();
			event.returnValue = false;
		}

		function handle(delta,event) {

			//시간
			var time = 1000;
			
			//alert("1");
			
			//var table = $('#cart');
			var table = document.getElementById("cart");
			
		
			//거리 얼마나 움직일지
			var dist = 500;
			//alert(table.scrollTop);
			

			if(table.scrollTop <= document.getElementsByTagName('tr')[400].offsetTop + 700 && table.scrollTop >=  document.getElementsByTagName('tr')[400].offsetTop - 700 )
			{	
			  	event.preventDefault();	  
			  	event.preventDefault();	  
			  	//setTimeout(set_scrollTop,800);
			  	
			  	
				//context.scrollTop = document.getElementsByTagName('tr')[400].offsetTop;
			  	for(var i= document.getElementsByTagName('tr')[400].offsetTop-150 ;i<= document.getElementsByTagName('tr')[400].offsetTop ; i=i+5)
			  	{
					context.scrollTop = i;
	     		}	
			}
				
			
		  
		    
			//alert("3");
			
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