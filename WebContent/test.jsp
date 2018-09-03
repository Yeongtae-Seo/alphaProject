<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<title>다음 지도</title>

</head>
<body>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02f98fd003ee030ad30d62d918ad4dab"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02f98fd003ee030ad30d62d918ad4dab&libraries=drawing"></script>

<!-- <a href="http://map.daum.net/link/map/29시네마,37.4965791,127.0297537" >
		<div id="staticMap" style="width: 600px; height: 350px;"></div>
	</a>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02f98fd003ee030ad30d62d918ad4dab"></script>
	<script>
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
 		var markers = [

		{
			position : new daum.maps.LatLng(37.4965791, 127.0297537),
			text : '29시네마' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
		} ]; 

		var container = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
		options = {
			center : new daum.maps.LatLng(37.4965791, 127.0297537), // 이미지 지도의 중심좌표
			level : 3, // 이미지 지도의 확대 레벨
		marker : markers 
		// 이미지 지도에 표시할 마커 
		};

		// 이미지 지도를 생성합니다
		var staticMap = new daum.maps.StaticMap(container,
				options);
	</script>
 	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02f98fd003ee030ad30d62d918ad4dab"></script>
	<script>
	var markers = [
	    {
	        position: new daum.maps.LatLng(33.450001, 126.570467), 
	        text: '텍스트를 표시할 수 있어요!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
	    }
	];
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570467),
			level: 3,
			marker: markers
		};

		var map = new daum.maps.StaticMap(container, options);
	</script> -->
	<div align="center">
	<a href="http://map.daum.net/link/map/29시네마,37.4965791,127.0297537" >
	<div id="map" style="width:50%;height:350px;"></div>
	</a>
	</div>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.4965791, 127.0297537), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(25, 25), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new daum.maps.LatLng(37.4965791, 127.0297537); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>
</body>
</html>