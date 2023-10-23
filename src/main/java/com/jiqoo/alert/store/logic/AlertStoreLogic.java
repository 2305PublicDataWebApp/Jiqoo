package com.jiqoo.alert.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.alert.domain.Alert;
import com.jiqoo.alert.store.AlertStore;

@Repository
public class AlertStoreLogic implements AlertStore{

	/**
	 * 알람등록
	 */
	@Override
	public Integer insertAlarm(SqlSession sqlSession, Alert alert) {
		Integer result = sqlSession.insert("AlertMapper.insertAlarm", alert);
		return result;
	}

	/**
	 * 알람수
	 */
	@Override
	public Integer selectAlarmCount(SqlSession sqlSession, String toUserId) {
		Integer result = sqlSession.selectOne("AlertMapper.selectAlarmCount", toUserId);
		return result;
	}

	/**
	 * 알람리스트
	 */
	@Override
	public List<Alert> selectAlarmList(SqlSession sqlSession, String memberId) {
		List<Alert> alramList = sqlSession.selectList("AlertMapper.selectAlarmList", memberId);
		return alramList;
	}

	/**
	 * 알람리스트 삭제 
	 */
	@Override
	public Integer deleteAlarm(SqlSession sqlSession, Map<String, Object> paramMap) {
		Integer result = sqlSession.delete("AlertMapper.deleteAlarm", paramMap);
		return result;
	}

}
