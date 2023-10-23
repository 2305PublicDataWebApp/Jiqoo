package com.jiqoo.report.store;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ReportStore {

	Integer resetReportMByAdmin(SqlSession sqlSession, Map<String, String> resetReportMap);




}
