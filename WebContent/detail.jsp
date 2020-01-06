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
	#tm-section-search{
	    width:1500px;
	   	height:500px;
		position:fixed;
		top:300px;
		margin:0 auto;
		margin-left:325px;
		margin-top:-150px;
		}
		#close{
		width:50px;
		height:50px;
		line-height:50px;
		text-align:center;
		margin-left:755px;
		margin-top:-25px;
		user-select:none;
		}
		#close:hover{
		background:red;
		}
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
            <div class="tm-top-bar-bg"></div>    
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
        <div class="tm-page-wrap mx-auto" id="ss">
        </div>
        
        <div class="row tm-banner-row" id="tm-section-search">
            <form action="index.html" method="get" class="tm-search-form tm-section-pad-2">
                <div id="close" onclick="disshow()">❌</div>
                <div class="form-row tm-search-form-row">                                
                    
                    <div class="form-group tm-form-group tm-form-group-1">                                    
                        <div class="form-group tm-form-group tm-form-group-pad tm-form-group-2">
                            <label for="inputRoom1">&nbsp;&nbsp;&nbsp;&nbsp;房间数量</label>
                            <div name="room" class="form-control tm-select" id="inputRoom2">
                                <input type="text" style="width:70%;height:50%" id="inputRoom">个房间
                            </div>                                        
                        </div>
                        <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">                                       
                            <label for="inputAdult1">&nbsp;&nbsp;&nbsp;&nbsp;成年人</label>     
                            <div name="adult" class="form-control tm-select" id="inputAdult2">
                                <input type="text" style="width:70%;height:50%" style="margin-left:0px" id="inputAdult">人
                            </div>                                        
                        </div>
                        <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">

                            <label for="inputChildren1">&nbsp;&nbsp;&nbsp;&nbsp;儿童</label>                                            
                            <div name="children" class="form-control tm-select" id="inputChildren2">
                                <input type="text" style="width:70%;height:50%" style="margin-left:0px" id="inputChildren">人
                            </div>                                        
                        </div>
                    </div>
                </div> <!-- form-row -->
                <div class="form-row tm-search-form-row">

                    <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
                        <label for="inputCheckIn1">出发日期</label>
                        <input name="check-in" type="text" class="form-control" id="inputCheckIn" placeholder="出发">
                    </div>
                    <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
                        <label for="inputCheckOut1">返程日期</label>
                        <input name="check-out" type="text" class="form-control" id="inputCheckOut" placeholder="返程">
                    </div>
                   
                    <div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
                        <label for="btnSubmit">&nbsp;</label>
                        <button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="button" onclick="buy()">提交此方案</button>
                    </div>
                </div>                              
                
            </form>                             

        </div> <!-- row -->
        
        <footer class="tm-container-outer">
            <p class="mb-0">Copyright © <span class="tm-current-year">2018</span> 心灵旅行     
            . Designed by <a rel="nofollow" href="http://www.google.com/+templatemo" target="_parent">杨嘉豪&辜鑫鑫</a></p>
        </footer>
        
        
        <script src="js/jquery-3.4.1.min.js"></script>
        
        <script>
           $("#tm-section-search").css("display","none");
	       $(window).on("scroll", function() {
	           if($(window).scrollTop() > 100) {
	             $(".tm-top-bar").addClass("active");
	           } else {                    
	             $(".tm-top-bar").removeClass("active");
	           }
	       });
	       function login(){
       		location.href="login.jsp";
       	   }
	       
	       var sid=parseInt(location.href.split("?")[1].split("=")[1]);
	       
    		$.post("orderServlet",{
    			op:'findInfo',
    			sid:sid
    		},function(data){
    			var str='';
    			for(var i=0;i<data.length;i++){
    				 str+='<div id="title" style="text-align:center;"><a href=""></a><h1>'+data[i].sname+'</h1></div>';
    				 str+='<div id="image" style="margin:0 auto;text-align:center;width:800px;height:500px"><img src="'+data[i].photo+'" style="width:800px;height:500px"></div>';
    				 str+='<div id="detail" style="font-size:25px;margin:0 auto;width:800px;padding-bottom:100px">';
    				 str+='<p>'+data[i].sinfo+'</p>';
    				 str+='<p><span style="width:300px;background:#69c6ba;font-size:20px;color:white">门票价格'+data[i].price+'</span> <a href="javascript:void(0)" class="btn btn-default" onclick="show()">立即预定</a></p>';    				       
    			}
    			$("#ss").html(str);
    		},"json")
    		
    	function show(){
	   		$("#tm-section-search").css("display","block");
    	}
    		
    	function disshow(){
    		$("#tm-section-search").css("display","none");
    	}
    	
    	function buy(){
    		var goday=$("#inputCheckIn").val();
			var backday=$("#inputCheckOut").val();
			var room=parseInt($("#inputRoom").val());
			var adult=parseInt($("#inputAdult").val());
			var children=parseInt($("#inputChildren").val());
			var sid=parseInt(location.href.split("?")[1].split("=")[1]);
			
			if( goday==null || goday=="" || backday==null || backday=="" || room==0 || room=="" || adult==0 || adult=="" || children==0 || children==""){
				alert("请完善您的信息");
			}else{
				if(room<=0 || adult<=0 || children<=0){
					alert("信息输入有误");
				}else{
    				$.post("reserveServlet",{
    					op:'purchase',
    					goday:goday,
    					backday:backday,
    					room:room,
    					adult:adult,
    					children:children,
    					sid:sid
    				},function(data){
    					if( data>0 ){
    						alert("提交成功");
    						$("#inputCheckIn").val("");
        	    			$("#inputCheckOut").val("");
        	    			$("#inputRoom").val("");
        	    			$("#inputAdult").val("");
        	    			$("#inputChildren").val("");
    					     }else{
    					    alert("网络异常");
    					   	 }
    					
						colse('loginBox','registerBox');
    				},"text");
				}
			}
		}
        </script>
        </div>
     </body>
 </html>