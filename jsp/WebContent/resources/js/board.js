// 카테고리가 선택되어 있지 않으면 폼이 전송되지 않고 경고창이 뜨도록 설정
function categoryCheck() {
	if(document.frm.category.options[document.frm.category.selectedIndex].value === '') {
		alert("카테고리를 선택해주세요");
		return false;
	}
	if(document.frm.category.options[document.frm.category.selectedIndex].id === "choice") {
		alert("카테고리를 선택해주세요");
		return false;
	}
	 return true;
}