WebFont.load({
    google: {
        families: ['Noto Sans KR']
    }
});

window.addEventListener("load", function() {
    var category = document.getElementById("div_category");
    var btnCategoryImg = document.getElementById("btn_category_img");
    var categoryRight = document.getElementById("div_search");
    var btnSearchImg = document.getElementById("btn_search_img");
    var tableSearch = document.getElementById("table_search");

    btnCategoryImg.addEventListener("click", function() {
        if (category.style.display === "block") {
            category.style.display = "none";
        } else {
            category.style.display = "block";
            resizeContents();
        }
    });

    window.addEventListener("resize", resizeContents);

    var topLayerClose = document.getElementById("top_layer_close");
    topLayerClose.addEventListener("click", function() {
        category.style.display = "none";
    });

    window.addEventListener("orientationchange", function() {
        category.style.display = "none";
    });

    var divCategoryClose = document.getElementById("div_category_close");
    divCategoryClose.addEventListener("click", function() {
        category.style.display = "none";
    });

    btnSearchImg.addEventListener("click", function() {
        if (categoryRight.style.display === "block") {
            categoryRight.style.display = "none";
        } else {
            categoryRight.style.display = "block";
            tableSearch.style.height = document.documentElement.scrollHeight + "px";
            document.getElementById("search_word").focus();
        }
    });

    var topLayerCloseRight = document.getElementById("top_layer_close_right");
    topLayerCloseRight.addEventListener("click", function() {
        categoryRight.style.display = "none";
    });

    window.addEventListener("orientationchange", function() {
        categoryRight.style.display = "none";
    });

    var divSearchClose = document.getElementById("div_search_close");
    divSearchClose.addEventListener("click", function() {
        categoryRight.style.display = "none";
    });

    resizeContents();
});

function resizeContents() {
    // Add your resizing logic here
    // document.getElementById("div_category").style.height = document.documentElement.scrollHeight + "px";
    // document.getElementById("table_category").style.height = document.documentElement.scrollHeight + "px";
    // document.querySelector(".all_menu_content").style.height = window.innerHeight + "px";
}

//탭 고정위치 잡기
$(document).ready(function(){
    $('.detail_tab_menu a' ).click(function(){
        var headerHeight = 85;

        $('html, body').animate({
            scrollTop: $( $.attr(this, 'href') ).offset().top - headerHeight
        }, 500);
        return false;
    });
});


                $( document ).ready(function( $ ) {
                    $( '#detail_small_slide' ).sliderPro({
                        width: 820,
                        height: 435,
                        fadeDuration : 100,
                        touchSwipe : false,
                        thumbnailTouchSwipe : true,
                        thumbnailPointer : false,		//썸네일 위에 포인터를 표시하는 기능은데 끄는걸 추천함.
                        buttons: false,					//O 버튼 , SP 버튼에 대한 display 옵션
                        fade: true,						//넘김효과를 사라짐으로 사용할지 여부
                        arrows: true,					//화살표 단추 사용여부
                        //shuffle: true,				//이미지 호출 랜덤 효과
                        thumbnailArrows: false,			//하단 작은 이미지 슬라이드 사용여부
                        autoplay: true,					//자동 슬라이드 기능 사용여부
                        thumbnailsPosition: 'bottom',	//썸네일 위치
                        thumbnailWidth: 98,			//썸네일 가로크기
                        thumbnailHeight: 63			//썸네일 세로크기
                    });
                });

