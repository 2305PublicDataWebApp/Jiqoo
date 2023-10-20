package com.jiqoo.moqoo.service.impl;

import java.util.List;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Like;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.domain.MoqooUser;
import com.jiqoo.moqoo.service.MoqooService;
import com.jiqoo.moqoo.store.MoqooStore;
import com.jiqoo.user.domain.User;

@Service
public class MoqooServiceImpl implements MoqooService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MoqooStore moqooStore;
	
	@Override
	public List<Moqoo> showSelectMoqooList() {
		List<Moqoo> moqooList = moqooStore.showSelectMoqooList(sqlSession);
		return moqooList;
	}

	@Override
	public int insertMoqoo(Moqoo moqoo) {
		int mOne = moqooStore.insertMoqoo(sqlSession, moqoo);
		return mOne;
	}

	@Override
	public Moqoo selectOneByNo(Integer moqooNo) {
		Moqoo moqoo = moqooStore.selectOneByNo(sqlSession, moqooNo);
		return moqoo;
	}

	@Override
	public List<Category> selectCategoryList() {
		List<Category> categoryList = moqooStore.selectCategoryList(sqlSession);
		return categoryList;
	}

	@Override
	public Category selectCategoryByNo(String moqooCName) {
		Category category = moqooStore.selectCategoryByNo(sqlSession, moqooCName);
		return category;
	}

	@Override
	public int selectLikeCountByNo(int moqooNo) {
		int result = moqooStore.selectLikeCountByNo(sqlSession, moqooNo);
		return result;
	}

	@Override
	public int updateMoqoo(Moqoo moqoo) {
		int result = moqooStore.updateMoqoo(sqlSession, moqoo);
		return result;
	}

	@Override
	public int deleteMoqoo(int moqooNo) {
		int result = moqooStore.deleteMoqoo(sqlSession, moqooNo);
		return result;
	}

	@Override
	public int insertMoqooPost(MoqooUser moqooUser) {
		int result = moqooStore.insertMoqooPost(sqlSession, moqooUser);
		return result;
	}

	@Override
	public void insertMoqooUser(MoqooUser moqooUser) {
		moqooStore.insertMoqooUser(sqlSession, moqooUser);
	}

	@Override
	public List<MoqooUser> selectMoqooUserList(int refMoqooNo) {
		List<MoqooUser> moqooList = moqooStore.selectMoqooUserList(sqlSession, refMoqooNo);
		return moqooList;
	}

	@Override
	public int updateYesAttend(MoqooUser moqooUser) {
		int result = moqooStore.updateYesAttend(sqlSession, moqooUser);
		return result;
	}

	@Override
	public int selectJoinCount(int refMoqooNo) {
		int moqooJoinCount = moqooStore.selectJoinCount(sqlSession, refMoqooNo );
		return moqooJoinCount;
	}

	@Override
	public int selectOneByMoqooJoin(int moqooNo) {
		int moqooParticipants = moqooStore.selectOneByMoqooJoin(sqlSession, moqooNo);
		return moqooParticipants;
	}

	@Override
	public int clickHeart(Like like) {
		int result = moqooStore.clickHeart(sqlSession, like);
		return result;
	}

	@Override
	public int moqooLikeCount(int refPostNo) {
		int result = moqooStore.moqooLikeCount(sqlSession, refPostNo);
		return result;
	}

	@Override
	public Like selectLikeOne(Like like) {
		Like likeOne = moqooStore.selectLikeOne(sqlSession, like);
		return likeOne;
	}

	@Override
	public int deleteHeart(Like like) {
		int result = moqooStore.deleteHeart(sqlSession, like);
		return result;
	}

	@Override
	public List<Moqoo> selectMoqooAllList() {
		List<Moqoo> moqooList = moqooStore.selectMoqooAllList(sqlSession);
		return moqooList;
	}

	@Override
	public int updateMoqooCount(int moqooNo) {
		return moqooStore.updateMoqooCount(sqlSession, moqooNo);
		
	}
}
