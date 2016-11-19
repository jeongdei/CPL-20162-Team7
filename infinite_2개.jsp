<%@page import="java.sql.*"%>
<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

#Shopping_Cart{
	overflow:scroll;
}.Loop{
	position:relative;
	overflow:scroll;
}


</style>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Untitled Document</title>
<!-- <link href="css/bootstrap.css" rel="stylesheet" type="text/css">-->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body style="background-color:#E69B9C; width:100%; height:100%">
<nav class="navbar navbar-inverse" style="border-color:#E69B9C">
  <div class="container-fluid" style="background-color:#E69B9C">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#inverseNavbar1" style="border-color:#ffffff"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
    <a class="navbar-brand" href="#" style="color:#FFFFFF; font-size:24px; text-align:center" onClick="location='MAIN.html'">���쇰�...</a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="inverseNavbar1" align="center">
      <ul class="nav navbar-nav navbar-right" style="border-color:#E69B9C">
      <div class="btn-group" role="group">
      <button type="button" class="alert-info" style="margin-right:5px">����UP</button>
      <button type="button" class="alert-warning" style="margin-left:5px" onClick="location='SETTING.html'">�ㅼ����湲�</button>
       </div>
      </ul>
    </div>

    <!-- /.navbar-collapse -->
    
     
  <!------- ---->
  
    <table align="center">
    <thead>
    	<tr>
            <th class="name" style="text-align:center">�대�<button class="btn" onclick="sortTD(0)" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px">��</button><button class="btn" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px" onclick="reverseTD(0)">��</button></th>
             <th  class="company" style="text-align:center">����<button class="btn" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px" onclick="sortTD(1)">��</button><button class="btn" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px"  onclick="reverseTD(1)">��</button></th>
			 <th class="number" style="text-align:center">媛���</th>
         </tr>
     </thead>
    </table>
    <div id ="Shopping_Cart" class="Loop js-loop" style="width:100%; height:320px; " align="center">
       
       
      <!------ TABLE SORTING javascript -- star -->    
      
  
  <div>Content for New div Tag Goes Here</div>
  <table id="cart" class="Loop js-loop">	
  <tbody>
     <tr>
      <td style="text-align:center">땅땅치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center"><button onclick="">+Box</button></td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">땡큐통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr> 
    <tr>
      <td style="text-align:center">교촌치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr><tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    <tr>
      <td style="text-align:center">교촌레드콤치킨</td>
      <td style="text-align:center">통큐</td>
      <td style="text-align:center"><input type="number" style="width:60px"></td>
      <td style="text-align:center">+Box</td>
    </tr>
    
    
  </tbody>
</table>
  </div>
  
      <div>Content for New div Tag Goes Here</div>
    <div align="center">Content for New div Tag Goes Here</div>
   
   <table align="center">
    <thead>
          <tr>
            <th class="name" style="text-align:center">이름
              <button class="btn" onclick="sortTD2(0)" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px">▲</button>
              <button class="btn" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px" onclick="reverseTD2(0)">▼</button></th>
            <th  class="company" style="text-align:center">회사
              <button class="btn" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px" onclick="sortTD2(1)">▲</button>
              <button class="btn" style="background-color:#E69B9C; font-size:10px; width:4px; padding-left:0px"  onclick="reverseTD2(1)">▼</button></th>
            <th class="number" style="text-align:center">갯수</th>
          </tr>
        </thead>
   </table>
    <div id ="Shopping_Cart2" class="Loop js-loop2" style="width:100%; height:320px;" align="center">
     
      <table id="cart2" class="sortable" width="100%" border="0">
       
        <tbody>
           <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
        <tr>
          <td style="text-align:center">치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
         <tr>
          <td style="text-align:center">교촌치킨</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>
         <tr>
          <td style="text-align:center">레드콤보</td>
          <td style="text-align:center">통큐</td>
          <td style="text-align:center"><input type="number" style="width:60px"></td>
        </tr>

        
        </tr>
        </tbody>
      </table>
    </div>
<br>
    
  </div>
  <!-- /.container-fluid -->
</nav>

