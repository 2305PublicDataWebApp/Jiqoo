<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- W3W -->
    <script type="module" defer src="https://cdn.what3words.com/javascript-components@4.1.0/dist/what3words/what3words.esm.js"></script>
    <script nomodule defer src="https://cdn.what3words.com/javascript-components@4.1.0/dist/what3words/what3words.js"></script> 
    <title>장소 선택</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic:wght@700&display=swap');
        :root {
        --font-default : 'Nanum Gothic', sans-serif;
        --font-primary: 'Black Han Sans', sans-serif;
        --color-primary: #8BC34A;
        --color-secondary: #388E3C;
        --color-default : #FFF59D;
        }
        body {
        font-family: "Open Sans", sans-serif;
        color: #444444;
        margin: 0px;
        height: 100%;
        background-color: var(--color-default);
        }

        #map-container {
          width: 1200px;
          height: 800px;
        }
        #search-container {
          margin: 10px 0 0 10px;
        }
        #search-input {
          width: 300px;
        }
        #current-location-container {
          margin: 0 10px 10px 0;
        }

        #current-location-container button {
            width: 200px;
            height: 60px;
            border-radius: 25px;
            background-color: #8BC34A;
            color: white;
            font-size: 20px;
            border: none;
            box-shadow:  rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
        }
        </style>
</head>
<body>
    <div id="map">
        <what3words-map
          id="w3w-map"
          api_key="5SGMAF36"
          map_api_key="AIzaSyDT4QB__1EdEWo0BUhOUH6XEN4nKpwE57E"
          disable_default_ui
          fullscreen_control
          map_type_control
          zoom_control
          language="ko"
          current_location_control_position="9"
          fullscreen_control_position="3"
          search_control_position="1"
          current_location="true"
        >
          <div slot="map" id="map-container"></div>
          <div slot="search-control" id="search-container">
          <what3words-autosuggest>
              <input
                  id="search-input"
                  type="text"
                  placeholder="Find your address"
                  autocomplete="off"
              />
              </what3words-autosuggest>
          </div>
          <div slot="current-location-control" id="current-location-container">
              <button>Current Location</button>
          </div>
          <button id="convert-button">변환</button>
        </what3words-map>
      </div>
      <button id="convert-button">변환</button>
        <div id="coordinates">좌표:</div>
        <div id="address">도로명 주소:</div>
      <button onclick="closePopup()">팝업 닫기</button>
      <script>
        // 팝업 닫기 함수
        function closePopup() {
            // 현재 창을 닫습니다.
            window.close();
        }
        
    // Google Maps Geocoding 서비스 초기화
    var geocoder = new google.maps.Geocoder();

    // 입력 필드와 결과를 표시할 요소 가져오기
    var inputElement = document.getElementById("search-input");
    var coordinatesElement = document.getElementById("coordinates");
    var addressElement = document.getElementById("address");
    var convertButton = document.getElementById("convert-button");

    // 변환 버튼 클릭 시 이벤트 핸들러
    convertButton.addEventListener("click", function() {
        var inputValue = inputElement.value;

        // 빈 문자열이 아닌 경우에만 변환 요청 보냄
        if (inputValue.trim() !== "") {
            // 3 단어 주소를 좌표로 변환
            what3words.api.convertToCoordinates(inputValue)
                .then(function(response) {
                    var coordinates = response.geometry.coordinates;
                    var latitude = coordinates[1];
                    var longitude = coordinates[0];
                    coordinatesElement.textContent = "좌표: " + latitude + ", " + longitude;

                    // 좌표를 사용하여 도로명 주소를 가져오기
                    var latlng = new google.maps.LatLng(latitude, longitude);
                    geocoder.geocode({ 'latLng': latlng }, function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            if (results[0]) {
                                var formattedAddress = results[0].formatted_address;
                                addressElement.textContent = "도로명 주소: " + formattedAddress;
                            } else {
                                addressElement.textContent = "도로명 주소를 찾을 수 없음";
                            }
                        } else {
                            addressElement.textContent = "도로명 주소를 찾을 수 없음";
                        }
                    });
                })
                .catch(function(error) {
                    coordinatesElement.textContent = "변환 실패: " + error.message;
                    addressElement.textContent = "도로명 주소: (변환 실패)";
                });
        } else {
            coordinatesElement.textContent = "";
            addressElement.textContent = "도로명 주소: (주소를 입력해주세요)";
        }
    });
</script>
</body>
</html>