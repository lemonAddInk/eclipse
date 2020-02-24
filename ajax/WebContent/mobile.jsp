<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./jq/jquery.js"></script>
<script type="text/javascript">
/* 新增的注释 新增的内容*/
	// 原生js方法使用ajax
	/*
	function register() {
		var mobile = document.getElementById("phone").value
		xmlHttpRequest = new XMLHttpRequest();
		xmlHttpRequest.onreadystatechange = callBack
		
		// post 方式
		/*
		xmlHttpRequest.open("post","mobileServlet",true) //以post方式传输，第二个参数是传输地址
		//设置post方法头信息
		xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded")
		xmlHttpRequest.send("phone="+mobile) // 传送表单信息k=v形式
		// get方式
		xmlHttpRequest.open("get","mobileServlet?phone="+mobile,true)
		xmlHttpRequest.send(null) 
	}

	// 定义回调函数(接受服务端的返回值)
	function callBack() {
		if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
			// 接受服务端返回的数据
			var data = xmlHttpRequest.responseText;
			if (data == "true") {
				alert("注册成功")
			} else {
				alert("注册失败")
			}
		}
	}
	*/
	
	
	// jquery方式使用ajax
	function  register() {
		var mobile = document.getElementById("phone").value
		// $.ajax方式
	/* 	$.ajax({
			url:"mobileServlet",
			type:"post",
			data:"phone="+mobile,
			dataType:"json", // 预期返回值类型
			success: function (result, testStatus) {
				if (result === "true") {
					alert("注册成功")
				} else {
					alert("注册失败")
				}
			},
			error: function (xhr, errorMessage, e) {
				alert("服务器异常")
			}
		}) */
		
		// $.get方式
		/* $.get(
				"mobileServlet",
				"phone="+mobile,
				function (result, testStatus) {
					if (result === "true") {
						alert("注册成功")
					} else {
						alert("注册失败")
					}
				},
				"text" //预期返回值类型
		) */
		
		
		// $.post方式
/* 		$.post(
				"mobileServlet",
				"phone="+mobile,
				function (result, testStatus) { //result为servlet返回参数,testStatus代表执行函数为success还是error
					if (result === "true") {
						alert("注册成功")
					} else {
						alert("注册失败")
					}
				},	
				"text" //预期返回值类型
		) */
		
		
		// $.load方式
/* 		$("#Msg").load(
				"mobileServlet",
				"phone="+mobile
		) */
		
		
 		$.getJSON(
			"mobileServlet",
			{"phone":mobile}, // 传输参数类型要Json类型
			function (result, testStatus) { // 接收类型也是Json类型
				if (result.Msg === "true") {
					alert("注册成功")
				} else {
					alert("注册失败")
				}
			}	
		)  
	}
	
	function tt () {
		$.getJSON(
				"JsonServlet",
				{"name":"zs","age":12}, 
				function (result) { 

					//js 需要通过eval()函数将返回值转为一个js能够识别的json对象
					// 取单个对象的情况
				 // 	var stu = eval(result.stu)
				//	alert(stu.name+"-----"+stu.age)
					
					// 取多个对象时(把整个result对象取出来再进行循环遍历取值)
					var stus = eval(result)
					$.each(stus, function (i, ele) { // ele等于this
						//alert(ele.name+"-----"+ele.age
								alert(this.name+"-----"+this.age)
					})
				}
		)
		
		
	}
	

</script>
</head>
<body>
	<input type="tel" id="phone"/>
	<button class="btn" onclick="register()">注册</button>
	<button class="btn" onclick="tt()">测试JSON</button>
	<span id="Msg"></span>
</body>
</html>
