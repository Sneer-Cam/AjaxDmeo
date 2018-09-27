<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		//定义一个ajax对象
		var xmlHttpReq;
		
		function createAjax(){
			if(window.XMLHttpRequest){
				//非IE浏览器的Ajax对象的创建方式
				xmlHttpReq = new XMLHttpRequest();
			}else{
				//IE浏览器的Ajax对象的创建方式
				xmlHttpReq = new ActionXObject("Microsoft.XMLHTTP");
			}
		}
		
		function oncheck(){
			var uname = document.getElementById("iname").value;
			if(uname==""){
				alert("用户名不能为空！");
				return false;
			}
			//调用上面的函数创建出Ajax对象
			createAjax();
			//设置状态改变的回调函数
			xmlHttpReq.onreadystatechange = responsehandle;
			
			var url = "http://localhost:8080/AjaxDemo/testServlet?uname="+uname;
			
			//设置Ajax的请求相关参数
			xmlHttpReq.open("get", url, true);
			//发送Ajax请求
			xmlHttpReq.send(null);
			alert("oncheck");
		}
		
		function oncheckpost(){
			var uname = document.getElementById("iname").value;
			if(uname==""){
				alert("用户名不能为空！");
				return false;
			}
			//调用上面的函数创建出Ajax对象
			createAjax();
			//设置状态改变的回调函数
			xmlHttpReq.onreadystatechange = responsehandle;
			
			var url = "http://localhost:8080/AjaxDemo/testServlet";
			
			xmlHttpReq.open("post", url, true);
			xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttpReq.send("uname="+uname);
			alert("oncheck");
		}
		
		function responsehandle(){
			if(xmlHttpReq.readyState==4){
				if(xmlHttpReq.status==200){
					var res = xmlHttpReq.responseText;
					var result = document.getElementById("result");
					result.innerHTML="<font color=red>"+res+"</font>";
				}
			}
		}
	</script>
  </head>
  
  <body>
   	username:<input type="text" id="iname" name="uname" onblur="oncheckpost()" />
   	<span id="result"></span><br />
   	password:<input type="password" name="upwd" />
   	<input type="submit" value="Login" />
  </body>
</html>
