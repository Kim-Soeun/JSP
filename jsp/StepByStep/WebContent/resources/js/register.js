function email_check() {
	if(document.frm.emailList.options[document.frm.emailList.selectedIndex].value == '0') {
		document.frm.email2.disabled = true;
		document.frm.email2.value = "";
	} 
	if (document.frm.emailList.options[document.frm.emailList.selectedIndex].id == "write") {
		document.frm.email2.disabled = false;
		document.frm.email2.value = "";
		document.frm.email2.focus();
	} else {
		document.frm.email2.disabled = true;
		document.frm.email2.value = document.frm.emailList.options[document.frm.emailList.selectedIndex].value;
	}
}