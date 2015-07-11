package com.sunyard.directbank.userapprove.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sunyard.directbank.base.BaseAction;
import com.sunyard.directbank.base.model.Consts;
import com.sunyard.directbank.base.model.ListPage;
import com.sunyard.directbank.base.model.Properties;
import com.sunyard.directbank.enums.ACCTSTA;
import com.sunyard.directbank.tools.ParamUtil;
import com.sunyard.directbank.userapprove.service.IUserApproveService;

@SuppressWarnings("rawtypes")
@Controller
@Scope("prototype")
public class UserApproveAction extends BaseAction {

	private static final long serialVersionUID = -1676324546437364295L;
	@Resource
	private IUserApproveService iUserApproveService;
	HttpServletRequest request = ServletActionContext.getRequest();
	private Logger logger = Logger.getLogger(UserApproveAction.class);

	/**
	 * 列表和查询功能
	 * 
	 * @return
	 * @throws Exception
	 */
	public String selectUserInfo() throws Exception {

		Map<String, Object> param = ParamUtil.param2Map(request);
		int pageNo = ParamUtil.getInt(request, "pageNo", 1);
		ListPage page = iUserApproveService.pageQuery(param, pageNo);
		request.setAttribute("param", param);
		request.setAttribute("page", page);
		logger.info("查询结果 page = " + page.getResult());
		return "query";
	}

	/**
	 * 转到详细页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String approving() throws Exception {
		String eacc_no = request.getParameter("eacc_no");
		Map<String, Object> details = iUserApproveService.getById(eacc_no);
		request.setAttribute("details", details);
		
		String remote_picpath = Properties.getString("remote_picpath");
		String local_picpath = Properties.getString("local_picpath");
		copyFolder(remote_picpath, local_picpath);
		List<String> files = new ArrayList<String>();
		for(int i = 0; i < 3; i ++) {
			File jpg = new File(local_picpath + File.separator + eacc_no + i + ".jpg");
			File png = new File(local_picpath + File.separator + eacc_no + i + ".png");
			File jif = new File(local_picpath + File.separator + eacc_no + i + ".gif");
			if(jpg.exists()) {
				files.add(eacc_no + i + ".jpg");
			}else if(png.exists()) {
				files.add(eacc_no + i + ".png");
			}else if(jif.exists()) {
				files.add(eacc_no + i + ".jif");
			}else {
				request.setAttribute("alt", "该用户没有上传图片");
			}
		}
		logger.info("获取到的 files = " + files);
		request.setAttribute("files", files);
		return "approving";
	}

	/**
	 * 审核通过
	 * 
	 * @return
	 * @throws Exception
	 */
	public String userApproved() throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("approve_name", getUser().getUser_name());
		param.put("eacc_no", request.getParameter("eacc_no"));
		param.put("acc_state", Integer.valueOf(ACCTSTA.Active.getCode()));
		if (iUserApproveService.userApproved(param)) {
			deleteFiles(Properties.getString("local_picpath"));
			request.setAttribute("msg", "审核通过操作成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;

	}

	/**
	 * 审核拒绝
	 * 
	 * @return
	 * @throws Exception
	 */
	public String userRefused() throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("approve_name", getUser().getUser_name());
		param.put("eacc_no", request.getParameter("eacc_no"));
		param.put("acc_state", Integer.valueOf(ACCTSTA.UnActive.getCode()));
		if (iUserApproveService.updateAccInfo(param)) {
			request.setAttribute("msg", "审核拒绝操作成功！");
			return Consts.SYSSUCCESS;
		}
		return Consts.ERROR;
	}

	/**
	 * 拷贝验证图片到工程下
	 * @param oldPath
	 * @param newPath
	 * @throws Exception
	 */
	public void copyFolder(String oldPath, String newPath) throws Exception {
		File pictures = new File(oldPath);
		String[] file = pictures.list();
		String sepa = File.separator;
		File temp = null;
		for (int i = 0; i < file.length; i++) {
			if (oldPath.endsWith(sepa)) {
				temp = new File(oldPath + file[i]);
			} else {
				temp = new File(oldPath + sepa + file[i]);
			}

			if (temp.isFile()) {
				FileInputStream input = new FileInputStream(temp);
				FileOutputStream output = new FileOutputStream(newPath + sepa + (temp.getName()).toString());
				byte[] b = new byte[1024 * 5];
				int len;
				while ((len = input.read(b)) != -1) {
					output.write(b, 0, len);
				}
				output.flush();
				output.close();
				input.close();
			}
			if (temp.isDirectory()) {// 如果是子文件夹
				copyFolder(oldPath + sepa + file[i], newPath + sepa + file[i]);
			}
		}
	}
	
	/**
	 * 清空文件夹
	 * @param files
	 */
	public void deleteFiles(String path) {
		File file = new File(path);
		File[] files = file.listFiles();
		for( int i = 0; i < files.length; i ++ ) {
			files[i].delete();
		}
	}

	@Override
	protected String getModuleName() throws Exception {
		return "用户信息审核";
	}

}
