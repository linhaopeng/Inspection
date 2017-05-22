package net.baojuxinxi.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.baojuxinxi.pojo.DemoExport;
import net.baojuxinxi.service.IDemoExportService;

@Controller
public class ExportController {

	@Resource
	private IDemoExportService demoExportService;

	@RequestMapping(value = "/export")
	public String toExport() {
		return "export";
	}
	
	@RequestMapping(value = "/task")
	public String task() {
		return "task";
	}

	@RequestMapping(value = "/export/getDetail")
	public String toExportDetail() {
		return "export-detail";
	}

	@RequestMapping(value = "/export/getExport")
	@ResponseBody
	public Object getExport() {
		return demoExportService.findAll();
	}
	
	@RequestMapping(value = "/upload/export/getExportByType")
	@ResponseBody
	public Object getExportByType(String type) {
		return demoExportService.findByType(type);
	}

	/*
	 * 通过流的方式上传文件
	 * 
	 * @RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
	 */
	@RequestMapping("/uploadFile")
	@ResponseBody
	public Object fileUpload(@RequestParam("file") CommonsMultipartFile file,DemoExport demoExport,HttpServletRequest request) throws IOException {

		// 用来检测程序运行时间
		long startTime = System.currentTimeMillis();
		String path = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("fileName：" + file.getOriginalFilename());

		String fileName = file.getOriginalFilename();
		String img = generateRandomFilename()
				+ fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		try {
			
			// 拿到输出流，同时重命名上传的文件
			// 获取输出流
			OutputStream os = new FileOutputStream(path + "/" + img);
			// 获取输入流 CommonsMultipartFile 中可以直接得到文件的流
			InputStream is = file.getInputStream();
			int temp;
			// 一个一个字节的读取并写入
			while ((temp = is.read()) != (-1)) {
				os.write(temp);
			}
			os.flush();
			os.close();
			is.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		long endTime = System.currentTimeMillis();
		System.out.println("方法一的运行时间：" + String.valueOf(endTime - startTime) + "ms");
		
		demoExport.setImg(img);
		demoExport.setCreatedate(new Date());
		demoExportService.insert(demoExport);
		Map<String, String> map = new HashMap<String,String>();
		map.put("result", "success");
		return map;
	}


	/*
	 * 生成随机文件名
	 */
	public String generateRandomFilename() {
		String RandomFilename = "";
		Random rand = new Random();// 生成随机数
		int random = rand.nextInt();

		Calendar calCurrent = Calendar.getInstance();
		int intDay = calCurrent.get(Calendar.DATE);
		int intMonth = calCurrent.get(Calendar.MONTH) + 1;
		int intYear = calCurrent.get(Calendar.YEAR);
		String now = String.valueOf(intYear) + "_" + String.valueOf(intMonth) + "_" + String.valueOf(intDay) + "_";

		RandomFilename = now + String.valueOf(random > 0 ? random : (-1) * random) + ".";

		return RandomFilename;
	}

}
