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
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.user.domain.Follow;
import com.jiqoo.user.domain.User;
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
	public String insertFollow(
			@RequestParam(value="userId") String toUserId
			, HttpSession session) {
		try {
			String fromUserId = (String) session.getAttribute("userId");
			if (fromUserId != "" && fromUserId != null) {
				Follow follow = new Follow(fromUserId, toUserId);
				int result = followService.insertFollow(follow);
				if(result > 0) {
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
	
	// 프로필사진 변경
	@ResponseBody
	@PostMapping("/updatePhoto")
	public Map<String, Object> updatePhoto(
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, Model model, HttpServletRequest request, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Map<String, Object> response = new HashMap<>();
		try {
			if (userId != "" && userId != null) {
				User user = userService.selectUserOneById(userId);
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
				int result = userService.updateUser(user);
				if(result > 0) {
					System.out.println("프로필 사진 변경 성공");
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
		System.out.println("로그인 유저아이디 : " + userId);
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
				int result = userService.updateUser(user);
				System.out.println(user);
				if (result > 0) {
					model.addAttribute("msg", "회원정보가 수정되었습니다. 다시 로그인해주세요");
					model.addAttribute("url", "/user/login");
					session.invalidate();
					return "common/message";
				} else {
					model.addAttribute("msg", "회원정보가 수정되지 않았습니다.");
					model.addAttribute("url", "/user/modify");
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
	
	// 언팔로우
	@ResponseBody
	@PostMapping("/unfollow")
	public String deleteFollow(
			@RequestParam(value="userId") String toUserId
			, HttpSession session) {
		try {
			String fromUserId = (String) session.getAttribute("userId");
			if (fromUserId != "" && fromUserId != null) {
				Follow follow = new Follow(fromUserId, toUserId);
				int result = followService.deleteFollow(follow);
				if(result > 0) {
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
		if (userId != "" && userId != null) {
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

	// 로그인
	@ResponseBody
	@PostMapping("/login")
	public String selectCheckLogin(@ModelAttribute User user, HttpSession session) {
		User uOne = userService.selectCheckLogin(user);
		if (uOne != null) {
			session.setAttribute("userId", uOne.getUserId());
			session.setAttribute("userNickname", uOne.getUserNickname());
			session.setAttribute("userPhotoPath", uOne.getUserPhotoPath());
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

	// 로그아웃
	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	// 카카오로그인
	@GetMapping("/kakao") 
	public String snsKakaologin(String code, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		  // 전달 받은 code를 사용해서 access_token 받기
		  String accessToken = snsService.getKakaoAccessToken(code);
		  //return받은 access_token으로 사용자 정보 가져오기
		  Map<String, Object> userInfo = snsService.getKakaoInfo(accessToken);
		  
		  String userId = (String)userInfo.get("account_email"); 
		  String userEmail = (String)userInfo.get("account_email"); 
		  String userNickname = (String)userInfo.get("profile_nickname"); 
		  String userGender = (String)userInfo.get("gender"); 
		  String userBirth = (String)userInfo.get("birthday"); 
		  
		  User kakaoUser = userService.selectUserOneById(userId);
		  
		  if(kakaoUser != null) {
			  session.setAttribute("userId", kakaoUser.getUserId());
			  session.setAttribute("userNickname", kakaoUser.getUserNickname());
			  session.setAttribute("userPhotoPath", kakaoUser.getUserPhotoPath());
		  } else {
			  model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
			  model.addAttribute("url", "/");
			  return "common/message";
		  }
		  return "redirec:/";
		}
	 
	
	// 로그인페이지 접속
	@GetMapping("/login")
	public ModelAndView showUserLoginForm(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
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
					//팔로워, 팔로잉 수 & 리스트
					int followersCount = userService.selectFollowersCount(userId);
	                int followingsCount = userService.selectFollowingCount(userId);
					/*
					 * List<Follow> followersList = userService.selectFollowersListById(userId);
					 * List<Follow> followingsList = userService.selectFollowingsListById(userId);
					 */
	                List<User> followersList = userService.selectFollowersListById(userId);
	                List<User> followingsList = userService.selectFollowingsListById(userId);

	                for (User follower : followersList) {
	                	boolean checkFollow = false;
	                    for (User following : followingsList) { // followersList에 있는 사람이 내가 팔로우한 목록(followingsList)에 있는지 확인
	                        if (follower.getUserId().equals(following.getUserId())) {
	                        	checkFollow = true;
	                            break;
	                        }
	                    }
	                    follower.setCheckFollow(checkFollow);
	                }

	                user.setFollowers(followersCount);
	                user.setFollowings(followingsCount);
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
				if(user != null) {
					if(user.getUserInfo() != null) {
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

	public String generateRandomCode() {
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
		File file = new File(savePath+"\\"+fileRename); // 파일 생성
		uploadFile.transferTo(file); // 파일저장
		System.out.println("파일이름 : " + fileName);
		System.out.println("파일리네임 : " + fileRename);
		System.out.println("파일경로 : " + savePath);
		// Map저장
		userPhotoMap.put("fileName", fileName);
		userPhotoMap.put("fileRename", fileRename);
		userPhotoMap.put("filePath", "../resources/puploadFiles/"+fileRename);

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
