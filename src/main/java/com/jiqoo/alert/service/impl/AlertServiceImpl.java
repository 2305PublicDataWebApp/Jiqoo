package com.jiqoo.alert.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.alert.domain.Alert;
import com.jiqoo.alert.service.AlertService;
import com.jiqoo.alert.store.AlertStore;

@Service
public class AlertServiceImpl implements AlertService{
	@Autowired
	private AlertStore alertStore;
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 알람등록
	 */
	@Override
	public Integer insertAlarm(Alert alert) {
		Integer result = alertStore.insertAlarm(sqlSession, alert);
		return result;
	}

	/**
	 * 알람수
	 */
	@Override
	public Integer selectAlarmCount(String toUserId) {
		Integer result = alertStore.selectAlarmCount(sqlSession, toUserId);
		return result;
	}

	/**
	 * 알람리스트
	 */
	@Override
	public List<Alert> selectAlarmList(String memberId) {
		List<Alert> alramList = alertStore.selectAlarmList(sqlSession, memberId);
		return alramList;
	}

	/**
	 * 알람리스트 삭제 
	 */
	@Override
	public Integer deleteAlarm(Map<String, Object> paramMap) {
		Integer result = alertStore.deleteAlarm(sqlSession, paramMap);
		return result;
	}

//	@Override
//	public void alramClick(String memberId, int boardNo) {
//		alertStore.alramClick(sqlSession, memberId, boardNo);
//	}

	

}
