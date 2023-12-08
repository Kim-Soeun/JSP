function updateCount(th) {
	
	$.ajax({
		url: "RecommendServlet",
		type: "post",
		dataType: "json",
		data: {
			"no" : th.previousElementSibling.value,
		}
	});

	var count = parseInt(th.parentElement.getElementsByClassName('count').innerHTML);
	// th.parentElement : 반복문안에 현재 폼에서 버튼의 부모(위에 있는 div)
	count.innerHTML = count + 1;
	location.reload();
}
