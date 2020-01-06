<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <link rel="shortcut icon" href="img/logo.png">
    <meta charset="utf-8">
    <title>心灵旅游管理界面</title>
    <style>
        *{
            padding:0;
            margin:0 auto; 
        }
        nav{
            position:fixed;
        }
        #nav li{
            width:300px;
            height:80px;
            list-style:none;
            line-height:80px;
            text-align:center;
            float:left;
            margin-left:50px;
        }
        .n1{
            width:200px;
            height:80px;
            color:white;
            user-select:none;
        }
        .n1:hover{
            color:#69c6ba;
            background:lightgray; 
        }
        #nav li a{
            text-decoration:none;
            color:white;
        }
        #nav li a:hover{
            color:#69c6ba; 
        }
        .main{
            width:100%;
            height:1000px;
            background:white;
            padding-top:80px;
            margin:0 auto;
            text-align:center;
        }
        #welcome{
            width:500px;
            height:200px;
            text-align:center;
        }
        #users .userhead{
            width:80%;
            height:50px;
            background:white;
            border-bottom:solid 1px black;
        }
        #users .userhead strong{
            float:left;
            line-height:50px;
        }
        #users .userhead .destination{
            width:10%;
        }
        #users .userhead .goday{
            width:30%;
        }
        #users .userhead .backday{
            width:20%;
        }
        #users .userhead .room{
            width:10%;
        }
         #users .userhead .adult{
            width:10%;
        }
         #users .userhead .children{
            width:10%;
        }
        #users .userhead .price{
            width:5%;
        }
        #users .userhead .anniu{
            width:5%;
        }
        #users .user{
            width:80%;
            height:50px;
        }
        #users .user p,strong{
            float:left;
            line-height:50px;
        }
        #users .user .destination{
            width:10%;
        }
        #users .user .goday{
            width:30%;
        }
        #users .user .backday{
            width:20%;
        }
        #users .user .room{
            width:10%;
        }
        #users .user .adult{
            width:10%;
        }
        #users .user .children{
            width:10%;
        }
         #users .user .price{
            width:5%;
        }
        #users .user .anniu{
            width:5%;
        }
        #users .user .forbid p,a{
            line-height:50px;
        }
        .double{
            background:#56c8dc;
        }
        .alone{
            background:white;
        }
        #personal{
            width:80%;
        }
       .control{
            margin-top:50px;
       		width:30%;
            height:50px;
            font-size:20px;
        }
        .button{
            margin-top:50px;
            width:100px;
            height:50px;
            background:#69c6ba;
            color:white;
        }
        .button:hover{
            background:#c66995;
        }
    </style>
  </head>
  <body>
  <script src="js/jquery-3.4.1.min.js"></script>
    <nav style="width:100%;height:80px;background:gray;">
        <ul id="nav">
            <li>
	            <img id="icon" src="img/logo.png" style="width:80px;">
	            <h3 style="float:right;user-select:none">心灵旅行</h3>
            </li>
            <li class="n1" onclick="change(1)">个人管理</li>
            <li class="n1" onclick="change(2)">查看订单</li>
        </ul>
    </nav>
    <div class="main" id="main">
        <div><h1 id="welcome">欢迎您！${nuame}</h1></div>
    </div>
    <!-- 个人管理 -->
    <div class="main" id="main1" style="display:none">
    	<div id="personal">
    		<p><input name="pwd" type="text" class="control" id="newname" placeholder="修改昵称..."></p>
    	    <p><input type="button" style=" font-size:24px;width:20%" value="修改"  onclick="xiugai()" class="button"></p>
    		<p><input name="pwd" type="password" class="control" id="oldpwd" placeholder="请输入您的旧密码"></p>
    		<p><input name="newpwd" type="password" class="control" id="newpwd" placeholder="请输入您的新密码"></p>
    		<p><input name="newpwd" type="password" class="control" id="regpwd" placeholder="请确认您的新密码"></p>
    		<p><input type="button" style=" font-size:24px;width:20%" value="重置" onclick="reset()" class="button"></p>
    	</div>
    </div>
    <!-- 查看订单 -->
    <div class="main" id="main2" style="display:none">
    	<div id="users">
       </div>
    </div>    
    <script>
        function change(num){
        	for(var i=1;i<4;i++){
        		$("#main").css("display","none");
        		if(num==i){
        			$("#main"+i).css("display","block");
        		}else{
        			$("#main"+i).css("display","none");
        		}
        	}
        }
        
        $.post("reserveServlet",{
			op:'userInfo',
		},function(data){
			var str='<div class="userhead"><strong class="destination">目的地</strong><strong class="goday">出发日期</strong><strong class="backday">返回日期</strong><strong class="room">房间数量</strong><strong class="adult">成年人人数</strong><strong class="children">未成年人人数</strong><strong class="price">价格</strong></div>';
			for(var i=0;i<data.length;i++){
				 str+='<div class="user alone"><strong class="destination">'+data[i].sname+'</strong><p class="goday">'+data[i].goday+'</p><p class="backday">'+data[i].backday+'</p><p class="room">'+data[i].room+'</p><p class="adult">'+data[i].adult+'</p><p class="children">'+data[i].children+'</p><p class="price">'+data[i].price*(data[i].adult+0.5*data[i].children)+'</p></div><input type="button" class="anniu" value="删除" onclick="del('+data[i].did+')">';
			}
			$("#users").html(str);
		},"json")
		
		function reset(){
        	var oldpwd=$("#oldpwd").val();
			var newpwd=$("#newpwd").val();
			var regpwd=$("#regpwd").val();
			if(oldpwd==null || oldpwd=="" || newpwd==null || newpwd=="" || regpwd==null || regpwd==""){
				alert("对话框不能为空！");
			}else{ 
				if(newpwd!=regpwd){
					alert("两次密码输入不一致");
				}else{
					$.post("userServlet",{
						op:'checkpwd',
						oldpwd:oldpwd
					},function(data){
						if( data>0 ){
							     $.post("userServlet",{
							    	 op:"reset",
							    	 newpwd:newpwd
							     },function(data){
							    	 if(data>0){
							    		 alert("修改成功！,即将跳转至登录界面！")
							    		 location.href="login.jsp";
							    	 }else{
							    		 alert("网络错误！");
							    	 }
							     },"text");
						     }else{
						    	 alert("原密码不正确");
						   	 }
					},"text");
				}
			}
        }
        function del(did){
		    did=parseInt(did);
        	$.post("orderServlet",{
    			op:'del',
    			did:did
    			
    		},function(data){
    				if(data>0){
    					alert("删除成功");
    					location.href="user.jsp";
    				}else{
    					alert("删除失败");
    				}
    		},"text")
        }
        
        function xiugai(){
        	var newname=$("#newname").val();
        	if(newname==null || newname==""){
        		alert="对话框不能为空！";
        	}else{
        		$.post("userServlet",{
					op:'xiugai',
					newname:newname
				},function(data){
					if( data>0 ){
						 alert("修改成功！")
		    		     location.href="user.jsp";
			    	 }else{
			    		 alert("网络错误！");
			    	 }
			     },"text");
			}
        }
    </script>
  </body>
</html>