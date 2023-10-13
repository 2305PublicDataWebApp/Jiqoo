package com.jiqoo.admin.service;

import java.util.List;
import java.util.Map;

import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.user.domain.User;

public interface AdminService {
	
	/**
	 * 회원관리페이지 총게시물수
	 * @return
	 */
	public Integer getUserListCount();

	/**
	 * 회원관리페이지 유저리스트(+페이징)
	 * @return
	 */
	public List<User> selectAllUser(PageInfo pInfo);
	
	/**
	 * 회원리스트 검색 총 게시물 수 
	 * @param paramMap
	 * @return
	 */
	public Integer getUserSearchListCount(Map<String, String> paramMap);
	
	/**
	 * 회원 검색결과 리스트(+페이징)
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	public List<User> searchUserByKeyword(PageInfo pInfo, Map<String, String> paramMap);


	/**
	 * 회원 상세조회
	 * @param userId
	 * @return
	 */
	public User selectUserByUserId(String userId);

	/**
	 * 회원 강제탈퇴
	 * @param userId
	 * @return
	 */
	public Integer deleteUserByAdmin(String userId);

	/**
	 * 강퇴회원 부활
	 * @param userId
	 * @return
	 */
	public Integer reviveUserByAdmin(String userId);

	/**
	 * 회원별 총 지꾸수
	 * @return
	 */
	public Integer getUserJiqooListCount(String jiqooWriter);

	/**
	 * 회원별 지꾸 리스트 
	 * @param pInfo
	 * @return
	 */
	public List<Jiqoo> showUserJiqooList(PageInfo pInfoJiqoo, String userId);

	/**
	 * 회원별 모꾸수
	 * @param userId
	 * @return
	 */
	public Integer getUserMoqooListCount(String moqooWriter);

	/**
	 * 회원별 모꾸 리스트 
	 * @param pInfoMoqoo
	 * @param userId
	 * @return
	 */
	public List<Moqoo> showUserMoqooList(PageInfo pInfoMoqoo, String userId);


	

}
