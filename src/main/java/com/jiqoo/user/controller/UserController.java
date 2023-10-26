package com.jiqoo.user.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.domain.User;
import com.jiqoo.user.domain.UserComment;
import com.jiqoo.user.domain.UserJiqooDto;
import com.jiqoo.user.domain.UserLikeDto;
import com.jiqoo.user.domain.UserMoqooDto;
import com.jiqoo.user.service.FollowService;
import com.jiqoo.user.service.SnsService;
import com.jiqoo.user.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private FollowService followService;
	@Autowired
	private SnsService snsService;
	@Autowired
	private JavaMailSenderImpl mailSender;

	// 회원가입
	@PostMapping("/register")
	public ModelAndView insertUser(ModelAndView mv, @ModelAttribute User user,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {
		try {
			if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				// saveFile메소드가 Map에 파일정보 저장함
				Map<String, Object> userPhotoMap = this.saveFile(request, uploadFile);
				// setter메소드로 파일 정보 저장
				user.setUserPhotoName((String) userPhotoMap.get("fileName"));
				user.setUserPhotoRename((String) userPhotoMap.get("fileRename"));
				user.setUserPhotoPath((String) userPhotoMap.get("filePath"));
			}
			if (user.getUserInfo() != null && !user.getUserInfo().equals("")) {
				String info = user.getUserInfo().replace("\r\n", "<br>");
				user.setUserInfo(info);
			}
			int result = userService.insertUser(user);
			if (result > 0) {
				System.out.println("회원가입 성공");
				mv.addObject("msg", "지꾸의 회원이 되신 것을 환영합니다!");
				mv.addObject("url", "/");
				mv.setViewName("common/message");
				return mv;
			} else {
				System.out.println("회원가입 실패");
				mv.addObject("msg", "회원가입에 실패했습니다. 다시 시도해주세요.");
				mv.setViewName("common/message");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "회원가입에 실패했습니다. 다시 시도해주세요.");
			mv.addObject("url", "user/register");
			mv.setViewName("common/message");
			return mv;
		}
	}

	// 팔로우
	@ResponseBody
	@PostMapping("/follow")
	public String insertFollow(@RequestParam(value = "toFollowUserId") String toUserId, HttpSession session) {
		try {
			System.out.println("팔로우받는 유저 : " + toUserId);
			String fromUserId = (String) session.getAttribute("userId");
			if (fromUserId != "" && fromUserId != null) {
				Follow follow = new Follow(fromUserId, toUserId);
				int result = followService.insertFollow(follow);
				if (result > 0) {
					System.out.println("팔로우성공");
					return "success";
				} else {
					System.out.println("팔로우실패");
					return "fail";
				}
			} else {
				System.out.println("로그인정보없음");
				return "checkLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	// 회원 신고
	@ResponseBody
	@GetMapping("/report")
	public String insertUserReport(@ModelAttribute Report report) {
		System.out.println(report);
		try {
			int result = userService.insertUserReport(report);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	// 프로필사진 변경
	@ResponseBody
	@PostMapping("/updatePhoto")
	public Map<String, Object> updatePhoto(
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, Model model,
			HttpServletRequest request, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Map<String, Object> response = new HashMap<>();
		Map<String, Object> userPhotoMap = new HashMap<>();
		try {
			if (userId != "" && userId != null) {
				User user = userService.selectUserOneById(userId);
				if (uploadFile != null && !uploadFile.isEmpty()) {
					// 기존 프사 존재 여부 확인
					String fileName = user.getUserPhotoRename();
					if (fileName != null) { // 있으면 삭제
						this.deleteFile(request, fileName);
					}
					userPhotoMap = this.saveFile(request, uploadFile);
					user.setUserPhotoName((String) userPhotoMap.get("fileName"));
					user.setUserPhotoRename((String) userPhotoMap.get("fileRename"));
					user.setUserPhotoPath((String) userPhotoMap.get("filePath"));
				}
				int result = userService.updateUserPhoto(user);
				if (result > 0) {
					System.out.println("프로필 사진 변경 성공");
				    session.setAttribute("userPhotoPath", user.getUserPhotoPath());
					response.put("success", "success");
				} else {
					System.out.println("프로필 사진 변경 실패");
					response.put("fail", "fail");
				}
			} else {
				System.out.println("세션에 로그인 정보 없음");
				response.put("checkLogin", "checkLogin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	// 비밀번호 변경
	@ResponseBody
	@PostMapping("/updatePw")
	public Map<String, Object> updatePw(@RequestParam(value = "userPw") String userPw, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		User user = new User(userId, userPw);
		Map<String, Object> response = new HashMap<>();
		try {
			if (userId != "" && userId != null) {
				int result = userService.updateUserPw(user);
				if (result > 0) {
					System.out.println("비밀번호 변경 성공");
					response.put("success", "success");
					session.invalidate();
				} else {
					System.out.println("비밀번호 변경 실패");
					response.put("fail", "fail");
				}
			} else {
				System.out.println("세션에 로그인 정보 없음");
				response.put("checkLogin", "checkLogin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	// 회원정보 수정
	@PostMapping("/update")
	public String updateUser(@ModelAttribute User user,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, Model model,
			HttpServletRequest request, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		String platformType = (String) session.getAttribute("platformType");
		System.out.println("로그인 유저아이디 : " + userId);
		int result = -1;
		try {
			if (userId != "" && userId != null) {
				if (uploadFile != null && !uploadFile.isEmpty()) {
					// 기존 프사 존재 여부 확인
					String fileName = user.getUserPhotoRename();
					if (fileName != null) { // 있으면 삭제
						this.deleteFile(request, fileName);
					}
					Map<String, Object> userPhotoMap = this.saveFile(request, uploadFile);
					user.setUserPhotoName((String) userPhotoMap.get("fileName"));
					user.setUserPhotoRename((String) userPhotoMap.get("fileRename"));
					user.setUserPhotoPath((String) userPhotoMap.get("filePath"));
				}

				if (user.getUserInfo() != null && !user.getUserInfo().equals("")) {
					String info = user.getUserInfo().replace("\r\n", "<br>");
					user.setUserInfo(info);
				}
				
				if(platformType.equals("normal")) {
					result = userService.updateUser(user);
				} else {
					result = userService.updateSnsUser(user);
				}
				System.out.println(user);
				if (result > 0) {
					model.addAttribute("msg", "회원정보가 수정되었습니다. 다시 로그인해주세요");
					model.addAttribute("url", "/user/login");
					session.invalidate();
					return "common/message";
				} else {
					if(platformType.equals("normal")) {
						model.addAttribute("msg", "회원정보가 수정되지 않았습니다.");
						model.addAttribute("url", "/user/modify");
						return "common/message";
					} else {
						model.addAttribute("msg", "회원정보가 수정되지 않았습니다.");
						model.addAttribute("url", "/user/modifySns");
						return "common/message";
					}
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
				model.addAttribute("url", "/user/login");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "[서비스실패] 관리자 문의바랍니다.");
			model.addAttribute("url", "/");
			return "common/message";
		}
	}

	
	// 언팔로우
	@ResponseBody
	@PostMapping("/unfollow")
	public String deleteFollow(@RequestParam(value = "toFollowUserId") String toUserId, HttpSession session) {
		try {
			System.out.println("언팔로우받는 유저 : " + toUserId);
			String fromUserId = (String) session.getAttribute("userId");
			if (fromUserId != "" && fromUserId != null) {
				Follow follow = new Follow(fromUserId, toUserId);
				int result = followService.deleteFollow(follow);
				if (result > 0) {
					System.out.println("언팔성공");
					return "success";
				} else {
					System.out.println("언팔실패");
					return "fail";
				}
			} else {
				System.out.println("로그인정보없음");
				return "checkLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	// 프로필 사진 삭제
	@ResponseBody
	@GetMapping("/deletePhoto")
	public String deletePhoto(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		int result = userService.deletePhoto(userId);
		if(result > 0) {
			session.setAttribute("userPhotoPath", null);
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 회원탈퇴 실행
	@ResponseBody
	@GetMapping("/delete")
	public int deleteUser(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		int result = userService.deleteUser(userId);
		if (result > 0) {
			session.invalidate();
			System.out.println("회원탈퇴 성공");
			return result;
		} else {
			System.out.println("회원탈퇴 실패");
			return result;
		}
	}

	// 카카오 회원탈퇴
	@ResponseBody
	@RequestMapping(value = "/kakaoUnlink")
	public String deleteKakaoUser(HttpSession session) {
		String accessToken = (String) session.getAttribute("accessToken");
		String userId = (String) session.getAttribute("userId");
		int responseCode = snsService.deleteKakaoUser(accessToken);
		if (responseCode == 200) { // 카카오 탈퇴 성공->DB삭제진행
			if (userId != null && userId != "") {
				Map<String, Object> snsIdMap = new HashMap<>(); // sns 가입 유저 확인을 위한 map생성
				snsIdMap.put("userId", userId);
				snsIdMap.put("platformType", "kakao");
		        
				int result = userService.deleteSnsUser(snsIdMap);
				if (result > 0) {
					session.invalidate();
					System.out.println("카카오 회원 DB삭제 성공");
					return "success";
				} else {
					System.out.println("카카오 회원 DB삭제 실패");
					return "fail";
				}
			} else {
				System.out.println("로그인 정보 없음");
				return "checkLogin";
			}
		} else {
			System.out.println("카카오 탈퇴 실패 : 에러확인");
			return "fail";
		}
	}

	// 네이버 회원탈퇴
	@ResponseBody
	@RequestMapping(value = "/naverUnlink")
	public String deleteNaverUser(HttpSession session) {
		String accessToken = (String) session.getAttribute("accessToken");
		String userId = (String) session.getAttribute("userId");
		int responseCode = snsService.deleteNaverUser(accessToken);
		if (responseCode == 200) { // 네이버 탈퇴 성공->DB삭제진행
			if (userId != null && userId != "") {
				Map<String, Object> snsIdMap = new HashMap<>(); // sns 가입 유저 확인을 위한 map생성
				snsIdMap.put("userId", userId);
				snsIdMap.put("platformType", "naver");
		        
				int result = userService.deleteSnsUser(snsIdMap);
				if (result > 0) {
					session.invalidate();
					System.out.println("네이버 회원 DB삭제 성공");
					return "success";
				} else {
					System.out.println("네이버 회원 DB삭제 실패");
					return "fail";
				}
			} else {
				System.out.println("로그인 정보 없음");
				return "checkLogin";
			}
		} else {
			System.out.println("네이버 탈퇴 실패 : 에러확인");
			return "fail";
		}
	}

	// 회원탈퇴 유효성체크
	@ResponseBody
	@PostMapping("/delValidate")
	public Map<String, Object> selectDelValidate(@RequestParam(value = "inputId") String inputId,
			@RequestParam(value = "inputPw") String inputPw, HttpSession session) {
		System.out.println("인풋아이디 " + inputId + " 인풋비밀번호 : " + inputPw);
		String userId = (String) session.getAttribute("userId");
		User user = userService.selectUserOneById(userId);
		String userPw = user.getUserPw();
		Map<String, Object> response = new HashMap<>();
		if (userId != null && userId != "") {
			if (userId.equals(inputId) && userPw.equals(inputPw)) {
				response.put("isValidate", true);
			} else {
				response.put("isValidate", false);
			}
		} else {
			response.put("checkLogin", "checkLogin");
		}
		return response;
	}

	// 비밀번호찾기
	@ResponseBody
	@PostMapping("/findPw")
	public String selectFindPw(@ModelAttribute User user) {
		User uOne = userService.selectFindPw(user);
		if (uOne != null) {
			String result = "입력하신 이메일로 임시비밀번호를 발송했습니다.<br>임시번호로 로그인해주세요.";
			String inputEmail = user.getUserEmail();
			String tempPw = this.sendEmail(inputEmail);
			if (tempPw != "") {
				user.setUserPw(tempPw);
				int tempPwResult = userService.updateUserPw(user);
				if (tempPwResult > 0) {
					System.out.println("임시비밀번호 변경완료");
					return result;
				} else {
					System.out.println("실패");
					return "fail";
				}
			} else {
				System.out.println("이메일 전송 실패");
				return "fail";
			}
		} else {
			System.out.println("정보없음");
			return "fail";
		}
	}

	// id찾기
	@ResponseBody
	@PostMapping("/findId")
	public String selectFindId(@ModelAttribute User user) {
		User uOne = userService.selectFindId(user);
		if (uOne != null) {
			String userId = uOne.getUserId();
			return userId;
		} else {
			return "fail";
		}
	}

	// 카카오로그인
	@RequestMapping("/kakao")
	public String selectKakaologin(String code, Model model, HttpServletRequest request, HttpSession session)
			throws Exception {
		// 전달 받은 code를 사용해서 access_token 받기
		String accessToken = snsService.getKakaoAccessToken(code);
		// return받은 access_token으로 사용자 정보 가져오기
		Map<String, Object> kakaoUserInfo = snsService.getKakaoInfo(accessToken);
		// HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken); **Map <->
		// HashMap 나중에 확인
		System.out.println("카카오유저인포 : " + kakaoUserInfo);
		String userEmail = (String) kakaoUserInfo.get("userEmail");
		// System.out.println("카카오 userId : " + userId);
		Map<String, Object> snsEmailMap = new HashMap<>(); // sns 가입 유저 확인을 위한 map생성
        snsEmailMap.put("userEmail", userEmail);
        snsEmailMap.put("platformType", "kakao");
        
		User kakaoUser = userService.selectSnsUserByEmail(snsEmailMap);
		// 회원가입한 카카오 유저있으면 로그인성공->세션저장
		if (kakaoUser != null) {
			//System.out.println("세션저장 accessToken : " + accessToken);
			session.setAttribute("accessToken", accessToken); // accessToken 세션저장
			session.setAttribute("platformType", kakaoUser.getPlatformType());
			session.setAttribute("userId", kakaoUser.getUserId());
			session.setAttribute("userEmail", kakaoUser.getUserEmail());
			session.setAttribute("userNickname", kakaoUser.getUserNickname());
			session.setAttribute("userPhotoPath", kakaoUser.getUserPhotoPath());
			session.setAttribute("adminYn", kakaoUser.getAdminYn());
			System.out.println("카카오 로그인 성공");
			model.addAttribute("msg", "카카오 회원가입 완료");
			model.addAttribute("url", "/");
			return "common/message";
		} else {
			System.out.println("카카오 로그인 실패");
			model.addAttribute("msg", "카카오 로그인 실패");
			model.addAttribute("url", "/");
			return "common/message";
		}
	}

	// 네이버 로그인
	@ResponseBody
	@PostMapping("/naver")
	public String selectNaverLogin(@RequestBody Map<String, Object> naverUserInfo, HttpSession session) {
		try {
			// userInfo 맵을 통해 JSON 데이터의 필드에 접근
			// 이메일로 사용자 정보 가져오기
			String accessToken = (String) naverUserInfo.get("accessToken");
			String id = (String) naverUserInfo.get("id");
			String userName = (String) naverUserInfo.get("userName");
			String userNickname = (String) naverUserInfo.get("userNickname");
			String userEmail = (String) naverUserInfo.get("userEmail");
			String userGender = (String) naverUserInfo.get("userGender");
//			String birthday = (String) naverUserInfo.get("birthday");
//			String birthyear = (String) naverUserInfo.get("birthyear");
			
			Map<String, Object> snsEmailMap = new HashMap<>(); // sns 가입 유저 확인을 위한 map생성
	        snsEmailMap.put("userEmail", userEmail);
	        snsEmailMap.put("platformType", "naver");
	        
			User naverUser = userService.selectSnsUserByEmail(snsEmailMap);
			if(naverUser == null) {
				String userId = "naver";
	        	userId += this.generateRandomCode();
				String userPw = this.generateRandomCode();
				//User naverUserInsert = new User(userId, userPw, userName, userNickname, userEmail, userGender);
				User naverUserInsert = new User(userId, userPw, userName, userNickname, userEmail, userGender);
				//************************** 인서트 코드 추가 ****************************************
				int insertResult = userService.insertUser(naverUserInsert);
				if(insertResult > 0) {
					System.out.println("네이버 회원가입 성공");
				}
				return "insert";
			} else {
				System.out.println("세션저장 accessToken : " + accessToken);
				session.setAttribute("accessToken", accessToken); // accessToken 세션저장
				session.setAttribute("platformType", naverUser.getPlatformType());
				session.setAttribute("userId", naverUser.getUserId());
				session.setAttribute("userEmail", naverUser.getUserEmail());
				session.setAttribute("userNickname", naverUser.getUserNickname());
				session.setAttribute("userPhotoPath", naverUser.getUserPhotoPath());
				session.setAttribute("adminYn", naverUser.getAdminYn());
				System.out.println("네이버 로그인 성공");
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	// 로그인
	@ResponseBody
	@PostMapping("/login")
	public String selectCheckLogin(@ModelAttribute User user, HttpSession session) {
		User uOne = userService.selectCheckLogin(user);
		if (uOne != null) {
			session.setAttribute("userId", uOne.getUserId());
			session.setAttribute("userEmail", uOne.getUserEmail());
			session.setAttribute("userNickname", uOne.getUserNickname());
			session.setAttribute("userPhotoPath", uOne.getUserPhotoPath());
			session.setAttribute("platformType", uOne.getPlatformType());
			session.setAttribute("adminYn", uOne.getAdminYn());
			return "true";
		} else {
			return "false";
		}
	}

	// ID 중복 체크
	@ResponseBody
	@GetMapping("/userIdCheck")
	public int selectCheckId(@RequestParam(value = "userId") String userId) {
		int idCheck = userService.selectCheckId(userId);
		return idCheck;
	}

	// 닉네임 중복 체크
	@ResponseBody
	@GetMapping("/userNicknameCheck")
	public int selectCheckNickname(@RequestParam(value = "userNickname") String userNickname) {
		int nicknameCheck = userService.selectCheckNickname(userNickname);
		return nicknameCheck;
	}

	// 이메일 중복, 인증체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public Map<String, Object> selectCheckEmail(@RequestParam(value = "userEmail") String userEmail) {
		Map<String, Object> response = new HashMap<>();
		int emailCheck = userService.selectCheckEmail(userEmail);
		if (emailCheck == 0) { // 중복x
			String checkCode = this.sendEmail(userEmail);
			response.put("isDuplicate", false);
			response.put("checkCode", checkCode);
		} else {
			response.put("isDuplicate", true);
		}
		return response;
	}

	// 카카오로그아웃
//	@GetMapping("/kakaoLogout")
//	public String kakaoUserLogout(HttpSession session) {
//		String accessToken = ((String) session.getAttribute("accessToken"));
//		int responseCode = snsService.kakaoLogout(accessToken);
//		if (responseCode == 200) { // 카카오로그아웃 성공
//			session.removeAttribute(accessToken);
//			session.invalidate();
//			System.out.println("카카오 로그아웃 성공");
//		}
//		return "redirect:/";
//	} 

	
	// 로그아웃
	@GetMapping("/logout")
	public String userLogout(Model model, HttpSession session) {
		if (session != null) {
			session.invalidate();
			model.addAttribute("msg", "로그아웃이 완료되었습니다.");
			model.addAttribute("url", "/");
		}
		return "common/message";
	}

	// 로그인페이지 접속
	@GetMapping("/login")
	public ModelAndView showUserLoginForm(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}

	// 네이버 콜백페이지 접속
	@GetMapping("/naverCallback")
	public ModelAndView showNaverCallback(ModelAndView mv) {
		mv.setViewName("user/naverCallback");
		return mv;
	}
	
	// 프로필페이지 지꾸 리스트 조회
	@ResponseBody
	@PostMapping("/jiqooList")
	public List<UserJiqooDto> showUserJiqooList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("userId") String userId
			, @RequestParam("searchDate") String searchDate) {
		Map<String, Object> jiqooMap = new HashMap<>();
		jiqooMap.put("userId", userId);
		jiqooMap.put("startNo", startNo);
		jiqooMap.put("endNo", endNo);
		jiqooMap.put("searchDate", searchDate);
		List<UserJiqooDto> jiqooList = userService.selectMyJiqooList(jiqooMap);
		return jiqooList;
	}
	
	// 마이페이지 지꾸 리스트 조회
	@ResponseBody
	@PostMapping("/myJiqooList")
	public List<UserJiqooDto> showMyJiqooList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("searchDate") String searchDate
			, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> jiqooMap = new HashMap<>();
		jiqooMap.put("userId", userId);
		jiqooMap.put("startNo", startNo);
		jiqooMap.put("endNo", endNo);
		jiqooMap.put("searchDate", searchDate);

		List<UserJiqooDto> myjiqooList = userService.selectMyJiqooList(jiqooMap);
		return myjiqooList;
	}
	
	// 프로필페이지 모꾸 리스트 조회
	@ResponseBody
	@GetMapping("/moqooList")
	public List<UserMoqooDto> showMoqooList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("userId") String userId
			, @RequestParam("searchDate") String searchDate) {
		Map<String, Object> moqooMap = new HashMap<>();
		moqooMap.put("userId", userId);
		moqooMap.put("startNo", startNo);
		moqooMap.put("endNo", endNo);
		moqooMap.put("searchDate", searchDate);
		List<UserMoqooDto> jiqooList = userService.selectMyMoqooList(moqooMap);
		return jiqooList;
	}
	
	// 마이페이지 모꾸 리스트 조회
	@ResponseBody
	@GetMapping("/myMoqooList")
	public List<UserMoqooDto> showMoqooList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("searchDate") String searchDate
			, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> moqooMap = new HashMap<>();
		moqooMap.put("userId", userId);
		moqooMap.put("startNo", startNo);
		moqooMap.put("endNo", endNo);
		moqooMap.put("searchDate", searchDate);
		List<UserMoqooDto> jiqooList = userService.selectMyMoqooList(moqooMap);
		return jiqooList;
	}
	
	// 프로필페이지 댓글 리스트 조회
	@ResponseBody
	@GetMapping("/comtList")
	public List<UserComment> showComtList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("userId") String userId
			, @RequestParam("searchDate") String searchDate) {
		Map<String, Object> comtMap = new HashMap<>();
		comtMap.put("userId", userId);
		comtMap.put("startNo", startNo);
		comtMap.put("endNo", endNo);
		comtMap.put("searchDate", searchDate);
	    
		List<UserComment> commentList = userService.selectMyCommentList(comtMap);

		return commentList;
	}
	
	// 마이페이지 댓글 리스트 조회
	@ResponseBody
	@GetMapping("/myComtList")
	public List<UserComment> showMyComtList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("searchDate") String searchDate
			, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> comtMap = new HashMap<>();
		comtMap.put("userId", userId);
		comtMap.put("startNo", startNo);
		comtMap.put("endNo", endNo);
		comtMap.put("searchDate", searchDate);
		List<UserComment> commentList = userService.selectMyCommentList(comtMap);

		return commentList;
	}
	
	// 프로필페이지 좋아요 리스트 조회
	@ResponseBody
	@GetMapping("/likedList")
	public List<UserLikeDto> showLikedList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("userId") String userId
			, @RequestParam("searchDate") String searchDate) {
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("userId", userId);
		likeMap.put("startNo", startNo);
		likeMap.put("endNo", endNo);
		likeMap.put("searchDate", searchDate);
		List<UserLikeDto> likedList = userService.selectMyLikedPostList(likeMap);
		return likedList;
	}
	
	// 마이페이지 좋아요 리스트 조회
	@ResponseBody
	@GetMapping("/myLikedList")
	public List<UserLikeDto> showMyLikedList(
			@RequestParam("startNo") int startNo
			, @RequestParam("endNo") int endNo
			, @RequestParam("searchDate") String searchDate
			, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("userId", userId);
		likeMap.put("startNo", startNo);
		likeMap.put("endNo", endNo);
		likeMap.put("searchDate", searchDate);
		List<UserLikeDto> likedList = userService.selectMyLikedPostList(likeMap);
		return likedList;
	}
	
	// 프로필페이지 접속
	@GetMapping("/profile")
	public String showMyPage(@RequestParam(value="userId") String userId, Model model, HttpSession session) {
		try {
			String loginUserId = (String) session.getAttribute("userId");
			User user = null;
			if (userId != "" && userId != null) {
				user = userService.selectUserOneById(userId);
				if (user != null) {
					// 팔로워, 팔로잉 수 & 리스트
					int followersCount = userService.selectFollowersCount(userId);
					int followingsCount = userService.selectFollowingCount(userId);
					// 프로필페이지 사용자의 팔로워, 팔로잉 리스트
					List<User> followersList = userService.selectFollowersListById(userId);
					List<User> followingsList = userService.selectFollowingsListById(userId);

					// 로그인 유저의 팔로잉 리스트
					List<User> loginUserFollowingsList = userService.selectFollowingsListById(loginUserId);
					boolean checkIsFollow = false;
					for(User loginUserFollowingCheck : loginUserFollowingsList) {
						if(loginUserFollowingCheck.getUserId().equals(userId)) {
							checkIsFollow = true;
							break;
						}
					}
					user.setCheckIsFollow(checkIsFollow);
					System.out.println("내가 팔로우 중? : " + checkIsFollow);
					// 사용자(test01)의 팔로워 및 팔로잉 상태 설정
					for (User follower : followersList) {
					    follower.setCheckIsFollow(isFollowingUser(loginUserFollowingsList, follower.getUserId()));
					}
					for (User following : followingsList) {
					    following.setCheckIsFollow(isFollowingUser(loginUserFollowingsList, following.getUserId()));
					}


					
					// 지꾸 모꾸 게시글 수 조회
					int jiqooCount = userService.selectMyJiqooCount(userId);
					int moqooCount = userService.selectMyMoqooCount(userId);

					// 댓글 수 조회
					int comtCount = userService.selectMyCommentCount(userId);
					
					user.setFollowers(followersCount);
					user.setFollowings(followingsCount);
					user.setJiqooCount(jiqooCount);
					user.setMoqooCount(moqooCount);
					user.setComtCount(comtCount);
					model.addAttribute("user", user);
					model.addAttribute("followersList", followersList);
					model.addAttribute("followingsList", followingsList);
					return "user/profile";
				} else {
					model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
					model.addAttribute("url", "/");
					return "common/message";
				}
			} else {
				model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
				model.addAttribute("url", "/");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "[서비스실패] 관리자 문의바랍니다.");
			model.addAttribute("url", "/");
			return "common/message";
		}
	}

	// 유저가 팔로우 중인지 체크하는 함수
	private boolean isFollowingUser(List<User> followingsList, String targetUserId) {
	    for (User user : followingsList) {
	        if (user.getUserId().equals(targetUserId)) {
	            return true;
	        }
	    }
	    return false;
	}

	
	// 마이페이지 접속
	@GetMapping("/myPage")
	public String showMyPage(Model model, HttpSession session) {
		try {
			String userId = (String) session.getAttribute("userId");
			User user = null;
			if (userId != "" && userId != null) {
				user = userService.selectUserOneById(userId);
				if (user != null) {
					// 팔로워, 팔로잉 수 & 리스트
					int followersCount = userService.selectFollowersCount(userId);
					int followingsCount = userService.selectFollowingCount(userId);

					List<User> followersList = userService.selectFollowersListById(userId);
					List<User> followingsList = userService.selectFollowingsListById(userId);
					for (User follower : followersList) {
						boolean checkIsFollow = false;
						for (User following : followingsList) { // followersList에 있는 사람이 내가 팔로우한 목록(followingsList)에 있는지
																// 확인
							if (follower.getUserId().equals(following.getUserId())) {
								checkIsFollow = true;
								break;
							}
						}
						follower.setCheckIsFollow(checkIsFollow);
					}

					
					// 지꾸 모꾸 게시글 수 조회
					int jiqooCount = userService.selectMyJiqooCount(userId);
					int moqooCount = userService.selectMyMoqooCount(userId);

					// 댓글 수 조회
					int comtCount = userService.selectMyCommentCount(userId);
					
					user.setFollowers(followersCount);
					user.setFollowings(followingsCount);
					user.setJiqooCount(jiqooCount);
					user.setMoqooCount(moqooCount);
					user.setComtCount(comtCount);
					model.addAttribute("user", user);
					model.addAttribute("followersList", followersList);
					model.addAttribute("followingsList", followingsList);
					return "user/myPage";
				} else {
					model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
					model.addAttribute("url", "/");
					return "common/message";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
				model.addAttribute("url", "/user/login");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "[서비스실패] 관리자 문의바랍니다.");
			model.addAttribute("url", "/");
			return "common/message";
		}
	}

	// 회원가입페이지 접속
	@GetMapping("/register")
	public ModelAndView showRegisterForm(ModelAndView mv) {
		mv.setViewName("user/register");
		return mv;
	}

	// 수정페이지 접속
	@GetMapping("/modify")
	public String showModifyForm(Model model, HttpSession session) {
		try {
			String userId = (String) session.getAttribute("userId");
			User user = null;
			if (userId != "" && userId != null) {
				user = userService.selectUserOneById(userId);
				if (user != null) {
					if (user.getUserInfo() != null) {
						String info = user.getUserInfo().replace("<br>", "\r\n");
						user.setUserInfo(info);
					}
					model.addAttribute("user", user);
					return "user/modify";
				} else {
					model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
					model.addAttribute("url", "/");
					return "common/message";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
				model.addAttribute("url", "/user/login");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "[서비스실패] 관리자 문의바랍니다.");
			model.addAttribute("url", "/");
			return "common/message";
		}
	}

	// 수정페이지 접속
	@GetMapping("/modifySns")
	public String showModifySnsForm(Model model, HttpSession session) {
		try {
			String userId = (String) session.getAttribute("userId");
			User user = null;
			if (userId != "" && userId != null) {
				user = userService.selectUserOneById(userId);
				if (user != null) {
					if (user.getUserInfo() != null) {
						String info = user.getUserInfo().replace("<br>", "\r\n");
						user.setUserInfo(info);
					}
					model.addAttribute("user", user);
					return "user/modifySns";
				} else {
					model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
					model.addAttribute("url", "/");
					return "common/message";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
				model.addAttribute("url", "/user/login");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "[서비스실패] 관리자 문의바랍니다.");
			model.addAttribute("url", "/");
			return "common/message";
		}
	}
	
	
	// 인증메일 발송
	private String sendEmail(String userEmail) {
		// 랜덤한 인증 번호 생성
		String randomCode = this.generateRandomCode();
		System.out.println("인증번호 : " + randomCode);
		// 이메일 양식
		String setFrom = "jiqoofinal@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = userEmail;
		String title = "[지꾸] 이메일 인증번호"; // 이메일 제목
		String content = "<div align='center' style='border:1px solid black; padding:10px;'>" +
		/* "<img src="" style=\"margin: 30px;\"><br>" + */
				"<h1 style='color:black'>지꾸에서 발송한 인증번호입니다.</h1>" + "<h1 style='color:black'>인증을 완료해주세요!</h1>" + "<br>"
				+ "<h1 style='color:blue'>" + randomCode + "</h3>" + "<br>" + "</div>";

		// 이메일 전송
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return randomCode;
	}

	private String generateRandomCode() {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder code = new StringBuilder();
		Random random = new Random();

		for (int i = 0; i < 10; i++) {
			int index = random.nextInt(characters.length());
			char randomChar = characters.charAt(index);
			code.append(randomChar);
		}

		return code.toString();
	}

	// 프로필사진 저장 메소드
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		Map<String, Object> userPhotoMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 저장폴더에 파일 저장->업로드 파일 경로생성
		String savePath = root + "\\puploadFiles";
		// 파일명 저장
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 파일리네임
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = "p" + sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
		// 저장폴더 없을 경우 생성
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		// 파일저장
		File file = new File(savePath + "\\" + fileRename); // 파일 생성
		uploadFile.transferTo(file); // 파일저장
		System.out.println("파일이름 : " + fileName);
		System.out.println("파일리네임 : " + fileRename);
		System.out.println("파일경로 : " + savePath);
		// Map저장
		userPhotoMap.put("fileName", fileName);
		userPhotoMap.put("fileRename", fileRename);
		userPhotoMap.put("filePath", "../resources/puploadFiles/" + fileRename);

		return userPhotoMap;
	}

	// 기존 사진 삭제
	private void deleteFile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilepath = root + "\\puploadFiles\\" + fileName;
		File file = new File(delFilepath);
		if (file.exists()) {
			file.delete();
		}
	}
}