<script type="text/javascript">
      
      var doc = window.document,
      context = doc.getElementsByClassName('js-loop')[0],
      clones = context.getElementsByClassName('is-clone'),
      disableScroll,
      scrollHeight,
      scrollPos,
      clonesHeight,
      i;
      
      function getScrollPos() {

      	  return (context.pageYOffset || context.scrollTop) - (context.clientTop || 0);
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
      	      // Scroll to the top when you��ve reached the bottom
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
      	    window.setTimeout(function () {
      	      disableScroll = false;
      	    }, 40);
      	  }
      	  
      	  
      	}
      	
      	var doc = window.document,
        context2 = doc.getElementsByClassName('js-loop2')[0],
        clones2 = context2.getElementsByClassName('is-clone2'),
        disableScroll2,
        scrollHeight2,
        scrollPos2,
        clonesHeight2,
        i;
      	function getScrollPos2() {

        	  return (context2.pageYOffset || context2.scrollTop) - (context2.clientTop || 0);
        	}

        	function setScrollPos2(pos) {
        	  context2.scrollTop = pos;
        	}

        	function getClonesHeight2() {
        	  clonesHeight2 = 0;
        	  i = 0;
        	  for (i; i < clones2.length; i += 1) {
        	    clonesHeight2 = clonesHeight2 + clones2[i].offsetHeight;
        	  }

        	  return clonesHeight2;
        	}

        	function reCalc2() {
        	  scrollPos2 = getScrollPos2();
        	  scrollHeight2 = context2.scrollHeight;
        	  clonesHeight2 = getClonesHeight2();

        	  if (scrollPos2 <= 0) {
        	    setScrollPos2(1); // Scroll 1 pixel to allow upwards scrolling
        	  }
        	}

        	// Calculate variables
        	window.requestAnimationFrame(reCalc2);

        	function scrollUpdate2() {
        	  if (!disableScroll2) {
        	    scrollPos2 = getScrollPos2();
        	    
        	    if (clonesHeight2 + scrollPos2 >= scrollHeight2) {
        	      // Scroll to the top when you��ve reached the bottom
        	      setScrollPos2(1); // Scroll down 1 pixel to allow upwards scrolling
        	      disableScroll2 = true;
        	    } else if (scrollPos2 <= 0) {
        	      // Scroll to the bottom when you reach the top
        	      setScrollPos2(scrollHeight2 - clonesHeight2);
        	      disableScroll2 = true;
        	    }
        	  }

        	  if (disableScroll2) {
        	    // Disable scroll-jumping for a short time to avoid flickering
        	    window.setTimeout(function () {
        	      disableScroll2 = false;
        	    }, 40);
        	  }
        	  
        	  
        	}

      	context.addEventListener('scroll', function () {
      	  window.requestAnimationFrame(scrollUpdate);
      	}, false);

      	context.addEventListener('resize', function () {
      	  window.requestAnimationFrame(reCalc);
      	}, false);

      	// Just for the demo: Center the middle block on page load
      	context.onload = function () {
      	  setScrollPos(Math.round(clones[0].getBoundingClientRect().top + getScrollPos() - (window.innerHeight - clones[0].offsetHeight) / 2));
      	};
      	
      	context2.addEventListener('scroll', function () {
        	window.requestAnimationFrame(scrollUpdate2);
        }, false);

        context2.addEventListener('resize', function () {
           window.requestAnimationFrame(reCalc2);
        }, false);

        	// Just for the demo: Center the middle block on page load
        context2.onload = function () {
         setScrollPos2(Math.round(clones2[0].getBoundingClientRect().top + getScrollPos2() - (window.innerHeight - clones2[0].offsetHeight) / 2));
        };
        
        
      		var elem = document.getElementById("Shopping_Cart");
      		var elem2 = document.getElementById("Shopping_Cart2");
      		
      		if (elem.addEventListener){
      			//elem.addEventListener('onmousewheel', wheel, false);
      		elem.addEventListener('scroll',wheel,false);
      		}
      		if (elem2.addEventListener){
      			//elem.addEventListener('onmousewheel', wheel, false);
      		elem2.addEventListener('scroll',wheel,false);
      		}
      	