function slider_layer_open()
{
    var temp = $('#layer_pop_detail');
    //var temp = $('#slider');
    var bg = temp.prev().hasClass('bg');

    temp.find('a.cbtn').click(function(e){
        if(bg){
            $('.editor_layer_detail').fadeOut(1);
        }else{
            temp.fadeOut(1);
        }
        e.preventDefault();
    });

    $('.editor_layer_detail .bg').click(function(e){
        $('.editor_layer_detail').fadeOut(1);
        e.preventDefault();
    });

    if(bg){
        $('.editor_layer_detail').fadeIn(1);	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다.
    }else{
        temp.fadeIn(1);
    }

    //console.log($('#layer_pop').outerHeight());

    if(temp.outerHeight() < $(document).height())
    {
        temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
    }
    else
    {
        temp.css('top', '0px');
    }

    if(temp.outerWidth() < $(document).width())
    {
        temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
    }
    else
    {
        temp.css('left', '0px');
    }

    $( '#detail_small_slide2' ).sliderPro({
        width: 1100,
        height: 705,
        touchSwipe : false,
        thumbnailTouchSwipe : true,
        thumbnailPointer : false,		//썸네일 위에 포인터를 표시하는 기능은데 끄는걸 추천함.
        buttons: false,					//O 버튼 , SP 버튼에 대한 display 옵션
        fade: true,						//넘김효과를 사라짐으로 사용할지 여부
        arrows: true,					//화살표 단추 사용여부
        fullScreen: true,				//전체화면 기능 사용여부
        //shuffle: true,				//이미지 호출 랜덤 효과
        thumbnailArrows: true,			//하단 작은 이미지 슬라이드 사용여부
        autoplay: true,					//자동 슬라이드 기능 사용여부
        //thumbnailsPosition: 'right',	//썸네일 위치
        thumbnailWidth: 109,			//썸네일 가로크기
        thumbnailHeight: 55			//썸네일 세로크기
    });
}

var message = new Array();

message[0] = "[체험단 139번]궁금한 점 문의드립니다.전화연락주세요"
message[1] = "[체험단 139번]가맹점 문의를 드리고 싶습니다."
message[2] = "[체험단 139번]위치가 어딘가요?"
message[3] = "[체험단 139번]위치와 교통편은 어떻게 되나요?"
message[4] = "[체험단139번]예약도 가능한가요?"
message[5] = "[체험단 139번]대량구입시 할인 가능한가요?"
message[6] = "[체험단 139번]휴무가 언제인가요?"


/* 예전것 백업 [ YOON : 2008-12-30 ]
message[0]	= "[맛집 139번]  맛집을 통채로 사고 싶습니다. ";
message[1]	= "[맛집 139번]  가맹점 문의를 드리고 싶습니다.";
message[2]	= "[맛집 139번]  위치가 어딘가요?";
*/

//	message[숫자] -> 0부터 차례대로 입력하실 메세지들을 입력하시면 됩니다. 개수는 제한이 없습니다.
//	문자는 80바이트이상 전송이 불가능 하므로 입력후에 테스트를 해보시기 바랍니다.
//	또는 SMS문자메세지 창(가로 한글8자 세로 한글5줄)보다 글이 넘칠경우 80바이트가 넘을 가능성이 큽니다.
//	최소 한가지 이상의 문자가 입력이 되어야 합니다.


function message_select_load()
{
    var sSize	= message.length;
    var frm		= document.happysms_frm;

    var no		= frm.message_change.options.length;

    for ( i=0,j=1 ; i<sSize ; i++,j++ )
    {
        tmText	= j + "번째 메세지";
        tmValue	= i;
        frm.message_change.options[no]	= new Option(tmText,tmValue,true);
        no		= frm.message_change.options.length;
    }
}

function go_message_change()
{
    var frm	= document.happysms_frm;
    var no	= frm.message_change.selectedIndex;
    var val	= frm.message_change.options[no].value;

    frm.message.value = message[val];
}


var daumMap1			= '';
var daumIcon1			= '';

var daum_map_start1 = function daum_map_start1()
{
    var map =  new daum.maps.Map(document.getElementById('happy_daum_map_1'), {
        center: new daum.maps.LatLng(37.4762265463571, 126.64015041084),
        level : 10,
        mapTypeId: daum.maps.MapTypeId.ROADMAP,
        scrollwheel: false
    });

    var zoomControl = new daum.maps.ZoomControl();map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);


    var icon = new daum.maps.MarkerImage(
        'img/ani_ico_pos_pointer.gif',new daum.maps.Size(21, 24),new daum.maps.Point(16,34),"poly","1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
    );

    var marker = new daum.maps.Marker({position: new daum.maps.LatLng(37.4762265463571, 126.64015041084),image: icon});
    marker.setMap(map);

    map.panBy(0, 1);
    map.panBy(0, -1);
}

