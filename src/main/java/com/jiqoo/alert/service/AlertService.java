package com.jiqoo.alert.service;

import java.util.List;
import java.util.Map;

import com.jiqoo.alert.domain.Alert;

public interface AlertService {

	/**
	 * 알람등록
	 * @param alert
	 * @return
	 */
	public Integer insertAlarm(Alert alert);

	/**
	 * 알람수
	 * @param alert
	 * @return
	 */
	public Integer selectAlarmCount(String toUserId);

	/**
	 * 알람리스트
	 * @param memberId
	 * @return
	 */
	public List<Alert> selectAlarmList(Alert alert);

	/**
	 * 알람리스트 삭제 
	 * @param paramMap
	 * @return
	 */
	public Integer deleteAlarm(Alert alert);

//	public void alramClick(String memberId, int boardNo);


}
