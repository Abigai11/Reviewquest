const endDateElements = document.querySelectorAll(".date");
const endDifference = document.querySelector(".donateBtn");

function updateDday(endDateElement) {
    const date = document.getElementById("endDate").value;
    const endDate = new Date(date);
    const today = new Date();

    const timeDifference = endDate - today;

    if (timeDifference <= 0) {
        // 마감일이 지났을 경우 처리
        endDateElement.innerHTML = "마감일이 지났습니다.";
        endDifference.disabled = true;
    } else {
        const day = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
        const hour = String(Math.floor((timeDifference / (1000 * 60 * 60)) % 24)).padStart(2, "0");
        const min = String(Math.floor((timeDifference / (1000 * 60)) % 60)).padStart(2, "0");
        const sec = String(Math.floor((timeDifference / 1000) % 60)).padStart(2, "0");

        endDateElement.innerHTML = day + "일 " + hour + "시간 " + min + "분 " + sec + "초";
    }
}

endDateElements.forEach(function (endDateElement) {
    updateDday(endDateElement);
    setInterval(function () {
        updateDday(endDateElement);
    }, 1000);
});
