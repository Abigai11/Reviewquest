$(document).ready(function () {
    // 기부하기 버튼을 클릭할 때 모달 창을 표시
    $(".donateBtn").on("click", function () {
        var modal = document.getElementById("myModal");
        modal.style.display = "block";
    });

    // 모달 창의 닫기 버튼을 클릭할 때 모달 창을 숨김
    $(".close").on("click", function () {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
        
        // 입력란을 초기화
    	var priceInput = document.getElementById("price");
    	priceInput.value = "0";
    });
    
    var priceInput = document.getElementById("price");
    
    // +금액 버튼을 클릭할 때
	$(".addAmountBtn").on("click", function () {
	    var amountToAdd = parseInt($(this).data("amount"));
	    addAmount(amountToAdd);
	});

    function addAmount(amount) {
        // price에 값을 파싱하여 현재 금액을 가져온 후, amount를 더함
        var currentAmount = parseInt(priceInput.value.replace(/,/g, ''), 10) || 0;
        var newAmount = currentAmount + amount;
        priceInput.value = newAmount.toLocaleString();
   	}
    
 	// 입력란의 input 이벤트에 대한 이벤트 리스너 추가
	priceInput.addEventListener("input", function () {
			
	    // 입력값에서 모든 쉼표를 제거하고 숫자만 남깁니다.
	    var inputValue = this.value.replace(/,/g, '');
	
	    // 입력값을 정수로 파싱하고 다시 3자리마다 쉼표를 추가합니다.
	    var formattedValue = parseInt(inputValue, 10).toLocaleString();
	
	    // 입력란에 포맷팅된 값을 설정합니다.
	    this.value = formattedValue;
	});

});
