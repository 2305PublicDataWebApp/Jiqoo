<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Notification message</title>
	</head>
	<body>
		<script>
			const msg = '${ msg }';
			alert(msg);
			
			const url = '${url}';
			location.href = url;
		</script>	
	</body>
</html>