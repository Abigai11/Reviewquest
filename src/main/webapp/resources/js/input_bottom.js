
/*<!-- submit, onclick 이메일, 휴대폰번호, 주소 문자열 처리 시작 -->*/
function combineEmailFields()
{
	console.log("combineEmailFields 실행확인");
    var first = document.getElementsByName("email_at_user")[0].value;
    var second = document.getElementsByName("email_at_host")[0].value;
    
    var combinedValue = first + "@" + second;
    document.getElementById("combined_email").value = combinedValue;
    
    return combinedValue; // 값 반환
}
function combinePhoneFields() {
	console.log("combinePhoneFields 실행확인");
    var first = document.getElementsByName("phone_first")[0].value;
    var second = document.getElementsByName("phone_second")[0].value;
    var third = document.getElementsByName("phone_third")[0].value;
    
    var combinedValue = first + "-" + second + "-" + third;
    document.getElementById("combined_phone").value = combinedValue;
}
function combineaddressFields() {
	console.log("combineaddressFields 실행확인");
    var first = document.getElementsByName("address_first")[0].value;
    var second = document.getElementsByName("address_second")[0].value;
    var third = document.getElementsByName("address_third")[0].value;
    
    var combinedValue = first + "/" + second + "/" + third;
    document.getElementById("combined_address").value = combinedValue;
}
function validSnsForm() {
	console.log("isSnsValid 실행확인");
    var instagramField = document.getElementsByName("urlSNS")[0].value;
    var youtubeField = document.getElementsByName("urlYoutube")[0].value;
    var naverField = document.getElementsByName("urlNaver")[0].value;

    if (instagramField === "" && youtubeField === "" && naverField === "") {
        alert("적어도 하나의 URL을 입력해주세요.");
        
        return false; // 제출을 중단합니다.
    }
    // 여기에 추가적인 유효성 검사 또는 로직을 추가할 수 있습니다.

    return true; // 유효성 검사를 통과하면 제출을 허용합니다.
}
function validphoneForm() {
	 console.log("valiphoneForm 실행확인");
    var phoneSecond = document.getElementsByName("phone_second")[0].value;
    var phoneThird = document.getElementsByName("phone_third")[0].value;
  
     // 입력된 값이 10자리 숫자인지 확인하는 정규식
    var numberPattern = /^[0-9]{4}$/;
    
   // 정규식을 사용하여 숫자가 10자리인지 확인
    if (!numberPattern.test(phoneSecond) || !numberPattern.test(phoneThird)) {
        alert("휴대폰 번호는 4자리의 숫자로만 입력해야 합니다.");
        return false;
    }
    return true; // 유효성 검사 통과
}
/*사업자 등록번호 숫자 아니면 제출 금지*/
function validbusinessNOForm() {
	 console.log("valibusinessNOForm 실행확인");
    var businessNOInput = document.getElementById("businessNOInput").value;
    console.log("제출전 확인  businessNOInput : ", businessNOInput);
    
     // 입력된 값이 10자리 숫자인지 확인하는 정규식
    var numberPattern = /^[0-9]{10}$/;
 	 // 정규식을 사용하여 숫자가 10자리인지 확인
    if (!numberPattern.test(businessNOInput)) {
        alert("사업자등록 번호는 10자리의 숫자로만 입력해야 합니다.");
        return false;
    }
    return true; // 유효성 검사 통과
}

/*<!-- submit, onclick 이메일, 휴대폰번호, 주소 문자열 처리 종료 -->*/