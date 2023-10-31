<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>지꾸 : No.1 지도 다이어리</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../resources/assets/img/earth-globe.png" rel="icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
  <!-- 부트스트랩 CSS -->
  
  <!-- 부트스트랩 JavaScript 및 jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/jiqoo.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">

	<!-- W3W -->
    <script type="module" async src="https://cdn.what3words.com/javascript-components@4.1.6/dist/what3words/what3words.esm.js"></script>
	<script nomodule async src="https://cdn.what3words.com/javascript-components@4.1.6/dist/what3words/what3words.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic:wght@700&display=swap');
		@font-face {
		  font-family: 'IBMPlexSansKR-Regular';
		  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
		  font-weight: normal;
		  font-style: normal;
		}
		:root {
		  --font-default : 'IBMPlexSansKR-Regular';
		  --font-secondary : 'Nanum Gothic', sans-serif;
		  --font-primary: 'Black Han Sans', sans-serif;
		  --color-primary: #8BC34A;
		  --color-secondary: #388E3C;
		  --color-default : #FFF59D;
		}
		h1,
		h2,
		h3,
		h4,
		h5,
		h6,
		p {
		  font-family: var(--font-default);
		}
        body {
        font-family: 'IBMPlexSansKR-Regular';
        color: #444444;
        margin: 0px;
        height: 100%;
        background-color: var(--color-default);
        }

        #map-container {
          width: 1199px;
          height: 799px;
        }
        #search-container {
          margin: 10px 0 0 10px;
        }
        #search-input {
          width: 300px;
          position: relative;
    	  border-radius: 5px;
        }
        #current-location-container {
            margin: 0 10px 10px 0;
		    position: absolute;
		    bottom: 119px !important;
		    right: -2px !important;
        }

        #current-location-container button {
            width: 60px;
		    height: 60px;
		    border-radius: 50%;
		    background-color: #ffffff;
		    border: none;
		    box-shadow: rgba(0, 0, 0, 0.3) 1px 1px 7px 0px;
        }
        
        #current-location-container button img {
        	width: 30px;
        }
        
/*         .gmnoprint { */
/*         	display: none; */
/*         } */
        
        #search-input {
        	position: relative;
        }
        
        #info-btn {
            width: 40px;
		    position: absolute;
		    right: 9px;
		    top: 9px;
		    border-radius: 5px;
		    background-color: #adbecf;
		    color: white;
		    font-size: 15px;
		    padding: 5px;
		    border: none;
		    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
		    cursor: pointer;
		    transition: 0.3s;
		}
		
		#info-btn:hover {
			background-color: #8BC34A;
		}
		    
        </style>
  <!-- =======================================================
  * Template Name: Bootslander
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
  <main id="main">
         <div id="map-container">
        <what3words-map
          id="w3w-map"
          api_key="DSNFCQLC"
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
			  <button id="info-btn" style="position: absolute;"><i class="bi bi-check-lg"></i></button>
              </what3words-autosuggest>
          </div>
          <div slot="current-location-control" id="current-location-container">
              <button> <img alt="현재위치표시" src="../resources/assets/img/gps-location.png"> </button>
          </div>
        </what3words-map>
      </div>
  </main><!-- End #main -->

<script>
    // 팝업 닫기 함수
    function closePopup() {
      const w3wMap = document.getElementById("w3w-map");
      const locationInput = document.getElementById("search-input").value;

      // 현재 좌표와 w3w 주소를 가져옴
      w3wMap.getLat().then(latitude => {
        w3wMap.getLng().then(longitude => {
          // 모달로 데이터 전달
          const modal = window.opener.document.getElementById('insert-modal');
          modal.querySelector('#lat').value = latitude;
          modal.querySelector('#lng').value = longitude;
          modal.querySelector('#location').value = locationInput;

          // 팝업 닫기
          window.close();
        });
      });
    }
    

    document.querySelector("#info-btn").addEventListener("click", function () {
      closePopup();
    });
  </script>


</body>

</html>