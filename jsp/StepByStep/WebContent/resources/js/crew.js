 var result = false;
 function crewNameCheck() {
        var existingCrews = document.getElementById('existingCrews').innerHTML;
		var existingCrew = existingCrews.split(' ');
        var crewName = document.getElementById('crewName').value;
        var warningMessageContainer = document.getElementById('warningMessageContainer');
		
		// 기존 경고 메시지 삭제
        warningMessageContainer.innerHTML = "";
 
        
        
		for (var i = 0; i < existingCrew.length-1; i++) {
            if (existingCrew[i] == crewName) {
                var warningMessage = document.createElement('p');
                warningMessage.style.color = 'red';
                warningMessage.textContent = "이미 존재하는 크루명입니다.";
                warningMessageContainer.appendChild(warningMessage);
                result = false;
				return;
				
		}
    }

       result = true; 
}
function isResult(){
	return result;
}