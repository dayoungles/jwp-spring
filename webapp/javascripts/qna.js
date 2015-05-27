	window.addEventListener('load', function() {
		registerEvents();
	});

	function registerEvents() {
		var elWriteForm = document.querySelector('.answerWrite input[type=submit]');
		var elComments = document.querySelector('#comments');
		var btnDelete = document.querySelector('#delete');
		
		elWriteForm.addEventListener('click', writeAnswer, false);
		elComments.addEventListener('click', deleteAnswer, false);
		btnDelete.addEventListener('click', deleteQuestion, false);
		
	}
	
	function deleteQuestion(e){
		e.preventDefault();
		var url= e.target.getAttribute("url");
		console.log(url);
		var request = new XMLHttpRequest();
		request.open("DELETE", url, true);
		request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				var obj = JSON.parse(request.responseText);
				console.log(obj);
				if(obj.status ===true){
					alert("삭제되었습니다. 그런데 제가 자바스크립트로 새로고침을 못하겠네요. 알아서 돌아가세요.");
					 window.location.replace("localhost:8080");
				}else {
					alert(obj.errorMessage);
				}
			}					
		}
		request.send();
	}
	
	
	function deleteAnswer(e) {
		e.preventDefault();
		if (e.target.nodeName !== 'A') {
			return;
		}

		var ids = e.target.getAttribute("data-ids").split('_');
		var url = "/api/questions/" + ids[0] + "/answers/" + ids[1];

		var request = new XMLHttpRequest();
		request.open("DELETE", url, true);
		request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				var result = JSON.parse(request.responseText);
				if (result.status) {
					// delete current NODE.
					var elCurrent = e.target.parentElement.parentElement;
					elCurrent.parentNode.removeChild(elCurrent);
				}
			}
		}
		request.send();
	}

	function writeAnswer(e) {
		e.preventDefault();

		var answerForm = e.currentTarget.form;
		var url = "/api/questions/" + answerForm[0].value + "/answers";
		var params = "writer=" + answerForm[1].value + "&contents=" + answerForm[2].value;

		var request = new XMLHttpRequest();
		request.open("POST", url, true);
		request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				var jsonObj = JSON.parse(request.responseText);
				
				if(jsonObj.errorMessage!=""){
					alert("error! " + jsonObj.errorMessage);
				}
				location.reload(true)
			}
		}

		request.send(params);
	}

