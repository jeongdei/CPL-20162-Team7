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
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Untitled Document</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

function sortingNumber( a , b ){  

        if ( typeof a == "number" && typeof b == "number" ) return a - b; 

        // 천단위 쉼표와 공백문자만 삭제하기.  
        var a = ( a + "" ).replace( /[,\s\xA0]+/g , "" ); 
        var b = ( b + "" ).replace( /[,\s\xA0]+/g , "" ); 

        var numA = parseFloat( a ) + ""; 
        var numB = parseFloat( b ) + ""; 

        if ( numA == "NaN" || numB == "NaN" || a != numA || b != numB ) return false; 

        return parseFloat( a ) - parseFloat( b ); 
} 


/* changeForSorting() : 문자열 바꾸기. */ 

function changeForSorting( first , second ){  

        // 문자열의 복사본 만들기. 
        var a = first.toString().replace( /[\s\xA0]+/g , " " ); 
        var b = second.toString().replace( /[\s\xA0]+/g , " " ); 

        var change = { first : a, second : b }; 

        if ( a.search( /\d/ ) < 0 || b.search( /\d/ ) < 0 || a.length == 0 || b.length == 0 ) return change; 

        var regExp = /(\d),(\d)/g; // 천단위 쉼표를 찾기 위한 정규식. 

        a = a.replace( regExp , "$1" + "$2" ); 
        b = b.replace( regExp , "$1" + "$2" ); 

        var unit = 0; 
        var aNb = a + " " + b; 
        var numbers = aNb.match( /\d+/g ); // 문자열에 들어있는 숫자 찾기 

        for ( var x = 0; x < numbers.length; x++ ){ 

                var length = numbers[ x ].length; 
                if ( unit < length ) unit = length; 
        } 

        var addZero = function( string ){ // 숫자들의 단위 맞추기 

                var match = string.match( /^0+/ ); 

                if ( string.length == unit ) return ( match == null ) ? string : match + string; 

                var zero = "0"; 

                for ( var x = string.length; x < unit; x++ ) string = zero + string; 

                return ( match == null ) ? string : match + string; 
        }; 

        change.first = a.replace( /\d+/g, addZero ); 
        change.second = b.replace( /\d+/g, addZero ); 

        return change; 
} 


/* byLocale() */ 

function byLocale(){ 

        var compare = function( a , b ){ 

                var sorting = sortingNumber( a , b ); 

                if ( typeof sorting == "number" ) return sorting; 

                var change = changeForSorting( a , b ); 

                var a = change.first; 
                var b = change.second; 

                return a.localeCompare( b ); 
        }; 

        var ascendingOrder = function( a , b ){  return compare( a , b );  }; 
        var descendingOrder = function( a , b ){  return compare( b , a );  }; 

        return { ascending : ascendingOrder, descending : descendingOrder }; 
} 


/* replacement() */ 
 
function replacement( parent ){  
        var tagName = parent.tagName.toLowerCase(); 
        if ( tagName == "table" ) parent = parent.tBodies[ 0 ]; 
        tagName = parent.tagName.toLowerCase(); 
        if ( tagName == "tbody" ) var children = parent.rows; 
        else var children = parent.getElementsByTagName( "li" ); 

        var replace = { 
                order : byLocale(), 
                index : false, 
                array : function(){ 
                        var array = [ ]; 
                        for ( var x = 0; x < children.length; x++ ) array[ x ] = children[ x ]; 
                        return array; 
                }(), 
                checkIndex : function( index ){ 
                        if ( index ) this.index = parseInt( index, 10 ); 
                        var tagName = parent.tagName.toLowerCase(); 
                        if ( tagName == "tbody" && ! index ) this.index = 0; 
                }, 
                getText : function( child ){ 
                        if ( this.index ) child = child.cells[ this.index ]; 
                        return getTextByClone( child ); 
                }, 
                setChildren : function(){ 
                        var array = this.array; 
                        while ( parent.hasChildNodes() ) parent.removeChild( parent.firstChild ); 
                        for ( var x = 0; x < array.length; x++ ) parent.appendChild( array[ x ] ); 
                }, 
                ascending : function( index ){ // 오름차순 
                        this.checkIndex( index ); 
                        var _self = this; 
                        var order = this.order; 
                        var ascending = function( a, b ){ 
                                var a = _self.getText( a ); 
                                var b = _self.getText( b ); 
                                return order.ascending( a, b ); 
                        }; 
                        this.array.sort( ascending ); 
                        this.setChildren(); 
                }, 
                descending : function( index ){ // 내림차순
                        this.checkIndex( index ); 
                        var _self = this; 
                        var order = this.order; 
                        var descending = function( a, b ){ 
                                var a = _self.getText( a ); 
                                var b = _self.getText( b ); 
                                return order.descending( a, b ); 
                        }; 
                        this.array.sort( descending ); 
                        this.setChildren(); 
                } 
        }; 
        return replace; 
} 

