package com.jiqoo.jiqoo.service;

import java.util.List;

import com.jiqoo.common.domain.Category;
import com.jiqoo.jiqoo.domain.Jiqoo;

public interface JiqooService {

	/**
	 * 지꾸게시물 작성 Service
	 * @param jiqoo
	 * @return
	 */
	int insertJiqoo(Jiqoo jiqoo);

	/**
	 * 카테고리 리스트 불러오기 Service
	 * @return
	 */
	List<Category> selectCategoryList();

}
