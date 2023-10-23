package com.jiqoo.alert.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jiqoo.alert.domain.Alert;

public interface AlertStore {

	/**
	 * 알람등록
	 * @param sqlSession
	 * @param alert
	 * @return
	 */
	Integer insertAlarm(SqlSession sqlSession, Alert alert);

	/**
	 * 알람수
	 * @param sqlSession
	 * @param alert
	 * @return
	 */
	Integer selectAlarmCount(SqlSession sqlSession, String toUserId);

	/**
	 * 알람리스트
	 * @param sqlSession
	 * @param memberId
	 * @return
	 */
	List<Alert> selectAlarmList(SqlSession sqlSession, String memberId);

	/**
	 * 알람리스트 삭제 
	 * @param sqlSession
	 * @param paramMap
	 * @return
	 */
	Integer deleteAlarm(SqlSession sqlSession, Map<String, Object> paramMap);

//	void alramClick(SqlSession sqlSession, String memberId, int boardNo);

}