function getTextByClone( tag ){  
        var clone = tag.cloneNode( true ); // 태그의 복사본 만들기. 
        var br = clone.getElementsByTagName( "br" ); 
        while ( br[0] ){ 
                var blank = document.createTextNode( " " ); 
                clone.insertBefore( blank , br[0] ); 
                clone.removeChild( br[0] ); 
        } 
        var isBlock = function( tag ){ 
                var display = ""; 
                if ( window.getComputedStyle ) display = window.getComputedStyle ( tag, "" )[ "display" ]; 
                else display = tag.currentStyle[ "display" ]; 
                return ( display == "block" ) ? true : false; 
        }; 
        var children = clone.getElementsByTagName( "*" ); 
        for ( var x = 0; x < children.length; x++){ 
                var child = children[ x ]; 
                if ( ! ("value" in child) && isBlock(child) ) child.innerHTML = child.innerHTML + " "; 
        } 
        var textContent = clone.textContent || clone.innerText; 
        return textContent; 
} 
</script>


</head>
<body style="background-color:#FAF8EE">
<nav class="navbar navbar-inverse" style="border-color:#FAF8EE; background-color:#FAF8EE">
  <div class="container-fluid" style="background-color:#FAF8EE">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="background-color: #69bd8d; border-color: #69bd8d;" >
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#inverseNavbar1" style="border-color:#fff; background-color:#69bd8d; column-rule-color:#69bd8d;"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      
     <a class="navbar-brand" href="#" style="color:#fff; font-size:24px; text-align:center; margin-left:20px; margin-top:-3px" onClick="location='ORDER.html'"><span class="glyphicon glyphicon-credit-card" aria-hidden="true" style="margin-right:-10px">&nbsp;</span>주문으로...</a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="inverseNavbar1" align="center" style="background-color: #69BD8D; border-color: #FAF8EE; margin-top: -6px;">
      <ul class="nav navbar-nav navbar-right" style="border-color: #FAF8EE; color: #69bd8d; margin-bottom: 12px;">
      <div class="btn-group" role="group">
      <button type="button" class="alert-info" style="margin-right:5px">속도UP</button>
      <button type="button" class="alert-warning" style="margin-left:5px" onClick="location='SETTING.html'">설정하기</button>
     <!-- <button type="button" class="alert-success" style="margin-left:5px; background-color:#e9e4f0; border-color:#b9b5bf; color:#7129d3" onClick="location='ORDERED.html'">배송보기</button> -->
       </div>
      </ul>
</div>
<br>

<table width="100%">
  	<thead>
    	<tr>
            <th class="company" style="text-align:center" width="25%">회사<button class="btn" onclick="sortTD(0)" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px">▲</button><button class="btn" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px" onclick="reverseTD(0)">▼</button></th>
             <th  class="item" style="text-align:center" width="25%">아이템<button class="btn" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px" onclick="sortTD(1)">▲</button><button class="btn" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px"  onclick="reverseTD(1)">▼</button></th>
			 <th class="number" style="text-align:center" width="25%">수량<button class="btn" onclick="sortTD(2)" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px">▲</button><button class="btn" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px" onclick="reverseTD(2)">▼</button></th>
             <th class="delivery" style="text-align:center" width="25%">배송상태<button class="btn" onclick="sortTD(3)" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px">▲</button><button class="btn" style="background-color:#FAF8EE; font-size:10px; width:4px; padding-left:0px" onclick="reverseTD(3)">▼</button></th>
         </tr>
     </thead>
</table>
<div id ="Shopping_Cart" style="width:100%; height:500px; overflow:auto" align="center">

  <table id="cart" class="sortable" width="100%" border="0">
  <tbody>
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
				String sql = "Select id,name,stock_count,price from item";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ids = rs.getInt("id");
					name = rs.getString("name");
					stock_count = rs.getString("stock_count");
					//price = rs.getString("price");
					DB_id[p] = ids;
					DB_name[p] = name;
					DB_stock_count[p] = stock_count;
					//DB_price[p] = price;
					p++;
			%>
      <tr style="text-align:center">              
        <td width="25%"><%=ids %></td>
        <td width="25%"><%=name %></td>
        <td width="25%">삼성</td>
        <td width="25%">배송중</td>
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
    
    <br>
    <!------- ------->
    
  </div>
  <!-- /.container-fluid -->
</nav>


<script type="text/javascript">
var myTable = document.getElementById( "cart" ); 
var replace = replacement( myTable ); 
function sortTD( index ){    replace.ascending( index );    } 
function reverseTD( index ){    replace.descending( index );    } 
</script>
<footer class="footer" id="footer" align="right" style="color:#8ba0e8; margin-right:10px">Three J Two K company</footer>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>

</body>
</html>