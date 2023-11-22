function confirm() {
	var confirmflag = confirm("회원탈퇴를 진행하시겠습니까?");

	if (confirmflag) {
		confirmflag = true;
		return true;
	} else {
		confirmflag = false;
		return false;
	}
}