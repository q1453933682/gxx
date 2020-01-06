<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <link rel="shortcut icon" href="../img/logo.png">
    <meta charset="utf-8">
    <title>心灵旅游管理界面</title>
    <link rel="stylesheet" href="../css/back.css"> 
  </head>
  <body>
  <script src="../js/jquery-3.4.1.min.js"></script>
    <nav style="width:100%;height:80px;background:gray;">
        <ul id="nav">
            <li>
	            <img id="icon" src="../img/logo.png" style="width:80px;">
	            <h3 style="float:right;user-select:none">心灵旅游管理界面</h3>
            </li>
            <li class="n1" onclick="change(1),findAlluser()">用户管理</li>
            <li class="n1" onclick="change(2),showsight()">景点管理</li>
            <!-- 这里要改，没登录不能看到这个页面 -->
            <li style="float:right"><a href="javascript:void(0)" onclick="change(3)">${uname }的个人中心</a></li>
        </ul>
    </nav>
    <div class="main" id="main">
        <div id="firstpage"><h1 id="welcome">欢迎您！尊敬的管理员，${uname}</h1></div>
    </div>
    <!-- 用户管理 -->
    <div class="main" id="main1" style="display:none">
       <div id="users">
       </div>
    </div>
    <!-- 景点管理 -->
    <div id="inputnewprice" style="display:none"></div>
    <div class="main" id="main2" style="display:none">
       <div id="sights"></div>
       
    </div>
    <!-- 个人中心 -->
    <div class="main" id="main3" style="display:none">
       <ul id="personal">
           <li>
	            <p class="uname">${uname }</p>
	            <p class="uname"><input type="button" value="修改昵称" onclick="changepage('uname')" class="button"></p>
	            <p class="newuname" style="display:none"><input type="text" placeholder="请输入您的新昵称" class="input" id="newname"></p>
	            <p class="newuname" style="display:none"><input type="button" value="确认修改" onclick="changename()" class="button"></p>
           </li>
           <li>
                <p class="pwd"><input type="button" value="修改我的密码" onclick="changepage('pwd')" class="button"></p>
                <p class="newpwd" style="display:none"><input type="password" placeholder="请输入你的旧密码" class="input" id="oldpwd"></p>
                <p class="newpwd" style="display:none"><input type="password" placeholder="请输入你的新密码" class="input" id="newpwd"></p>
                <p class="newpwd" style="display:none"><input type="password" placeholder="请再次输入你的新密码" class="input" id="newpwd1"></p>
                <p class="newpwd" style="display:none"><input type="button" value="确认修改" onclick="changepwd()" class="button"></p>
           </li>
       </ul>
    </div>
    
    
    <script>
        function findAlluser(){
        	$.post("../userServlet",{
        		op:"findAlluser"
        	},function(data){
        		var str='<div class="userhead"><strong class="uname">用户名</strong><strong class="email">邮箱地址</strong><strong class="manage">是否为管理员</strong><strong class="forbid">封禁状态</strong></div>';
        		for(var i=0;i<data.length;i++){
        			if(i%2==0){
        				str+='<div class="user alone">';
        			}else{
        				str+='<div class="user double">';
        			}
        			if(data[i].status==1){
        				str+='<p class="uname">'+data[i].uname+'</p><strong class="email">'+data[i].email+'</strong><p class="manage">是</p><p class="forbid">管理员无法被封禁</p></div>';
        			}else if(data[i].status==0){
        				str+='<p class="uname">'+data[i].uname+'</p><strong class="email">'+data[i].email+'</strong><p class="manage">否</p><p class="forbid">未封禁/<a href="javascript:void(0)" onclick="changestatus('+data[i].uid+')" class="link" id="forbid'+data[i].uid+'">封禁</a></p></div>';
        			}else if(data[i].status==2){
        				str+='<p class="uname">'+data[i].uname+'</p><strong class="email">'+data[i].email+'</strong><p class="manage">否</p><p class="forbid">被封禁/<a href="javascript:void(0)" onclick="changestatus('+data[i].uid+')" class="link" id="forbid'+data[i].uid+'">解封</a></p></div>';
        			}
        		}
        		$("#users").html(str);
        	},"json");
        }
        function showsight(){
        	$.post("../sightServlet",{
        		op:"findAllsight"
        	},function(data){
        		var str='<div class="sighthead"><strong class="sightid">景点编号</strong><strong class="sightname">景点名</strong><strong class="addr">所属洲/国</strong><strong class="price">价格</strong><strong class="control">操作</strong></div>';
        		for(var i=0;i<data.length;i++){
        			if(i%2==0){
        				str+='<div class="sight alone">';
        			}else{
        				str+='<div class="sight double">';
        			}
        			str+='<p class="sightid">'+data[i].sid+'</p><strong class="sightname">'+data[i].sname+'</strong><p class="addr">'+data[i].pname+'-'+data[i].cname+'</p><p class="price">￥'+data[i].price+'</p><p class="control"><input type="button" value="修改价格" onclick="setprice('+data[i].sid+')" class="sightbutton"></p></div>';
        		}
        		str+='';
        		$("#sights").html(str);
        	},"json");
        }
        function changepage(str){
        	$("."+str).css("display","none");
        	$(".new"+str).css("display","block");
        	
        }
        function change(num){
        	for(var i=1;i<4;i++){
        		$("#main").css("display","none");
        		if(num==i){4+2
        			$("#main"+i).css("display","block");
        		}else{
        			$("#main"+i).css("display","none");
        		}
        		$(".uname").css("display","block");
            	$(".newuname").css("display","none");
            	$(".pwd").css("display","block");
            	$(".newpwd").css("display","none");
        	}
        }
        function changename(){
        	var newname=$("#newname").val();
        	if(newname==""||newname==null){
        		alert("请输入你想修改的昵称！")
        	}else{
        		$.post("../userServlet",{
        			op:"changename",
        			newname:newname
        		},function(data){
        			if(data>0){
        				alert("修改成功！");
        				location.reload();
        			}else{
        				alert("网络错误！")
        			}
        		},"text");
        	}
        }
        function changepwd(){
        	var oldpwd=$("#oldpwd").val();
        	var newpwd=$("#newpwd").val();
        	var newpwd1=$("#newpwd1").val();
        	if(oldpwd==""||oldpwd==null||newpwd==""||newpwd==null||newpwd1==""||newpwd1==null){
        		alert("输入框不可为空！");
        	}else{
        		if(newpwd!=newpwd1){
        			alert("两次输入的新密码不一致！");
        		}else{
        			$.post("../userServlet",{
        				op:"checkpwd",
        				oldpwd:oldpwd
        			},function(data){
        				if(data>0){
        					$.post("../userServlet",{
        						op:"changepwd",
        						newpwd:newpwd
        					},function(data){
        						if(data>0){
        							alert("密码修改成功，请重新登录！");
        							location.href="../login.jsp";
        						}else{
        							alert("网络错误！");
        						}
        					},"text");
        				}else{
        					alert("输入的原密码不正确！");
        				}
        			},"text");
        		}
        	}
        }
        function changestatus(num){
        	var uid=parseInt(num);
        	var forbid=$("#forbid"+num).html();
        	$.post("../userServlet",{
        		op:"changestatus",
        		uid:uid
        	},function(data){
        		if(data>0){
        			console.log(data);
        			console.log(forbid)
        			if($.trim("封禁") == $.trim(forbid)){
        				alert("成功封禁该账户！")
        				location.reload();
        				findAlluser();
        			}else if($.trim("解封") == $.trim(forbid)){
        				alert("已成功为该用户解封！")
        				location.reload();
        				findAlluser();
        			}
        		}else{
        			alert("网络错误！")
        		}
        	},"text")
        }
        function setprice(num){
        	//$("#inputnewprice").css("display","block");
        	$("#inputnewprice").show();
        	$("#inputnewprice").html('');
        	var str='<p>新价格：<input type="text" placeholder="请输入新的价格" id="newprice">';
            str+='<input type="button" value="确认修改" onclick="changeprice('+num+')" class="newpriceclick">';
            str+='<input type="button" value="取消" onclick="closethis()" class="newpriceclick"></p>';
            $("#inputnewprice").html(str);
        }
        
        function closethis(){
        	$("#inputnewprice").html("");
        	$("#inputnewprice").css("display","none");
        }
        
        function changeprice(num){
        	var newprice=$("#newprice").val();
        	if(newprice==""||newprice==null){
        		alert("输入框不能为空！");
        	}else{
        		newprice=parseInt($("#newprice").val());
        		if(newprice<=0){
        			alert("输入的价格有误！");
        		}else{
        			$.post("../sightServlet",{
        				op:"setprice",
        				newprice:newprice,
        				sid:num
        			},function(data){
        				if(data>0){
        					alert("修改成功！");
        					$("#newprice").html("");
        					$("#inputnewprice").css("display","none");
        				}else{
        					alert("网络错误！");
        				}
        			},"text")
        		}
        	}
        }
    </script>
  </body>
</html>