package com.aligo.spring.report.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.report.model.dao.ReportDao;
import com.aligo.spring.report.model.vo.Report;
import com.aligo.spring.theme.model.vo.PageInfo;

@Service("Rservice")
public class ReportServiceImpl implements ReportService{

	@Autowired
	ReportDao Rdao;

	@Override
	public int selectTotalInt(Map<String, String> map) {
		
		return Rdao.selectTotalInt(map);
	}

	@Override
	public ArrayList<Report> selectTotalList(Map<String, String> map, PageInfo pi) {
		
		return Rdao.selectTotalList(map, pi);
	}

	@Override
	public Report reportDetail(String str) {
		
		return Rdao.reportDetail(str);
	}
	
}
