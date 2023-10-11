package com.jiqoo.report.service;

import java.util.List;

import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.user.domain.User;

public interface AdminService {

	/**
	 * 회원관리페이지 총게시물수
	 * @return
	 */
	public Integer getListCount();

	/**
	 * 회원관리페이지 유저리스트(+페이징)
	 * @return
	 */
	public List<User> selectAllUser(PageInfo pInfo);

}
