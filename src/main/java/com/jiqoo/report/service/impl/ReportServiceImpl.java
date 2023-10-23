package com.jiqoo.report.service.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiqoo.report.service.ReportService;
import com.jiqoo.report.store.ReportStore;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportStore reportStore;
	@Autowired
	private SqlSession sqlSession;
	@Override
	
	public Integer resetReportMByAdmin(Map<String, String> resetReportMap) {
		Integer result = reportStore.resetReportMByAdmin(sqlSession, resetReportMap);
		return result;
	}
	



	

}
