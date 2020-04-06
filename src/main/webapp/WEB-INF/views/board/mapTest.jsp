<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<title>645218c0e569303936c79803cc2aa695</title>
</head>
<body>
<h1>지도지도지도지도테스트입니다^ㅠ^//</h1><div class="map_wrap">
    <div id="map" style="width:900px;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span id="centerAddr"></span>
    </div>
	</div>
	<button onclick="setBounds()">한번에 보기</button> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.5346013,126.9877438), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다	 
	var positions = [
	    {
	        content: '<div style="height: 100px;"><b>Thursday Party</b><br>address<br>서울특별시 용산구 이태원1동 이태원로27길 6</div>', 
	        latlng: new kakao.maps.LatLng(37.5349871,126.9934046)
	    },
	    {
	        content: '<div style="height: 100px;"><b>MANSUM HOF<b><br>address<br>서울특별시 중구 을지로3가 을지로13길 19</div>', 
	        latlng: new kakao.maps.LatLng(37.5672609,126.9895685)
	    },
	    {
	        content: '<div style="height: 100px;"><b>CHOSUN JUMAKM</b><br>address<br>서울특별시 광진구 화양동 아차산로33길 28-4</div>', 
	        latlng: new kakao.maps.LatLng(37.5414226,127.0684444)
	    },
	    {
	        content: '<div style="height: 100px;"><b>3C5花  :Korea liquor</b><br>address<br>서울특별시 마포구 마포동 303-8</div>',
	        latlng: new kakao.maps.LatLng(37.5377023,126.9424273)
	    }
	];
	$(".map_wrap").mouseover(function(){		 
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
	
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
	
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));		 
		}
	 });
	 
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	 // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
 	var bounds = new kakao.maps.LatLngBounds();    

	var i, marker;
	for (i = 0; i < positions.length; i++) {
	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	    marker = new kakao.maps.Marker({ position : positions[i].latlng });
	    marker.setMap(map);
	    
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds.extend(positions[i].latlng);
	}
	
	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}  
	
	
</script>
</body>
</html>