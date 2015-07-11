package com.sunyard.directbank.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.Properties;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class FilingAction extends BaseAction {

	private static final long serialVersionUID = 7443069208806361331L;
	private Logger logger = Logger.getLogger(FilingAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 显示文件归档页面
	 * @return
	 */
	public String filing() {
		
		return "filing";
	}
	
	/**
	 * 执行文件归档
	 * @return
	 * @throws Exception
	 */
	public String doFiling() throws Exception {
		
		String zipPath = Properties.getString("zipPath");			// 压缩文件存放目录
		String cmslogPath = Properties.getString("logPath");		// 管理台的log文件位置
		String cmszipFile = Properties.getString("cmszipFile");		// 管理台的压缩文件名称
		String weblogPath = Properties.getString("weblogPath");		// web端的log文件位置
		String webzipFile = Properties.getString("webzipFile");		// web端的压缩文件名称
		creatZipPath(zipPath);
		if( filingWebLog(zipPath, weblogPath, webzipFile) && filingCmsLog(zipPath, cmslogPath, cmszipFile) ) {
			request.setAttribute("msg", "文件成功归档！");
			return Consts.SYSSUCCESS;
		}else {
			return Consts.ERROR;
		}
		
	}

	/**
	 * 压缩管理台的log文件
	 * @param zipPath
	 * @param cmslogPath
	 * @param cmszipFile
	 * @return
	 * @throws Exception
	 */
	public boolean filingCmsLog(String zipPath, String cmslogPath, String cmszipFile) throws Exception {
		
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
	public boolean filingWebLog(String zipPath, String weblogPath, String webzipFile) throws Exception {
		
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
	public boolean filing(String path, String logPath, String zipFile) throws Exception {
		
		String today = today();
		String sepa = File.separator;
		File file = new File(logPath);	// 定义要压缩的文件夹
		File zipfile = new File(path + sepa + today + zipFile);	// 定义压缩文件名称
		InputStream input = null; // 定义文件输入流
		ZipOutputStream zipoutput = null;	// 声明压缩流对象 
		zipoutput = new ZipOutputStream(new FileOutputStream(zipfile));
		
		logger.info("输出流开启，"+ path + sepa + today + zipFile +" 压缩开始进行中，请等待...");
		int bytes = 0;
		if(file.isDirectory()) {	// 判断是否为文件夹
			File[] fileLists =  file.listFiles();	// 列出全部文件
			for(int i = 0; i < fileLists.length; i ++) {
				input = new FileInputStream(fileLists[i]);	// 定义文件输入流
				zipoutput.putNextEntry(new ZipEntry(file.getName() + sepa + fileLists[i].getName())); 	// 设置ZipEntry对象
				while((bytes = input.read()) != -1) {	// 读取内容
					zipoutput.write(bytes);
				}
				input.close();	// 关闭输入流
			}
			deleteAllFiles(fileLists);
		}
		zipoutput.close();	// 关闭输出流
		logger.info("输出流已关闭，"+ path + sepa + today + zipFile +" 压缩完成！");
		return true;
		
	}
	
	/**
	 * 获取当天的日期
	 * @return
	 */
	public String today() {
	    Calendar cal = Calendar.getInstance();
	    String to = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());  
	    logger.info("今天是 " + to);
	    return to;
	}
	
	/**
	 * 判断路径是否存在
	 * @param zipPath
	 */
	public void creatZipPath(String zipPath) {
		File zip = new File(zipPath);
		if(!zip.exists()) {
			zip.mkdir();
		}
	}
	
	/**
	 * 清空文件夹
	 * @param files
	 */
	public void deleteAllFiles(File[] files) {
		for( int i = 0; i < files.length; i ++ ) {
			files[i].delete();
		}
	}

	@Override
	protected String getModuleName() throws Exception {
		return "文件归档";
	}
	
}
