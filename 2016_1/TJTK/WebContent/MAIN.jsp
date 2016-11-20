<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0, webkit">
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
        
        ul,
        ol,
        li {
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
            width: 200px;
            padding: 0 6px;
            border: 1px solid #ccc;
            outline: none;
        }
		
		#STATICMENU { margin: 2.5pt; padding: 0pt;  position:absolute; right: 8%; top: 85%; height:30pt; width:23px;'}
    </style>

<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/calendar.js"></script>

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
      <a class="navbar-brand" href="#" style="color: #fff; font-size: 24px; text-align: center; margin-left: 20px;" onClick="location='MAIN.html'">전김강정조</a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="inverseNavbar1" align="center" style="background-color: #69BD8D; border-color: #FAF8EE; margin-top: -6px;">
      <ul class="nav navbar-nav navbar-right" style="border-color: #FAF8EE; color: #69bd8d; margin-bottom: 12px;">
      <div class="btn-group" role="group">
      <button type="button" class="alert-info" style="margin-right:5px">속도UP</button>
      <button type="button" class="alert-warning" style="margin-left:5px" onClick="location='SETTING.html'">설정하기</button>
      <button type="button" class="alert-success" style="margin-left:5px; background-color:#e9e4f0; border-color:#b9b5bf; color:#7129d3" onClick="location='ORDERED.html'">배송보기</button>
       </div>
      </ul>
</div><br>
    <div align="center">
    <button type="button" class="btn btn-primary" style="margin-bottom:5px; width:260px" onClick="location='ORDER.html'">주문 하기</button><br>
    <button type="button" class="btn btn-info" style="margin-bottom:5px; width:260px" onClick="location='ORDER_LIST.html'">왔던 주문</button><br>
    <button type="button" class="btn btn-warning" style="margin-bottom:15px; width:260px" onClick="location='INVENTORY.html'">내 정보들</button><br>
    </div>
<div class="wall" align="center">
  <div id="ca"></div>
    <script src="calendar.js"></script>
    <script>
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth()+1 ;
        var date = now.getDate();


        var data = [ ];

        // inline
        var $ca = $('#ca').calendar({
            // view: 'month',
            width: 260,
            height: 260,
            // startWeek: 0,
            // selectedRang: [new Date(), null],
            data: data,
            date: new Date(),
            onSelected: function(view, date, data) {
                console.log('view:' + view)
                console.log('date:' + date)
                console.log('data:' + (data || '无'));
				
            },
            viewChange: function(view, y, m) {
                console.log(view, y, m)

            }
        });

        // picker
        $('#dd').calendar({
            trigger: '#dt',
            // offset: [0, 1],
            zIndex: 999,
            data: data,
            onSelected: function(view, date, data) {
                console.log('event: onSelected')
				var btnupdate = document.createElement('button');
	    btnupdate.setAttribute('id', 'go_CAL_ORDER');
		btnupdate.serAttribute('onClick',location='CAL_ORDER.html');
            },
            onClose: function(view, date, data) {
                console.log('event: onClose')
                console.log('view:' + view)
                console.log('date:' + date)
                console.log('data:' + (data || '无'));
            }
        });
    </script>
    <script language="javascript"> </script>
</div>
    <!-- /.navbar-collapse -->
<form id="STATICMENU" style="background:none; z-index:2">
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

  </div>
  <!-- /.container-fluid -->
</nav>
<footer class="footer" id="footer" align="right" style="color:#8ba0e8; margin-right:10px">Three J Two K company</footer>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
  <!-- /.container-fluid -->