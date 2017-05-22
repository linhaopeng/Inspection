package net.baojuxinxi.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class FileUpload_bao {

	private int finaltime = 0;

	public int getFinaltime() {
		return finaltime;
	}

	// 多文件上传
	public ArrayList<String> uploads(HttpServletRequest request, String c_fileName,
			String c_path) {
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		ArrayList<String> pathName = null;
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 记录上传过程起始时的时间，用来计算上传时间
				int pre = (int) System.currentTimeMillis();
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != "") {
						// 定义上传路径
						String fileName = file.getOriginalFilename();
						fileName=fileName.substring(fileName.lastIndexOf("."));
						String realPath = request.getSession()
								.getServletContext().getRealPath("");
						String path =realPath + "/upload" + c_path +"/"+c_fileName+  fileName;
						File localFile = new File(path);
						if (!localFile.exists()) {
							localFile.mkdirs();

						}
						try {
							file.transferTo(localFile);
						  path ="/upload" + c_path +"/"+c_fileName+ fileName;
						  pathName.add(path);
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				// 记录上传该文件后的时间
				finaltime = (int) System.currentTimeMillis()-pre;
			}

		}

		return pathName;
	}
	

	public String upload(HttpServletRequest request,@RequestParam CommonsMultipartFile file,String c_path,String c_fileName){
		String path=null;
		
		if (!file.isEmpty()) {  
			int	pre = (int) System.currentTimeMillis();  
            try {  
                // 文件保存路径  
            String fileName =file.getOriginalFilename();
//       System.out.println("++++图片类型+++++++++++++++"+file.getContentType()+"+++++++++++++++++++");
//       System.out.println("++++文件名+++++++++++++++"+file.getName()+"+++++++++++++++++++");
//       System.out.println("++++图片名+++++++++++++++"+file.getOriginalFilename()+"+++++++++++++++++++");
//       System.out.println("++++图片大小+++++++++++++++"+file.getSize()+"+++++++++++++++++++");
//       System.out.println("+++++++++++++++++++"+file.getStorageDescription()+"+++++++++++++++++++");
       fileName=fileName.substring(fileName.lastIndexOf("."));
			// 定义上传路径
			String realPath = request.getSession()
					.getServletContext().getRealPath("");
			path =realPath + "/upload" + c_path +"/"+c_fileName+ fileName;
			File localFile = new File(path);
			if (!localFile.exists()) {
				localFile.mkdirs();

			}
                // 转存文件  
                file.transferTo(localFile);  
                //把图片生成缩略图
//                String abbpath=realPath + "/upload" + c_path +"/abb"+"/"+c_fileName+ fileName;
//                ScaleImageUtils instance = ScaleImageUtils.getInstance();
//                instance.scale(path, abbpath, 100);
                path ="/upload" + c_path +"/"+c_fileName+ fileName;
            } catch (Exception e) {  
                e.printStackTrace();  
            } 
             finaltime = (int) System.currentTimeMillis()-pre;  
        }  
		return path;
	}
	public static void main(String[] args) {

	String name=new String("D:/apache-tomcat-7.0.67/webapps/ITSM");
		name = name.substring(name.lastIndexOf ('/'),name.length());
		System.out.println(name);
		
	}
	public boolean delete(String filePath,HttpServletRequest request){
		// 定义上传路径
		String realPath = request.getSession()
				.getServletContext().getRealPath("");
		String path=realPath+filePath;
		File file = new File(path);  
	    // 判断目录或文件是否存在  
	    if (!file.exists()) {  // 不存在返回 false  
	        return false;  
	    } else {  
	        // 判断是否为文件  
	        if (file.isFile()) {  // 为文件时调用删除文件方法  
	            // 路径为文件且不为空则进行删除  
	            if (file.isFile() && file.exists()) {  
	                file.delete();  
	               return true;
	            }  
	        } 
	        return false;
	    }  
	}
}
