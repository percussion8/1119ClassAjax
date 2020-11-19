<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스페이지</title>
<style type="text/css">
	Table.GridOne{
		padding : 3px;
		margin : 0;
		background : lightyellow;
		border-collapse : collapse;
		width : 35%;
	}
	Table.GridOne Td{
		padding : 2px;
		border : 1px solid #ff9900;
		border-collapse : collapse;
	}
</style>
<script>
	function madeAjaxCall() {
		$.ajax({
			type: "post",
			url: "/a",
			cache:false,
			data:"first=" + $("#first").val() + "&last=" + $("#last").val() + "&email=" + $("#email").val(),
			success : function(response) {
				console.log("여기는 성공했어요");
				console.log("여기는 response : " + response);
				$("#result").html("");
				var obj = JSON.parse(JSON.stringify(response));
				$("#result").html("first name = "+ obj.first + "<br>last name = " + obj.last
						+"<br>email = " + obj.email)
			},
			error : function() {
				alert("request중 error 발생함.")
			}
		});
	}
</script>
</head>
<body>
	<form action="" name="employeeform" method="post">
		<table cellpadding="0" cellspacing="0" border="1" class="GridOne">
			<tr>
				<td>First Name</td>
				<td><input type="text" name="first" id="first" value=""></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="last" id="last" value=""></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" id="email" value=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="Ajax Submit"
					onclick="madeAjaxCall()"></td>
			</tr>
		</table>
	</form>
	<h1>스프링 프레임워크 제이쿼리 에이젝스 데모</h1>
	<div id="result"></div>
</body>
</html>