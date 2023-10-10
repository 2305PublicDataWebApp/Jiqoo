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
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
  <script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/chatList.css" rel="stylesheet">
  <link href="../resources/assets/css/header.css" rel="stylesheet">
  <link href="../resources/assets/css/footer.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Bootslander
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

  <!-- ======= Hero Section ======= -->
  <section id="hero">

    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
      viewBox="0 24 150 28 " preserveAspectRatio="none">
      <defs>
        <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
      </defs>
      <g class="wave1">
        <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .1)">
      </g>
      <g class="wave2">
        <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .2)">
      </g>
      <g class="wave3">
        <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
      </g>
    </svg>

  </section><!-- End Hero -->

  <main id="main">
    <section>
      <div class="d-flex justify-content-center align-items-center" data-aos="fade-in">
        <h2>채팅 <i class="bi bi-chat-dots"></i></h2>
      </div>
    </section>
    <section>
      <div class="container-fluid h-100" data-aos="fade-in"
        style="background-color: #FFF9C5; padding-top:100px; padding-bottom: 100px; margin-bottom:100px; position:relative;">
        <div class="row justify-content-center h-100">
          <div class="col-md-4 col-xl-3 chat">
            <div class="card mb-sm-3 mb-md-0 contacts_card" data-aos="fade-right">
              <div class="card-header">
                <div class="input-group">
                  <input type="text" placeholder="Search..." name="" class="form-control search">
                  <div class="input-group-prepend">
                    <span class="input-group-text search_btn"><i class="bi bi-search"></i></span>
                  </div>
                </div>
              </div>
              <div class="card-body contacts_body">
                <ui class="contacts">
                  <li class="a_active">

                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img src="../resources/assets/img/basozan.png" class="rounded-circle user_img">
                        <span class="online_icon"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>바소잔</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">9:10 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>그래요</p>

                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="a_active">
                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img
                          src="https://2.bp.blogspot.com/-8ytYF7cfPkQ/WkPe1-rtrcI/AAAAAAAAGqU/FGfTDVgkcIwmOTtjLka51vineFBExJuSACLcBGAs/s320/31.jpg"
                          class="rounded-circle user_img">
                        <span class="online_icon offline"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>꽃보다 파이널</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">8:45 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>개웃김</p>
                          <p
                            style="border-radius: 50px; color:white; background-color: #F24E1E; width:25px; height:25px; text-align: center;">
                            1</p>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="a_active">
                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img src="https://i.pinimg.com/originals/ac/b9/90/acb990190ca1ddbb9b20db303375bb58.jpg"
                          class="rounded-circle user_img">
                        <span class="online_icon"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>강수예</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">8:45 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>글을 너무 잘쓰시네여</p>
                          <p
                            style="border-radius: 50px; color:white; background-color: #F24E1E; width:25px; height:25px; text-align: center;">
                            5</p>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="a_active">
                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img
                          src="http://profilepicturesdp.com/wp-content/uploads/2018/07/sweet-girl-profile-pictures-9.jpg"
                          class="rounded-circle user_img">
                        <span class="online_icon offline"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>채성실</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">8:45 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>낼 만날래?</p>
                          <p
                            style="border-radius: 50px; color:white; background-color: #F24E1E; width:25px; height:25px; text-align: center;">
                            1</p>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="a_active">
                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img src="https://static.turbosquid.com/Preview/001214/650/2V/boy-cartoon-3D-model_D.jpg"
                          class="rounded-circle user_img">
                        <span class="online_icon offline"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>일용자</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">8:45 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>자니..?</p>
                          <p
                            style="border-radius: 50px; color:white; background-color: #F24E1E; width:25px; height:25px; text-align: center;">
                            9</p>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="a_active">
                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img src="https://static.turbosquid.com/Preview/001214/650/2V/boy-cartoon-3D-model_D.jpg"
                          class="rounded-circle user_img">
                        <span class="online_icon offline"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>일용자</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">8:45 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>자니..?</p>
                          <p
                            style="border-radius: 50px; color:white; background-color: #F24E1E; width:25px; height:25px; text-align: center;">
                            9</p>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="a_active">
                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img src="https://static.turbosquid.com/Preview/001214/650/2V/boy-cartoon-3D-model_D.jpg"
                          class="rounded-circle user_img">
                        <span class="online_icon offline"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>일용자</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">8:45 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>자니..?</p>
                          <p
                            style="border-radius: 50px; color:white; background-color: #F24E1E; width:25px; height:25px; text-align: center;">
                            9</p>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="a_active">
                    <div class="d-flex bd-highlight">
                      <div class="img_cont">
                        <img src="https://static.turbosquid.com/Preview/001214/650/2V/boy-cartoon-3D-model_D.jpg"
                          class="rounded-circle user_img">
                        <span class="online_icon offline"></span>
                      </div>
                      <div class="user_info">
                        <div class="col d-flex justify-content-between">
                          <span>일용자</span><br>
                          <p class="user_info_time" style="font-size: 16px; color: #5f5f5f;">8:45 AM</p>
                        </div>
                        <div class="col d-flex justify-content-between">
                          <p>자니..?</p>
                          <p
                            style="border-radius: 50px; color:white; background-color: #F24E1E; width:25px; height:25px; text-align: center;">
                            9</p>
                        </div>
                      </div>
                    </div>
                  </li>
                </ui>
              </div>
              <div class="card-footer"></div>
            </div>
          </div>
          <div class="col-md-8 col-xl-6 chat" id="chat_info_div" data-aos="fade-left">
            <div class='chat_none row d-flex justify-content-center align-items-center'>
              <div class='text-center'><img src='../resources/assets/img/jiqooLogo.png'></div>
              <div class='text-center'>
                <p><span style='color:#388E3C'>채채채</span>님 환영합니다!<br>목록을 클릭하여 채팅을 시작해보세요.
                <p>
              </div>
            </div>
            <div class="card chat-info">
              <div class="card-header msg_head">
                <div class="d-flex bd-highlight">
                  <div class="img_cont">
                    <img src="../resources/assets/img/basozan.png" class="rounded-circle user_img">
                    <span class="online_icon"></span>
                  </div>
                  <div class="user_info">
                    <span>바소잔</span>
                    <p>온라인</p>
                  </div>

                </div>
                <span id="action_menu_btn"><i class="bi bi-three-dots-vertical"></i></span>
                <div class="action_menu">
                  <ul>
                    <li><a href="#"><i class="bi bi-person-vcard"></i> 프로필 보기</a></li>
                    <li><a href="#"><i class="bi bi-x-circle"></i> 채팅방 나가기</a></li>
                    <li><a href="#" data-bs-toggle="modal" data-bs-target="#reportModal"><i
                          class="bi bi-exclamation-triangle"></i> 신고하기</a></li>
                  </ul>
                </div>
              </div>
              <div id="chat_body" class="card-body msg_card_body">
                <div class="d-flex justify-content-start mb-4">
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/basozan.png" class="rounded-circle user_img_msg">
                  </div>
                  <div class="msg_cotainer">
                    <p>안녕하세요!</p>
                    <span class="msg_time">8:40 AM, Today</span>
                  </div>
                </div>
                <div class="d-flex justify-content-end mb-4">
                  <div class="msg_cotainer_send">
                    <p>안녕하세요~</p>
                    <span class="msg_time_send">8:55 AM, Today</span>
                  </div>
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/testimonials/testimonials-1.jpg" class="rounded-circle user_img_msg">
                  </div>
                </div>
                <div class="d-flex justify-content-start mb-4">
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/basozan.png" class="rounded-circle user_img_msg">
                  </div>
                  <div class="msg_cotainer">
                    <p>몇살이세요?</p>
                    <span class="msg_time">9:00 AM, Today</span>
                  </div>
                </div>
                <div class="d-flex justify-content-end mb-4">
                  <div class="msg_cotainer_send">
                    <p>서른인데.. 아줌마 나이 잘먹지?</p>
                    <span class="msg_time_send">9:05 AM, Today</span>
                  </div>
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/testimonials/testimonials-1.jpg" class="rounded-circle user_img_msg">
                  </div>
                </div>
                <div class="d-flex justify-content-start mb-4">
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/basozan.png" class="rounded-circle user_img_msg">
                  </div>
                  <div class="msg_cotainer">
                    <p>네..</p>
                    <span class="msg_time">9:07 AM, Today</span>
                  </div>
                </div>
                <div class="d-flex justify-content-end mb-4">
                  <div class="msg_cotainer_send">
                    <p>잘가</p>
                    <span class="msg_time_send">9:10 AM, Today</span>
                  </div>
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/testimonials/testimonials-1.jpg" class="rounded-circle user_img_msg">
                  </div>
                </div>
                <div class="d-flex justify-content-start mb-4">
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/basozan.png" class="rounded-circle user_img_msg">
                  </div>
                  <div class="msg_cotainer">
                    <p>그래요....</p>
                    <span class="msg_time">9:12 AM, Today</span>
                  </div>
                </div>
                <div class="d-flex justify-content-end mb-4">
                  <div class="msg_cotainer_send">
                    <p>잘가</p>
                    <span class="msg_time_send">9:10 AM, Today</span>
                  </div>
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/testimonials/testimonials-1.jpg" class="rounded-circle user_img_msg">
                  </div>
                </div>
                <div class="d-flex justify-content-start mb-4">
                  <div class="img_cont_msg">
                    <img src="../resources/assets/img/basozan.png" class="rounded-circle user_img_msg">
                  </div>
                  <div class="msg_cotainer">
                    <p>그래요....</p>
                    <span class="msg_time">9:12 AM, Today</span>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <div class="input-group">
                  <div class="input-group-append">
                    <span class="input-group-text attach_btn"><i class="bi bi-paperclip"></i></span>
                  </div>
                  <textarea name="" class="form-control type_msg" placeholder="메시지를 입력해주세요."></textarea>
                  <div class="input-group-append">
                    <span class="input-group-text send_btn"><i class="bi bi-send"></i></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 신고 Modal -->
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <select name="report" id="reportSelect">
              <option value="abusive">욕설사용</option>
              <option value="advertising">광고글</option>
              <option value="noSubject">주제와 맞지 않는 글</option>
              <option value="violent">폭력적인 내용</option>
              <option value="Discrimination">차별적인 내용</option>
              <option value="pornography">음란물</option>
              <option value="Personal">민감한 개인정보 노출</option>
              <option value="etc">기타 (직접 작성)</option>
            </select>
            <textarea id="customReason" style="display:none" spellcheck="false"></textarea>
            <div>
              <small>게시물을 신고하신 이유를 제출해주시면 관리자 검토 후 조치하겠습니다.</small>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn send-report">보내기</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>

  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="../resources/assets/vendor/aos/aos.js"></script>
  <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>
  <script>
    $(document).ready(function () {
      var chatMessages = $('.chat-info');
      $('#chat_body').scrollTop(chatMessages[0].scrollHeight); // 스크롤을 항상 아래로 이동
      chatMessages.hide();
      $('#action_menu_btn').click(function () {
        $('.action_menu').toggle();
      });
      $('.a_active').on('click', function () {
        // 클릭 시 실행하고 싶은 코드를 추가하세요.
        // $('.chat_none').remove();
        // $('#chat_info_div').append("<div class='chat_none row d-flex justify-content-center align-items-center'><div class='text-center'><img src='../resources/assets/img/jiqooLogo.png'></div><div class='text-center'><p><span style='color:#388E3C'>채채채</span>님 환영합니다!<br>목록을 클릭하여 채팅을 시작해보세요.<p></div></div>");
        $('.chat_none').remove();
        $('.chat-info').show();
      });

    });
    var selectElement = document.getElementById("reportSelect");
    var textareaElement = document.getElementById("customReason");
    selectElement.addEventListener("change", function () {
      if (selectElement.value === "etc") {
        textareaElement.style.display = "block";
      } else {
        textareaElement.style.display = "none";
      }
    });

  </script>
</body>

</html>