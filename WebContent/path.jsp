<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>心灵旅游</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<link rel="shortcut icon" href="img/logo.png">
	<style type="text/css">
	    
	</style>
	<!-- 
Journey Template 
http://www.templatemo.com/tm-511-journey
-->
    <!-- load stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css">                                      <!-- Bootstrap style -->
    <link rel="stylesheet" type="text/css" href="css/datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" href="css/templatemo-style.css">                                   <!-- Templatemo style -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
      </head>

      <body>
        <div class="tm-main-content" id="top">   
            <div class="tm-top-bar" id="tm-top-bar">
                <div class="container">
                    <div class="row">
                        <nav class="navbar navbar-expand-lg narbar-light">
                            <a class="navbar-brand mr-auto" href="index.jsp">
                                <img src="img/logo.png" alt="Site logo">
                                 心灵旅行
                            </a> 
                            <button type="button" id="nav-toggle" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#mainNav" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div id="mainNav" class="collapse navbar-collapse tm-bg-white">
                                <ul class="navbar-nav ml-auto">
					        	<%
								      if( request.getSession().getAttribute( "uname")== null){
								%>
								     <li class="nav-item"><a class="nav-link" href="javascript:void(0)" onclick="login()">登录/注册</a></li>
								<%  
								      }else{
								    	  String uname=request.getSession().getAttribute("uname")+"";	
								    	  
								%>
								      <li class="nav-item">
								        <a class="nav-link" href="javascript:void(0)">
										欢迎您：<em><%=uname %></em>
										</a>
									  </li>
								<%
								      }
								%>
                            </ul>
                        </div>                            
                    </nav>
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- .tm-top-bar -->
        <div  class="tm-page-wrap mx-auto">
            <div class="tab-content clearfix">
                    <!-- Tab 1 -->
                    <div class="tab-pane fade show active" id="type">
                    </div> <!-- tab-pane -->
                     <div style="width:400px;height:50px;margin:0 auto;text-align:center">
                         <p>
                         <a href="javascript:void(0)" onclick="changepage(-1)">上一页</a>
                         <span id="nowpage">1</span>/<strong id="countpage">1</strong>
                         <a href="javascript:void(0)" onclick="changepage(1)">下一页</a>
                         </p>
                     </div>
            </div>        
        </div>
        <footer class="tm-container-outer">
            <p class="mb-0">Copyright © <span class="tm-current-year">2018</span> 心灵旅行     
            . Designed by <a rel="nofollow" href="http://www.google.com/+templatemo" target="_parent">杨嘉豪&辜鑫鑫</a></p>
        </footer>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script>
	       $(window).on("scroll", function() {
	           if($(window).scrollTop() > 100) {
	             $(".tm-top-bar").addClass("active");
	           } else {                    
	             $(".tm-top-bar").removeClass("active");
	           }
	       });
           
           var pid=parseInt(location.href.split("?")[1].split("&")[0].split("=")[1]);
           var nowpage=parseInt(location.href.split("?")[1].split("&")[1].split("=")[1]);
           var start=parseInt(location.href.split("?")[1].split("&")[2].split("=")[1]);
           
           $("#nowpage").html(nowpage);
           $.post("sightServlet",{
        	   op:"findAllPath",
        	   pid:pid,
        	   start:start
           },function(data){
        	   var str='';
				str+='<div class="tm-recommended-place-wrap" style="padding-top:50px;">';
				for(var i=0;i<data.length-1;i++){
					str+='<div class="tm-recommended-place">';
					str+='<img src="'+data[i].photo+'" alt="Image" class="img-fluid tm-recommended-img">';
					str+='<div class="tm-recommended-description-box">';
					str+='<h3 class="tm-recommended-title">'+data[i].sname+'</h3>';
					str+='<p class="tm-text-highlight">'+data[i].sinfo+'</p><p class="tm-text-gray">.</p></div>';
					str+='<a href="detail.jsp?sid='+data[i].sid+'" class="tm-recommended-price-box"><p class="tm-recommended-price">￥'+data[i].price+'</p>';
					str+='<p class="tm-recommended-price-link">详细信息</p></a></div>';
				}
				$("#type").html(str);
				$("#countpage").html(data[data.length-1].sid);
           },"json");
           
           function changepage(num){
        	   var start=parseInt(location.href.split("?")[1].split("&")[2].split("=")[1]);
        	   var pid=parseInt(location.href.split("?")[1].split("&")[0].split("=")[1]);
        	   var nowpage=parseInt($("#nowpage").html());
        	   var countpage=parseInt($("#countpage").html());
       		   if(nowpage+num>countpage){
       			   nowpage=countpage;
       		   }else if(nowpage+num<1){
       			   nowpage=1;
       		   }else{
       			   nowpage=nowpage+num;
       			   start=start+(5*num);
           		   location.href="path.jsp?pid="+pid+"&nowpage="+nowpage+"&start="+start;
       		   }
           }
           function login(){
       		location.href="login.jsp";
       	   }
        </script>
     </body>
 </html>