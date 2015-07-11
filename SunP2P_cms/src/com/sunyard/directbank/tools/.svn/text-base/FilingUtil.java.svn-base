package com.sunyard.directbank.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Scope("prototype")
public class FilingUtil {


	/**
	 * 压缩管理台的log文件
	 * @param zipPath
	 * @param cmslogPath
	 * @param cmszipFile
	 * @return
	 * @throws Exception
	 */
	public static boolean filingCmsLog(String zipPath, String cmslogPath, String cmszipFile) throws Exception {
		
		return filing(zipPath, cmslogPath, cmszipFile);
	}

	/**
	 * 压缩web端的log文件
	 * @param zipPath
	 * @param weblogPath
	 * @param webzipFile
	 * @return
	 * @throws Exception
	 */
	public static boolean filingWebLog(String zipPath, String weblogPath, String webzipFile) throws Exception {
		
		return filing(zipPath, weblogPath, webzipFile);
	}
	
	/**
	 * 文件归档
	 * @param path
	 * @param logPath
	 * @param zipFile
	 * @return
	 * @throws Exception
	 */
	public static synchronized boolean filing(String path, String logPath, String zipFile) throws Exception {
		
		String today = today();
		String sepa = File.separator;
		File file = new File(logPath);	// 定义要压缩的文件夹
		File zipfile = new File(path + sepa + today + zipFile);	// 定义压缩文件名称
		InputStream input = null; // 定义文件输入流
		
		int bytes = 0;
		if(file.isDirectory()) {	// 判断是否为文件夹
			File[] fileLists =  file.listFiles();	// 列出全部文件
			if(fileLists.length != 0) {
				ZipOutputStream zipoutput = new ZipOutputStream(new FileOutputStream(zipfile));		// 初始化压缩流对象 
				for(int i = 0; i < fileLists.length; i ++) {
					input = new FileInputStream(fileLists[i]);	// 定义文件输入流
					zipoutput.putNextEntry(new ZipEntry(file.getName() + sepa + fileLists[i].getName())); 	// 设置ZipEntry对象
					while((bytes = input.read()) != -1) {	// 读取内容
						zipoutput.write(bytes);
					}
					input.close();	// 关闭输入流
				}
				zipoutput.close();	// 关闭输出流
			}
			deleteAllFiles(fileLists);
		}
		return true;
		
	}
	
	/**
	 * 获取当天的日期
	 * @return
	 */
	public static String today() {
	    Calendar cal = Calendar.getInstance();
	    String to = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());  
	    return to;
	}
	
	/**
	 * 判断路径是否存在
	 * @param zipPath
	 */
	public static void creatZipPath(String zipPath) {
		File zip = new File(zipPath);
		if(!zip.exists()) {
			zip.mkdir();
		}
	}
	
	/**
	 * 清空文件夹
	 * @param files
	 */
	public static void deleteAllFiles(File[] files) {
		for( int i = 0; i < files.length; i ++ ) {
			files[i].delete();
		}
	}

}
