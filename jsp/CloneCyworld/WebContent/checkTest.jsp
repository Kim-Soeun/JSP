<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크박스 전체클릭/해제 예제</title>
</head>
<body>
	<input type="checkbox" id="selectAll" onclick="toggleCheckbox(selectAll)">
	<div>
		<input type="checkbox" name="check" value="1">
		<input type="checkbox" name="check" value="2">
		<input type="checkbox" name="check" value="3">
	</div>
	<script>
		function toggleCheckbox(selectAllCheckbox) {
			var checkboxes = document.querySelectorAll('input[name="check"]');

			checkboxes.forEach(function(checkbox) {
				checkbox.checked = selectAllCheckbox.checked;
			});
		}
	</script>
</body>
</html>