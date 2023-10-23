package com.jiqoo.report.store.logic;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jiqoo.report.store.ReportStore;

@Repository
public class ReportStoreLogic implements ReportStore {

	@Override
	public Integer resetReportMByAdmin(SqlSession sqlSession, Map<String, String> resetReportMap) {
		Integer result = sqlSession.update("ReportMapper.resetReportMByAdmin", resetReportMap);
		return result;
	}






}
