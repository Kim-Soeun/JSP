 function crewNameCheck() {
        var existingCrews = document.getElementsByClassName('existingCrew');
        var crewName = document.getElementById('crewName');
        var warningMessageContainer = document.getElementById('warningMessageContainer');
		
		// 기존 경고 메시지 삭제
        warningMessageContainer.innerHTML = "";
        
		for (var i = 0; i < existingCrews.length; i++) {
            if (existingCrews[i].textContent === crewName.value) {
                var warningMessage = document.createElement('p');
                warningMessage.style.color = 'red';
                warningMessage.textContent = "이미 존재하는 크루명입니다.";
                warningMessageContainer.appendChild(warningMessage);
                return false;
            }
        }

        // 만약 여기까지 왔다면 중복되는 크루명이 없으므로 경고 메시지를 초기화
        return true; // 중복이 없으면 폼을 제출하도록 true 반환
    }