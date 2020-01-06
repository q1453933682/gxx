<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>心灵旅游</title>
<!-- 
Journey Template 
http://www.templatemo.com/tm-511-journey
-->
    <!-- load stylesheets -->
    <link rel="shortcut icon" href="img/logo.png">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">                <!-- Font Awesome -->
    <link rel="stylesheet" href="css/bootstrap.min.css">                                      <!-- Bootstrap style -->
    <link rel="stylesheet" type="text/css" href="css/datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" href="css/templatemo-style.css">                                   <!-- Templatemo style -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
	    #allmap {
	    width: 650px;
	    height: 500px;
	    overflow: hidden;
	    margin:0;
	    font-family:"微软雅黑";
	    float:left;
	    margin-left:100px;
	    margin-top:50px;
	    }
	</style>
	<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=WVIhE7rPBebweIBoB4eFPkGceqC4kjgR"></script>
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
                            <a class="navbar-brand mr-auto" href="#">
                                <img src="img/logo.png" alt="Site logo">
                                心灵旅行
                            </a>
                            <button type="button" id="nav-toggle" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#mainNav" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div id="mainNav" class="collapse navbar-collapse tm-bg-white">
                                <ul class="navbar-nav ml-auto">
                                  <li class="nav-item">
                                    <a class="nav-link active" href="#top">首页 <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#tm-section-2">热门景点</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#tm-section-3">推荐目的地</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#tm-section-4">联系我们</a>
                                </li>
						        	<%
									      if( request.getSession().getAttribute( "uname")== null){
									%>
									     <li class="nav-item"><a class="nav-link" href="javascript:void(0)" onclick="login()">登录/注册</a></li>
									     
										 
									<%  
									      }else{
									    	  String uname=request.getSession().getAttribute("uname")+"";
									    	  
									%>
									      <li class="nav-item">
									        <a class="nav-link" href="javascript:void(0)" onclick="openuser()">
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

        <div class="tm-page-wrap mx-auto">
            <section class="tm-banner">
                <div class="tm-container-outer tm-banner-bg">
                    <div class="container">

                        <div class="row tm-banner-row tm-banner-row-header">
                            <div class="col-xs-12">
                                <div class="tm-banner-header">
                                    <h1 class="text-uppercase tm-banner-title">开始吧</h1>
                                    <img src="img/dots-3.png" alt="Dots">
                                    <p class="tm-banner-subtitle">让我们来帮你选择最好的目的地</p>
                                    <a href="javascript:void(0)" class="tm-down-arrow-link"><i class="fa fa-2x fa-angle-down tm-down-arrow"></i></a>       
                                </div>    
                            </div>  <!-- col-xs-12 -->                      
                        </div> <!-- row -->
                        <div class="row tm-banner-row" id="tm-section-search">

                            <form action="index.html" method="get" class="tm-search-form tm-section-pad-2">
                                <div class="form-row tm-search-form-row">                                
                                    <div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
                                        <label for="inputCity">选择你的目的地</label>
                                        <input name="destination" type="text" class="form-control" id="inputCity" placeholder="输入您的目的地...">
                                    </div>
                                    <div class="form-group tm-form-group tm-form-group-1">                                    
                                        <div class="form-group tm-form-group tm-form-group-pad tm-form-group-2">
                                            <label for="inputRoom">&nbsp;&nbsp;&nbsp;&nbsp;房间数量</label>
                                            <div name="room" class="form-control tm-select" id="inputRoom">
                                                <input type="text" style="width:70%;height:50%">个房间
                                            </div>                                        
                                        </div>
                                        <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">                                       
                                            <label for="inputAdult">&nbsp;&nbsp;&nbsp;&nbsp;成年人</label>     
                                            <div name="adult" class="form-control tm-select" id="inputAdult">
                                                <input type="text" style="width:70%;height:50%" style="margin-left:0px">人
                                            </div>                                        
                                        </div>
                                        <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">

                                            <label for="inputChildren">&nbsp;&nbsp;&nbsp;&nbsp;儿童</label>                                            
                                            <div name="children" class="form-control tm-select" id="inputChildren">
                                                <input type="text" style="width:70%;height:50%" style="margin-left:0px">人
                                            </div>                                        
                                        </div>
                                    </div>
                                </div> <!-- form-row -->
                                <div class="form-row tm-search-form-row">

                                    <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
                                        <label for="inputCheckIn">出发日期</label>
                                        <input name="check-in" type="text" class="form-control" id="inputCheckIn" placeholder="出发">
                                    </div>
                                    <div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
                                        <label for="inputCheckOut">返程日期</label>
                                        <input name="check-out" type="text" class="form-control" id="inputCheckOut" placeholder="返程">
                                    </div>
                                    <div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
                                        <label for="btnSubmit">&nbsp;</label>
                                        <button type="submit" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="btnSubmit">检查计划可行性</button>
                                    </div>
                                </div>                              
                            </form>                             

                        </div> <!-- row -->
                        <div class="tm-banner-overlay"></div>
                    </div>  <!-- .container -->                   
                </div>     <!-- .tm-container-outer -->                 
            </section>

            <section class="p-5 tm-container-outer tm-bg-gray">            
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 mx-auto tm-about-text-wrap text-center">                        
                            <h2 class="text-uppercase mb-4">你的 <strong>旅程</strong> 是我们首要的任务</h2>
                            <p class="mb-4">我们会为你安排最适合你的计划，如果你选择价格低廉的计划，我们建议你去非洲，如果你选择性价比高的旅游计划，我们建议你选择本国风景区，如果你想要不花钱的旅游，我们建议你做梦.</p>
                            <a href="#tm-section-2" class="text-uppercase btn-primary tm-btn">继续浏览</a>                              
                        </div>
                    </div>
                </div>            
            </section>
            
            <div class="tm-container-outer" id="tm-section-2">
                <section class="tm-slideshow-section">
                    <div class="tm-slideshow">
                        <img src="img/o1.png" alt="Image">
                        <img src="img/o2.png" alt="Image">
                        <img src="img/o3.png" alt="Image"> 
                        <img src="img/o4.png" alt="Image">
                        <img src="img/o5.png" alt="Image">    
                    </div>
                    <div class="tm-slideshow-description tm-bg-primary">
                        <h2 class="">欧洲最多人参观的景点</h2>
                        <p>作为欧洲之旅的重要一站，巴黎常年吸引着来自世界各地的游客。不止是众多经典景点，城市到处弥漫着艺术气息，塞纳河畔的博物馆陈列着历史名作，既是文艺爱好者的朝圣地，同为“时尚之都”和“美食之都”，从买手店到米其林星级餐厅，巴黎也是值得深度体验的完美目的地。</p>
                    </div>
                </section>
                <section class="clearfix tm-slideshow-section tm-slideshow-section-reverse">

                    <div class="tm-right tm-slideshow tm-slideshow-highlight">
                        <img src="img/y1.png" alt="Image">
                        <img src="img/y2.png" alt="Image">
                        <img src="img/y3.png" alt="Image"> 
                        <img src="img/y4.png" alt="Image">
                        <img src="img/y5.png" alt="Image">
                        <img src="img/y6.png" alt="Image"> 
                    </div> 

                    <div class="tm-slideshow-description tm-slideshow-description-left tm-bg-highlight">
                        <h2 class="">亚洲最多人参观的景点</h2>
                        <p>要说到亚洲，让人们首先想到的就是北京了，北京拥有三千多年的历史，有许许多多的著名景点，例如故宫、万里长城，等等都是一些不可错过的景点。在亚洲还有很多值得一去的地方，比如柬埔寨、泰国。在泰国有著名的人妖表演，还有许多古建筑物，带你领略古人的智慧！</p>
                    </div>                        

                </section>
                <section class="tm-slideshow-section">
                    <div class="tm-slideshow">
                        <img src="img/m1.png" alt="Image">
                        <img src="img/m2.png" alt="Image">
                        <img src="img/m3.png" alt="Image"> 
                        <img src="img/m4.png" alt="Image">
                        <img src="img/m5.png" alt="Image">
                        <img src="img/m6.png" alt="Image"> 
                    </div>
                    <div class="tm-slideshow-description tm-bg-primary">
                        <h2 class="">美洲最多人参观的景点</h2>
                        <p>中美洲国家有哪些呢？中美洲，指美洲大陆中部地区，区域为美国以南、巴拿马运河以北，东临加勒比海，西濒太平洋，是连接南美洲、北美洲的狭长陆地。而对于中美洲国家，主要有八个国家，分别是：巴拿马、墨西哥、尼加拉瓜、伯利兹、洪都拉斯、危地马拉、哥斯达黎加、萨尔瓦多。</p>
                    </div>
                </section>
            </div>        
            <div class="tm-container-outer" id="tm-section-3">
                <ul class="nav nav-pills tm-tabs-links">
                    <li class="tm-tab-link-li">
                        <a href="#1a" data-toggle="tab" class="tm-tab-link active" onclick="showpath(4)">
                            <img src="img/north-america.png" alt="Image" class="img-fluid">
                            北美
                        </a>
                    </li>
                    <li class="tm-tab-link-li">
                        <a href="#2a" data-toggle="tab" class="tm-tab-link" onclick="showpath(5)">
                            <img src="img/south-america.png" alt="Image" class="img-fluid">
                            南美
                        </a>
                    </li>
                    <li class="tm-tab-link-li">
                        <a href="#3a" data-toggle="tab" class="tm-tab-link" onclick="showpath(2)">
                            <img src="img/europe.png" alt="Image" class="img-fluid">
                            欧洲
                        </a>
                    </li>
                    <li class="tm-tab-link-li">
                        <a href="#4a" data-toggle="tab" class="tm-tab-link" onclick="showpath(1)"><!-- Current Active Tab -->
                            <img src="img/asia.png" alt="Image" class="img-fluid">
                            亚洲
                        </a>
                    </li>
                    <li class="tm-tab-link-li">
                        <a href="#5a" data-toggle="tab" class="tm-tab-link" onclick="showpath(6)">
                            <img src="img/africa.png" alt="Image" class="img-fluid">
                            非洲
                        </a>
                    </li>
                    <li class="tm-tab-link-li">
                        <a href="#6a" data-toggle="tab" class="tm-tab-link" onclick="showpath(3)">
                            <img src="img/australia.png" alt="Image" class="img-fluid">
                            澳洲
                        </a>
                    </li>
                    <li class="tm-tab-link-li">
                        <a href="#7a" data-toggle="tab" class="tm-tab-link" onclick="showpath(7)">
                            <img src="img/antartica.png" alt="Image" class="img-fluid">
                            南极
                        </a>
                    </li>
                </ul>
                <div class="tab-content clearfix">
                	
                    <!-- Tab 1 -->
                    <div class="tab-pane fade show active" id="1a">
                    </div> <!-- tab-pane -->
                    
                    <!-- Tab 2 -->
                    <div class="tab-pane fade" id="2a">
                    </div> <!-- tab-pane -->          
                    
                    <!-- Tab 3 -->     
                    <div class="tab-pane fade" id="3a">
                    </div> <!-- tab-pane -->
                    
                    <!-- Tab 4 -->
                    <div class="tab-pane fade" id="4a">
                    </div> <!-- tab-pane -->
                    
                    <!-- Tab 5 -->
                    <div class="tab-pane fade" id="5a">
                    </div> <!-- tab-pane -->   
                    
                    <!-- Tab 6 -->            
                    <div class="tab-pane fade" id="6a">
                    </div> <!-- tab-pane -->
                    
                    <!-- Tab 7 -->
                    <div class="tab-pane fade" id="7a">
                    </div> <!-- tab-pane -->
                </div>
            </div>

            <div class="tm-container-outer tm-position-relative" id="tm-section-4">
                <div id="google-map">
                <div id="allmap"></div>
            
            <script type="text/javascript">
				// 百度地图API功能
				var map = new BMap.Map("allmap");    // 创建Map实例
				map.centerAndZoom(new BMap.Point(112.51122,26.91583), 16);  // 初始化地图,设置中心点坐标和地图级别
				//添加地图类型控件
				map.addControl(new BMap.MapTypeControl({
					mapTypes:[
			            BMAP_NORMAL_MAP,
			            BMAP_HYBRID_MAP
			        ]})); 
				map.setCurrentCity("衡阳");          // 设置地图显示的城市 此项是必须设置的
				map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
			</script>
                </div>
                
                <form action="index.html" method="post" class="tm-contact-form">
                    <div class="form-group tm-name-container">
                        <input type="text" id="contact_name" name="contact_name" class="form-control" placeholder="名字"  required/>
                    </div>
                    <div class="form-group tm-email-container">
                        <input type="email" id="contact_email" name="contact_email" class="form-control" placeholder="邮箱地址"  required/>
                    </div>
                    <div class="form-group">
                        <input type="text" id="contact_subject" name="contact_subject" class="form-control" placeholder="地址"  required/>
                    </div>
                    <div class="form-group">
                        <textarea id="contact_message" name="contact_message" class="form-control" rows="9" placeholder="信息" required></textarea>
                    </div>
                    <button type="button" class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase" onclick="sendmess()">联系我们</button>
                </form>
            </div> <!-- .tm-container-outer -->

            <footer class="tm-container-outer">
                <p class="mb-0">Copyright © <span class="tm-current-year">2018</span> 心灵旅行 
                . Designed by <a rel="nofollow" href="http://www.google.com/+templatemo" target="_parent">杨嘉豪&辜鑫鑫</a></p>
            </footer>
        </div>
    </div> <!-- .main-content -->

    <!-- load JS files -->
    <script src="js/jquery-3.4.1.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
    <script src="js/popper.min.js"></script>                    <!-- https://popper.js.org/ -->       
    <script src="js/bootstrap.min.js"></script>                 <!-- https://getbootstrap.com/ -->
    <script src="js/datepicker.min.js"></script>                <!-- https://github.com/qodesmith/datepicker -->
    <script src="js/jquery.singlePageNav.min.js"></script>      <!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
    <script src="slick/slick.min.js"></script>                  <!-- http://kenwheeler.github.io/slick/ -->
    <script src="js/jquery.scrollTo.min.js"></script>           <!-- https://github.com/flesler/jquery.scrollTo -->
    <script> 

        /* DOM is ready
        ------------------------------------------------*/
        $(function(){

            // Change top navbar on scroll
            $(window).on("scroll", function() {
                if($(window).scrollTop() > 100) {
                    $(".tm-top-bar").addClass("active");
                } else {                    
                 $(".tm-top-bar").removeClass("active");
                }
            });

            // Smooth scroll to search form
            $('.tm-down-arrow-link').click(function(){
                $.scrollTo('#tm-section-search', 300, {easing:'linear'});
            });

            // Date Picker in Search form
            var pickerCheckIn = datepicker('#inputCheckIn');
            var pickerCheckOut = datepicker('#inputCheckOut');

            // Update nav links on scroll
            $('#tm-top-bar').singlePageNav({
                currentClass:'active',
                offset: 60
            });

            // Close navbar after clicked
            $('.nav-link').click(function(){
                $('#mainNav').removeClass('show');
            });

            // Slick Carousel
            $('.tm-slideshow').slick({
                infinite: true,
                arrows: true,
                slidesToShow: 1,
                slidesToScroll: 1
            });

                                                   // Google Map                
            $('.tm-current-year').text(new Date().getFullYear());  // Update year in copyright           
        });
        
        function login(){
    		location.href="login.jsp";
    	}	
        
        	function sendmess(){
        		var pname=$("#contact_name").val();
    			var email=$("#contact_email").val();
    			var addr=$("#contact_subject").val();
    			var mess=$("#contact_message").val();
    			
    			if( pname==null || pname=="" || email==null || email=="" || addr==null || addr=="" || mess==null || mess==""){
    				alert("请完善您的信息");
    			}else{
    				$.post("messServlet",{
    					op:'sendmess',
    					pname:pname,
    					email:email,
    					addr:addr,
    					mess:mess
    				},function(data){
    					if( data>0 ){
    						alert("发送成功");
    					     }else{
    					    alert("网络异常");
    					   	 }
    				},"text");
    			}
        	}
        	function showpath(pid){
        		$.post("sightServlet",{
        			op:"showpath",
        			pid:pid
        		},function(data){
        			if(data.length>0){
        				var str='';
        				str+='<div class="tm-recommended-place-wrap">';
        				for(var i=0;i<data.length;i++){
        					str+='<div class="tm-recommended-place">';
        					str+='<img src="'+data[i].photo+'" alt="Image" class="img-fluid tm-recommended-img">';
        					str+='<div class="tm-recommended-description-box">';
        					str+='<h3 class="tm-recommended-title">'+data[i].sname+'</h3>';
        					str+='<p class="tm-text-highlight">'+data[i].sinfo+'</p><p class="tm-text-gray">.</p></div>';
        					str+='<a href="detail.jsp?sid='+data[i].sid+'" class="tm-recommended-price-box"><p class="tm-recommended-price">￥'+data[i].price+'</p>';
        					str+='<p class="tm-recommended-price-link">详细信息</p></a></div>';
        				}
        				if(pid==4){
        					str+='</div><a href="path.jsp?pid='+4+'&nowpage=1&start=0" class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">查看所有</a>';
        					$("#1a").html(str);
        				}else if(pid==5){
        					str+='</div><a href="path.jsp?pid='+5+'&nowpage=1&start=0" class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">查看所有</a>';
        					$("#2a").html(str);
        				}else if(pid==2){
        					str+='</div><a href="path.jsp?pid='+2+'&nowpage=1&start=0" class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">查看所有</a>';
        					$("#3a").html(str);
        				}else if(pid==1){
        					str+='</div><a href="path.jsp?pid='+1+'&nowpage=1&start=0" class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">查看所有</a>';
        					$("#4a").html(str);
        				}else if(pid==6){
        					str+='</div><a href="path.jsp?pid='+6+'&nowpage=1&start=0" class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">查看所有</a>';
        					$("#5a").html(str);
        				}else if(pid==3){
        					str+='</div><a href="path.jsp?pid='+3+'&nowpage=1&start=0" class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">查看所有</a>';
        					$("#6a").html(str);
        				}else if(pid==7){
        					str+='</div><a href="path.jsp?pid='+7+'&nowpage=1&start=0" class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">查看所有</a>';
        					$("#7a").html(str);
        				}
        			}else{
        				alert("该栏暂无数据");
        			}
        		},"json")
        	}
        	
        	showpath(4);
        	
        	function openuser(){
        		location.href="user.jsp";
        	}

    </script>             

</body>
</html>