var	oldonload =	window.onload;
if ( typeof	window.onload != 'function'	)
{
    window.onload =	function() { daum_map_start1(); }
}
else
{
    window.onload =	function() {
        oldonload();
        daum_map_start1();
    }
}

if ( typeof daum != "object" )
{
    var is_daum_sdk_load	= "";
    document.getElementById("roadview_1").innerHTML = "<img src='skin/adblog/img/lost_daum_loadview_key.jpg' width='100%' height='100%'>";
}
else
{
    var is_daum_sdk_load	= "1";
}

var panoId		= 1155288986;

if ( is_daum_sdk_load == "1" )
{
    //var latlng		= new daum.maps.LatLng(37.476226807,126.640151978);
    var latlng		= new daum.maps.LatLng(37.476226807,126.640151978);
    var rvc			= new daum.maps.RoadviewClient();
    //var rv			= new daum.maps.Roadview(document.getElementById("roadview_1"));

    try {
        var rv			= new daum.maps.Roadview(document.getElementById("roadview_1"));
    }
    catch (e)
    {
        document.getElementById("roadview_1").innerHTML = "";
    }

    rv.setPanoId(panoId,latlng);


    setTimeout(
        function()
        {
            // 로드뷰 정상 호출 되었는지 로드뷰의 위도/경도 포지션 호출 해봄
            var roadview_get_position	= rv.getPosition().toString();
            roadview_get_position		= roadview_get_position.replace('(', '');
            roadview_get_position		= roadview_get_position.replace(')', '');
            roadview_get_position		= roadview_get_position.replace(' ', '');
            roadview_get_position		= roadview_get_position.split(',');
            //alert(roadview_get_position[0]+' - '+roadview_get_position[1]);

            // 로드뷰의 좌표가 비정상일 경우
            if ( roadview_get_position[0] == 'NaN' || roadview_get_position[1] == 'NaN' )
            {
                rvc.getNearestPanoId(latlng,100,function(panoId){
                    if ( !panoId )
                    {
                        document.getElementById('roadview_1').innerHTML = '<img src=\'skin/adblog/img/no_roadview.jpg\' width=\'100%\' height=\'100%\'>';
                        return;
                    }
                    else
                    {
                        rv.setPanoId(panoId,latlng);
                    }
                });

            }
            else if ( '0' != '' &&  '1.2722218725854067e-14' != '' &&  '-3' != '' )
            {
                rv.setViewpoint({
                    pan		: parseFloat(0),
                    tilt	: parseFloat(1.2722218725854067e-14),
                    zoom	: parseFloat(-3)
                });
                rv.relayout();
            }
        },
        1000
    );

}


if ( is_daum_sdk_load == "1" )
{


    daum.maps.event.addListener(
        rv,
        'error',
        function rv_error(){

            document.write("<img src='skin/adblog/img/wrong_location.jpg' width='100%' height='100%'>");
            return false;
        }
    );

    //try { daum.maps.event.trigger(rv,'init'); } catch(e) {}
    //setTimeout(function(){	try { daum.maps.event.trigger(rv,'init'); } catch(e) {} },100);
}

// 현재시간의 리뷰상태 CSS제어
camp_stats	= '10';
camp_stats	= Math.ceil(camp_stats / 10) * 10;

nowObj		= document.getElementById(camp_stats);

nowObj.style.color			= '#212121';
nowObj.style.fontWeight		= '500';
nowObj.style.letterSpacing	= '-1px';


$(".detail_tab_menu a").click(function(){

    $(".detail_tab_menu a").css({"font-weight":"400","color":"#4c4c4c"});    /// a 태그 전체

    $(this).css({"font-weight":"500","color":"#000000"});

});

detail_overflow_default(760);
