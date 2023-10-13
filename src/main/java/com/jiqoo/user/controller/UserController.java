package com.jiqoo.user.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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

import com.jiqoo.user.domain.User;
import com.jiqoo.user.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSenderImpl mailSender;

	// 회원가입
	@PostMapping("/register")
	public ModelAndView insertUser(
			ModelAndView mv
			, @ModelAttribute User user
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
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
			int result = userService.insertUser(user);
			if (result > 0) {
				System.out.println("회원가입완료");
				mv.addObject("msg", "회원가입 성공");
				mv.addObject("url", "/");
				mv.setViewName("common/result");
				return mv;
			} else {
				System.out.println("회원가입실패");
				mv.addObject("msg", "회원가입 실패");
				mv.setViewName("common/result");
				return mv;
			}
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "회원가입 실패");
			mv.addObject("url", "user/register");
			mv.setViewName("common/result");
			return mv;
		}
	}
	// 비밀번호찾기
	@ResponseBody
	@PostMapping("/findPw")
	public String selectFindPw(@ModelAttribute User user) {
		User uOne = userService.selectFindPw(user);
		if(uOne != null) {
			String result = "입력하신 이메일로 임시비밀번호를 발송했습니다.<br>임시번호로 로그인해주세요.";
			String inputEmail = user.getUserEmail();
			String tempPw = this.sendEmail(inputEmail);
			if(tempPw != "") {
				user.setUserPw(tempPw);
				int tempPwResult = userService.updateUserPw(user);
				if(tempPwResult > 0) {
					System.out.println("임시비밀번호 변경완료");
				} else {
					System.out.println("실패");
				}
			} else {
				System.out.println("이메일 전송 실패");
			}
			return result;
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
		if(uOne != null) {
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
			session.setAttribute("userNickName", uOne.getUserNickname());
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

	// 로그인페이지 접속
	@GetMapping("/login")
	public ModelAndView showUserLoginForm(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}

	// 마이페이지 접속
	@GetMapping("/myPage")
	public String showMyPage(
			Model model
			, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			User user = null;
			if(userId != "" && userId != null) {
				user = userService.selectUserOneById(userId);
				if(user != null) {
					model.addAttribute("user", user);
					return "user/myPage";
				} else {
					model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
					model.addAttribute("url", "/");
					return "common/result";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
				model.addAttribute("url", "/user/login");
				return "common/result";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "[서비스실패] 관리자 문의바랍니다.");
			model.addAttribute("url", "/");
			return "common/result";
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
	public String showModifyForm(Model model
			, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			User user = null;
			if(userId != "" && userId != null) {
				user = userService.selectUserOneById(userId);
				if(user != null) {
					model.addAttribute("user", user);
					return "user/modify";
				} else {
					model.addAttribute("msg", "회원정보를 불러올 수 없습니다.");
					model.addAttribute("url", "/");
					return "common/result";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
				model.addAttribute("url", "/user/login");
				return "common/result";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "[서비스실패] 관리자 문의바랍니다.");
			model.addAttribute("url", "/");
			return "common/result";
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
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception{
		Map<String, Object> userPhotoMap = new HashMap<String, Object>();
		// 1. 파일명 저장
		String fileName = uploadFile.getOriginalFilename();
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 업로드파일 저장할 폴더경로 변수 저장
		String saveFolder = root + "\\puploadFiles";
		// 저장폴더 없을 경우 생성
		File folder = new File(saveFolder);
		if (!folder.exists()) {
			folder.mkdir();
		}
		// 2. 파일리네임
		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = "p" + sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
	
		// 3. 저장폴더에 파일 저장->업로드 파일 경로생성
		String savePath = saveFolder + "\\" + fileRename;
		File file = new File(savePath); // 파일 생성
		uploadFile.transferTo(file); // 파일저장
	
		// 4. Map저장
		userPhotoMap.put("fileName", fileName);
		userPhotoMap.put("fileRename", fileRename);
		userPhotoMap.put("filePath", savePath);
	
		return userPhotoMap;
	}
}
