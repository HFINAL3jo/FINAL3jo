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
<title>645218c0e569303936c79803cc2aa695</title>
</head>
<body>
<h1>지도지도지도지도테스트입니다^ㅠ^//</h1>
<div id="map" style="width:100%;height:350px;"></div>
<div id="clickLatlng"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.50074107311305, 127.03653396260609), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    map: map,
	    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	    // 지도 중심좌표에 마커를 생성합니다 
	    /* position: map.getCenter() */ 
	}); 
	// 지도에 마커를 표시합니다	
	marker.setMap(map);

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 
	    resultDiv.innerHTML = message;
	    
	    ///////////////////////////////////////////////////////////
	    
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">'+message+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
	
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});
	});
	
	
	
	
	
	
	
	
	
	
</script>
</body>
</html>