//      	if (window.addEventListener)
//      		window.addEventListener('onmousewheel', wheel2, false);
//      	window.onmousewheel = wheel2;
      		//elem.onmousewheel = wheel;
      	
      		function wheel(event) {

      		  var delta = 0;
      		  //alert(event.wheelDelta);
      		  if (event.wheelDelta){
      			  delta = event.wheelDelta / 50000;//50;//120; (���� 諛�袁멸린 )
      			  //alert(event.wheelDelta);
      		  } else if (event.detail){
      			  delta = -event.detail / 3;//3;
      			  //alert(event.detail);
      		  }

      		  handle(delta,event);

//      		  if(event.preventDefault)
//      			  event.preventDefault();
      		  event.returnValue = false;
      		}
      	
      		function handle(delta,event) {
      		
      			//��媛�
      	  		var time = 1000;

      			//div7������ ��移�
      	  		var distance = $("#Shopping_Cart").position();
      			
      			//$("#cart").
      			alert('2');
      	  		//var distance2 = $('#div20').position();
      	  		//嫄곕━ �쇰��� ��吏��쇱�
      	 	 	var dist = 100;
      	
      	  		 //alert($('#myDiv').scrollTop());
//      	  		 //alert(distance.top);
      			/* if($('#myDiv').scrollTop() < distance.top + 50 )
      			{
      				$('#myDiv').stop().animate({
      	  				//scrollTop : $('#div' +id).scrollTop() - (dist * delta)
      	  				scrollTop : $('#myDiv').scrollTop() - (dist * delta)
      	  	  		},10);
      				
      			} */
      			
      	  		 if( (distance.top < -1175) &&( distance.top > -1245)){	 
      	  			console.log(distance.top);
      	  			event.preventDefault();
      	  			
      	  			$('#Shopping_Cart').stop().animate({
      	  				//scrollTop : $('#div' +id).scrollTop() - (dist * delta)
      	  				scrollTop : $('#Shopping_Cart').scrollTop() -  distance.top - 1180//( distance.top - (dist * delta) ) // ( distance.top - 0.3 )//
      	  	  		},1000);
      	  		} 
//      	  		alert(distance2.top);
//      			if( $('#myDiv').scrollTop() < distance2.top + 150 && $('#myDiv').scrollTop() > distance2.top - 150){	 
//      		  		$('#myDiv').stop().animate({
//      		  			//scrollTop : $('#div' +id).scrollTop() - (dist * delta)
//      		  			scrollTop : $('#myDiv').scrollTop() - (dist * delta)
//      				},time);
//      		  	}
      		}

function sortingNumber( a , b ){  

        if ( typeof a == "number" && typeof b == "number" ) return a - b; 

        // 泥��⑥�� �쇳���� 怨듬갚臾몄��留� ������湲�.  
        var a = ( a + "" ).replace( /[,\s\xA0]+/g , "" ); 
        var b = ( b + "" ).replace( /[,\s\xA0]+/g , "" ); 

        var numA = parseFloat( a ) + ""; 
        var numB = parseFloat( b ) + ""; 

        if ( numA == "NaN" || numB == "NaN" || a != numA || b != numB ) return false; 

        return parseFloat( a ) - parseFloat( b ); 
} 


/* changeForSorting() : 臾몄���� 諛�袁멸린. */ 

function changeForSorting( first , second ){  

        // 臾몄���댁�� 蹂듭�щ낯 留��ㅺ린. 
        var a = first.toString().replace( /[\s\xA0]+/g , " " ); 
        var b = second.toString().replace( /[\s\xA0]+/g , " " ); 

        var change = { first : a, second : b }; 

        if ( a.search( /\d/ ) < 0 || b.search( /\d/ ) < 0 || a.length == 0 || b.length == 0 ) return change; 

        var regExp = /(\d),(\d)/g; // 泥��⑥�� �쇳��瑜� 李얘린 ���� ��洹���. 

        a = a.replace( regExp , "$1" + "$2" ); 
        b = b.replace( regExp , "$1" + "$2" ); 

        var unit = 0; 
        var aNb = a + " " + b; 
        var numbers = aNb.match( /\d+/g ); // 臾몄���댁�� �ㅼ�댁���� �レ�� 李얘린 

        for ( var x = 0; x < numbers.length; x++ ){ 

                var length = numbers[ x ].length; 
                if ( unit < length ) unit = length; 
        } 

        var addZero = function( string ){ // �レ���ㅼ�� �⑥�� 留�異�湲� 

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
                ascending : function( index ){ // �ㅻ�李⑥�� 
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
                descending : function( index ){ // �대┝李⑥��
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
        var clone = tag.cloneNode( true ); // ��洹몄�� 蹂듭�щ낯 留��ㅺ린. 
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

var myTable = document.getElementById( "cart" ); 
var myTable2 = document.getElementById( "cart2" ); 

//var replace = replacement( myTable ); 

function sortTD( index ){    replacement(myTable).ascending( index );    } 
function sortTD2( index ){    replacement(myTable2).ascending( index );    } 

function reverseTD( index ){    replacement(myTable).descending( index );    } 
function reverseTD2( index ){    replacement(myTable2).descending( index );    } 

</script>

</body>
</html>