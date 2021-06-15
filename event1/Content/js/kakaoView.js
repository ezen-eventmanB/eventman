var mapContainer = document.getElementById('map'), 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.84025999489788, 127.13247645455057),
	        level: 3 
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	

	var markerPosition  = new kakao.maps.LatLng(35.84025999489788, 127.13247645455057); 
	

	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	

	marker.setMap(map);
	  
	function panTo() {
	    var moveLatLon = new kakao.maps.LatLng(35.84025999489788, 127.13247645455057);

	    map.panTo(moveLatLon);
	}