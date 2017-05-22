package net.baojuxinxi.service;

import java.util.List;

import net.baojuxinxi.pojo.DemoExport;

public interface IDemoExportService {
	public List<DemoExport> findAll();
	public List<DemoExport> findByType(String type);
	
	public void insert(DemoExport demoExport);
}
