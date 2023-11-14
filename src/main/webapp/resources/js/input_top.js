/*<!-- 주소 검색창 시작 -->*/
function sample6_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   addr = data.jibunAddress;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode').value = data.zonecode;
               document.getElementById("sample6_address").value = addr;
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("sample6_detailAddress").focus();
           },
           theme: {
               searchBgColor: "#0B65C8", //검색창 배경색
               queryTextColor: "#FFFFFF" //검색창 글자색
           }
       }).open();
   }
/*<!-- 주소 검색창 종료 -->*/

/*<!-- 닉네임 중복 확인 시작-->*/
$(document).ready(function() {
    // 닉네임 입력 필드의 "input" 이벤트 핸들러 추가
    $("#nickNameInput").on("input", function() {
        var nickNameToCheck = $(this).val();
        var resultMessage = $("#nickName_resultMessage"); 
        
        if (nickNameToCheck.length >= 3) {
        // 중복 확인 실행 코드
        $.ajax({
            type: "POST",
            url: "member/overlapped_nickName",
            data: { nickName: nickNameToCheck },
            dataType: "text",
            success: function(response) {
                resultMessage.text(response);
                if (response.includes("중복")) {
                    resultMessage.css("color", "red");
                } else {
                    resultMessage.css("color", "blue");
                }
            },
            error: function(error) {
                console.error("오류 발생: " + JSON.stringify(error));
            }
        });
        } else {
            resultMessage.text("3글자 이상 입력해주세요.");
            resultMessage.css("color", "red");
        }
    });
});
/*<!-- 닉네임 중복 확인 종료-->*/
/*<!-- 사업자 등록번호 중복 확인 시작-->*/
$(document).ready(function() {
    // 닉네임 입력 필드의 "input" 이벤트 핸들러 추가
    $("#businessNOInput").on("input", function() {
        var businessNOToCheck = $(this).val();
        var resultMessage = $("#businessNO_resultMessage"); 
        console.log("businessNOToCheck :", businessNOToCheck);
        
          // 입력값이 숫자인지 확인하는 정규식
        var numberPattern = /^[0-9]*$/;
        
         if (numberPattern.test(businessNOToCheck) && businessNOToCheck.length === 10) {
        // 중복 확인 실행 코드
        $.ajax({
            type: "POST",
            url: "member/overlapped_businessNO",
            data: { businessNO: businessNOToCheck },
            dataType: "text",
            success: function(response) {
                resultMessage.text(response);
                if (response.includes("이미")) {
                    resultMessage.css("color", "red");
                } else {
                    resultMessage.css("color", "blue");
                }
            },
            error: function(error) {
                console.error("오류 발생: " + JSON.stringify(error));
            }
        });
        } else {
            resultMessage.text("사업자 등록번호는 10자의 숫자여야 합니다");
            resultMessage.css("color", "red");
        }
    });
});
/*<!-- 사업자 등록번호 중복 확인 종료-->*/


