<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
	.current:hover {
		color: yellow;
	}
	
	.today:hover {
		font-size: 24px;
		color: blue;
	}
	
	#r1 {
		font-size: 24px;
	}
</style>
</head>
<body>
	<div class="day current">
		<label for="r1">
			<input type="radio" id="r1" value="MON2">
				MON
		</label>
	</div>
	<div class="day current today">
		<label for="r2">
			<input type="radio" id="r2" value="ALL2">
				ALL
		</label>
	</div>
</body>
</html>