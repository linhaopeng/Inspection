package net.baojuxinxi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.baojuxinxi.dao.DemoExportMapper;
import net.baojuxinxi.pojo.DemoExport;
import net.baojuxinxi.service.IDemoExportService;

@Service("demoExportService")
public class DemoExportServiceImpl implements IDemoExportService{

	@Resource
	private DemoExportMapper demoExportMapper;
	
	public List<DemoExport> findAll(){
		return demoExportMapper.findAll();
	}

	@Override
	public void insert(DemoExport demoExport) {
		demoExportMapper.insert(demoExport);
	}

	@Override
	public List<DemoExport> findByType(String type) {
		return demoExportMapper.findByType(type);
	}
}