/*<!-- 패스워드1,2 입력 안하면 확인 안함. 입력하면 시작-->*/
$(document).ready(function() {
    // 비밀번호 입력 필드와 비밀번호 확인 입력 필드를 선택합니다.
    var passwordField = $("input[name='password']");
    var passwordConfirmField = $("input[name='password2']");
    var passwordMismatchMessage1 = $("#passwordMismatchMessage1");
    var passwordMismatchMessage2 = $("#passwordMismatchMessage2");
    var letter = /[a-zA-Z]/;
    var number = /[0-9]/;
    var special = /[!@#$%^&*()_+]/;
    
    // 비밀번호 입력 필드에서 입력이 발생할 때 비밀번호 일치 여부를 확인합니다.
    passwordField.on("input", function() {
        var password = passwordField.val();

        // 비밀번호와 비밀번호 확인이 같은지 확인하고 메시지를 업데이트합니다.
        if (password.length < 8) {
        	passwordMismatchMessage1.text("비밀번호가 너무 짧습니다.");
            passwordMismatchMessage1.css("color", "red");
        }
        else if(!letter.test(password) || !number.test(password) || !special.test(password)) {
            passwordMismatchMessage1.text("비밀번호는 영문자, 숫자, 특수문자를 모두 포함해야 합니다.");
            passwordMismatchMessage1.css("color", "red");
        }
        else{
        	passwordMismatchMessage1.text("잘 입력했습니다. 패스워드 확인 입력해주세요");
            passwordMismatchMessage1.css("color", "blue");
        }
    });
    passwordConfirmField.on("input", function() {
        var password = passwordField.val();
        var confirmPassword = passwordConfirmField.val();
        
        if (password === confirmPassword) {
        	passwordMismatchMessage2.text("비밀번호가 일치합니다.");
            passwordMismatchMessage2.css("color", "blue");
        	
        } 
        else {
        	passwordMismatchMessage2.text("비밀번호가 일치하지 않습니다.");
            passwordMismatchMessage2.css("color", "red");
        }
    });
    
    // 폼 제출 이벤트 핸들러 추가
    $("form[name='happy_member_reg']").on("submit", function(event) {
        var password = passwordField.val();
        var confirmPassword = passwordConfirmField.val();
        var letter = /[a-zA-Z]/;
        var number = /[0-9]/;
        var special = /[!@#$%^&*()_+]/;

         // password에 값이 있을 때만 아래의 코드를 실행
   		 if (password)
   		 {
        	if (password !== confirmPassword)
        	{
	            alert("비밀번호가 일치하지 않습니다.");
	            event.preventDefault(); // 폼 제출을 중단하고 현재 페이지에 머무름
	            return false;
        	}
        
	        else if (!letter.test(password) || !number.test(password) || !special.test(password))
	        {
	            alert("비밀번호는 영문자, 숫자, 특수문자를 모두 포함해야 합니다.");
	            event.preventDefault(); // 폼 제출을 중단하고 현재 페이지에 머무름
	            return false;
	        }
        }
        
        return true; // 비밀번호가 일치하면 폼 제출을 진행
    });
});
/*<!-- 패스워드1,2 확인 완료-->*/




/*<!-- 이메일인증 확인 시작-->*/
$(document).ready(function() {
    // 아이디 입력 필드의 "input" 이벤트 핸들러 추가
    $("#verificationCodeInput").on("input", function() {
    	
        var codeToCheck = $(this).val();
        console.log("codeToCheck:", codeToCheck);
        
        
        var first = document.getElementsByName("email_at_user")[0].value;
        var second = document.getElementsByName("email_at_host")[0].value;
        var email = first + "@" + second;
        
        //var email=combineEmailFields();
        console.log("email:", email);
        var resultMessage = $("#verificationResult"); // 결과 메시지의 ID를 사용
		
        // 중복 확인 실행 코드
        $.ajax({
            type: "POST",
            url: "verifyEmailCode",
            contentType: "application/json;charset=utf-8", // Content-Type 설정
            data: JSON.stringify({ email: email, code: codeToCheck }),
            dataType: "text",
            success: function(response) {
            	console.log("서버 응답:", response); // 서버 응답을 콘솔에 출력
                resultMessage.text(response);
                if (response.includes("다시")) {
                    resultMessage.css("color", "red");
                    isCodeVerified = false;
                } else {
                    resultMessage.css("color", "blue");
                    isCodeVerified = true;
                }
            },
            error: function(error) {
                console.error("오류 발생: " + JSON.stringify(error));
            }
        });
    });

	 // 폼 제출 이벤트 핸들러 추가
	    $("form[name='happy_member_reg']").on("submit", function(event) {
	        if (!isCodeVerified) {
	            event.preventDefault(); // 아이디가 유효하지 않으면 폼 제출을 중단
	            alert("이메일 인증을 완료해주세요");
	        }
	    });
	}); 
/*<!-- 이메일인증 확인 종료-->*/

/*<!--휴대폰 번호 숫자만 입력 시작-->*/
$(document).ready(function() {
    // phone_second와 phone_third 입력 필드 선택
    var phoneSecondField = $("input[name='phone_second']");
    var phoneThirdField = $("input[name='phone_third']");

    // 입력 필드에서 입력이 발생할 때 이벤트 핸들러 실행
    phoneSecondField.add(phoneThirdField).on("input", function() {
        var phoneSecondValue = phoneSecondField.val();
        var phoneThirdValue = phoneThirdField.val();

        // 입력값이 숫자가 아닌 경우 경고 표시
		if (!/^[0-9]*$/.test(phoneSecondValue) || !/^[0-9]*$/.test(phoneThirdValue)) {
		    $("#phoneNo_resultMessage").text("숫자만 입력하세요.");
		    $("#phoneNo_resultMessage").css("color", "red"); // 텍스트 색상을 빨간색으로 설정
		} else {
		    $("#phoneNo_resultMessage").text(""); // 경고 메시지 지우기
		    $("#phoneNo_resultMessage").css("color", "black"); // 텍스트 색상을 기본 색상으로 설정
		}
    });
});
/*<!--휴대폰 번호 숫자만 입력 종료-->*/


// 이메일 @ 뒤. select 요소의 값이 변경될 때 호출되는 함수
function updateInputValue() {
    // select 요소의 현재 선택된 옵션의 값을 가져옴
    var selectedOption = document.getElementById("user_email_at_hostSel");
    var selectedValue = selectedOption.value;
    
    // input 요소에 선택된 옵션의 값을 설정
    var inputElement = document.getElementById("user_email_at_host");
    inputElement.value = selectedValue;
}


/*인증 이메일 전송 시작*/
function sendEmailVerification() {
    // combineEmailFields 함수를 호출하여 이메일 주소를 생성
    var email = combineEmailFields();

    var division = document.getElementsByName("division")[0].value; // division 값을 가져옴
    console.log("Email 주소:", email); // 콘솔에 값을 출력

     // 서버로 요청을 보내 이메일을 보냅니다.
    fetch("sendEmailVerification", {
        method: "POST",
        headers: {
            "Content-Type": "application/json;charset=UTF-8"
        },
        body: JSON.stringify({ email: email, division: division }) // 서버로 전송할 데이터
    })
    .then(response => {
        if (response.status === 200) {
            // 성공적으로 이메일을 보냈을 때의 처리
            return response.text();
        } else {
            // 실패했을 때의 처리
            throw new Error("이메일 전송에 실패했습니다.");
        }
    })
    .then(data => {
        // 서버에서 반환한 문자열을 처리
        alert(data); // "이메일이 전송되었습니다. 인증 링크를 확인하세요." 또는 에러 메시지가 표시됩니다.
    })
    .catch(error => {
        console.error("에러 발생: ", error);
    });
}
/*인증 이메일 전송 종료*/