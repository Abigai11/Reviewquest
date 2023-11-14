<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>검색 폼</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <div id="div_search" class="div_search" style="display: block;">
        <div id="table_search" class="div_search_inner">
            <div style="position:relative; padding-top:250px;">
                <span id="div_search_close" class="modal_close">
                    <span uk-icon="icon:close; ratio:3" class="uk-icon"><svg width="60" height="60" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="close"><path fill="none" stroke="#000" stroke-width="1.06" d="M16,16 L4,4"></path><path fill="none" stroke="#000" stroke-width="1.06" d="M16,4 L4,16"></path></svg></span>
                </span>

                <script type="text/javascript">
                    <!--
                    // 자동완성 레이어영역 설정	
                    var line_nums = 10;  // 표시될 단어(줄)수
                    //-->
                </script>

                <script type="text/javascript" src="js/searchWord.js"></script>
                <script>
                    function go_search(word) {
                        if (word != undefined) {
                            searchform.search_word.value = word;
                        }

                        var names = new Array("get_si", "kind");
                        for (i = 0, max = names.length; i < max; i++) {
                            now_name = names[i];
                            if (document.searchform[now_name]) {
                                if (document.searchform[now_name].selectedIndex != 0) {
                                    document.searchform.action = "price_search.php";
                                }
                            }
                        }

                        searchform.submit();
                    }

                    function test() {
                        document.getElementById("autoSearchPart").style.display = "none";
                    }

                    function die_search() {
                        var get_att = document.getElementsByTagName("body")[0];
                        get_att.setAttribute("onmousedown", "");
                    }

                    function open_search() {
                        var get_att = document.getElementsByTagName("body")[0];
                        get_att.setAttribute("onmousedown", "alter('111')");
                    }

                    function live_search() {
                        document.getElementById("autoSearchPart").style.display = "block";
                    }

                    function live_search_check() {
                        var check = document.getElementById("autoSearchPart").style.display;
                        if (check == "block") {
                            document.getElementById("autoSearchPart").style.display = "none";
                            return false;
                        } else {
                            document.getElementById("autoSearchPart").style.display = "block";
                            return false;
                        }
                    }

                    function go_search_map() {
                        objForm = document.searchform;
                        objForm.action = "search_map.php";

                        obj = document.getElementsByName("search_word");
                        if (obj[1] != undefined) {
                            obj[1].value = obj[0].value;
                        }
                        if (objForm.search_word.value != "") {
                            objForm.search_metor.value = "";
                        }
                        objForm.submit();
                    }
                </script>

                <style type="text/css">
                    label.search_sel select { width: 100px; }
                </style>

                <style type="text/css">
                    .modal_search:focus { outline: none; }
                    .search_input1 select {
                        width: 125px;
                        padding: 6px;
                        border: 1px solid #bebec1;
                        line-height: 24px;
                    }
                    .search_input2 select {
                        width: 125px;
                        padding: 6px;
                        border: 1px solid #bebec1;
                        line-height: 24px;
                    }
                    .search_input3 select {
                        width: 125px;
                        padding: 6px;
                        border: 1px solid #bebec1;
                        line-height: 24px;
                    }
                    .all_search_box { border: 5px solid #dbdbdb; }

                    /* 검색자동완성 CSS */
                    #autoSearchPartWrap {
                        position: absolute;
                        width: 750px;
                        text-align: left;
                        left: 0;
                        top: 20px;
                    }
                    #autoSearchPart {
                        border-top: none;
                        display: none;
                        height: 150px;
                        overflow: hidden;
                        overflow-y: auto;
                        border: 2px solid #000;
                    }
                    #autoSearchPart td {
                        background: transparent;
                        font-size: 26px;
                        font-family: 'Noto Sans KR' !important;
                        font-weight: 400 !important;
                        padding: 10px 20px !important;
                        letter-spacing: -1px;
                    }
                    #autoSearchPart td font {
                        color: #0067ff !important;
                        font-weight: 500 !important;
                    }
                    .listIn {
                        background-color: #f0f0f0 !important;
                        cursor: pointer;
                    }
                    .listOut {

                    }
                </style>

                <form name="searchform" action="${pageContext.request.contextPath}/list" method="GET">
                    <input type="hidden" name="searchBy" value="keyword">
                    <div style="position:relative; padding:21px 55px 21px 0; border-bottom:1px solid #fff">
                        <input type="text" name="searchKeyword" id="searchKeyword" value="${param.searchKeyword}" class="modal_search noto400" style="width:100%; font-size:38px; background:transparent; height:52px; line-height:52px; color:#fff; outline:none; border:none;" onkeyup="startMethod(event.keyCode);" onkeydown="moveLayer(event.keyCode);" onmouseup="startMethod();" autocomplete="off">
                        <span style="position:absolute; top:25px; right:0; color:#fff;">
                            <button type="submit" class="btn btn-primary"><span uk-icon="icon:search; ratio:2.5" class="uk-icon"><svg width="50" height="50" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="search"><circle fill="none" stroke="#000" stroke-width="1.1" cx="9" cy="9" r="7"></circle><path fill="none" stroke="#000" stroke-width="1.1" d="M14,14 L18,18 L14,14 Z"></path></svg></span>검색하기</button>
                        </span>
                        <div style="position:relative">
                            <div id="autoSearchPartWrap">
                                <div id="autoSearchPart" style="display: none;"></div>
                            </div>
                        </div>
                    </div>
                </form>

                <script>
                    var searchform = document.searchform;
                    document.onclick = test;
                    document.getElementById("autoSearchPart").style.display = "none";
                </script>

                <div style="padding:30px 15px; line-height:40px; text-align:center"> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EC%9D%B8%EC%8A%A4%ED%83%80%EA%B7%B8%EB%9E%A8" style="color:#999"> #인스타그램</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EC%98%81%ED%99%94" style="color:#999"> #영화</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EC%B2%B4%ED%97%98" style="color:#999"> #체험</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%ED%99%94%EC%9E%A5%ED%92%88" style="color:#999"> #화장품</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EB%A7%9B%EC%A7%91" style="color:#999"> #맛집</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EB%A7%88%EC%BC%80%ED%8C%85" style="color:#999"> #마케팅</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EC%A0%84%EC%8B%9C%ED%9A%8C" style="color:#999"> #전시회</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%ED%99%8D%EB%B3%B4" style="color:#999"> #홍보</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EB%B8%94%EB%A1%9C%EA%B7%B8" style="color:#999"> #블로그</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EB%B8%94%EB%A1%9C%EA%B7%B8%EC%B2%B4%ED%97%98%EB%8B%A8" style="color:#999"> #블로그체험단</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EC%A0%84%EC%8B%9C%ED%9A%8C" style="color:#999"> #전시회</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%ED%8C%A8%EC%85%98" style="color:#999"> #패션</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EC%BA%A0%ED%8E%98%EC%9D%B8" style="color:#999"> #캠페인</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EC%8B%A0%EC%83%81%ED%92%88" style="color:#999"> #신상품</a></span> <span class="pick_keword"><a href="all_search.php?kind=&amp;search_word=%EA%B4%91%EA%B3%A0" style="color:#999"> #광고</a></span></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
