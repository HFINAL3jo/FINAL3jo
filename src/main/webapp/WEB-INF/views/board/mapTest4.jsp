<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645218c0e569303936c79803cc2aa695&libraries=services"></script>
<meta charset="UTF-8">
<title>645218c0e569303936c79803cc2aa695</title>
</head>
<body>
<div id="map" style="width:70%;height:400px;"></div>

<script>
var mapContainer = document.getElementById('map');
var mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567),
    level: 8
};  

var map = new daum.maps.Map(mapContainer, mapOption); 

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체 생성
var geocoder = new daum.maps.services.Geocoder();

var listData = [
	{	content :'디뮤지엄',
		address :'서울특별시 용산구 한남동 독서당로29길 5-6'},
	{	content :'로우앤슬로우',
		address :'서울특별시 용산구 이태원1동 보광로 126'},
	{	content :'국립중앙박물관',
		address :'서울특별시 용산구 서빙고동 서빙고로 137'},
	{	content :'Fountain',
		address :'서울특별시 용산구 이태원동 116-6'}    
];

listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
            var infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
                disableAutoPan: true
            });
            //infowindow.open(map, marker);
        }
        kakao.maps.event.addListener(marker, 'click', function() {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            infowindow.setContent('<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>');
            infowindow.open(map, marker);
        });
    });
});


</script>

</body>
</html>