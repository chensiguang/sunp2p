package com.sunyard.directbank.tools;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * 请求参工具类
 * 
 * @author uke
 * 
 */
public class ParamUtil {

	// Empty checks
	// -----------------------------------------------------------------------
	/**
	 * <p>
	 * Checks if a String is empty ("") or null.
	 * </p>
	 * 
	 * <pre>
	 * StringUtils.isEmpty(null)      = true
	 * StringUtils.isEmpty(&quot;&quot;)        = true
	 * StringUtils.isEmpty(&quot; &quot;)       = false
	 * StringUtils.isEmpty(&quot;bob&quot;)     = false
	 * StringUtils.isEmpty(&quot;  bob  &quot;) = false
	 * </pre>
	 * 
	 * <p>
	 * NOTE: This method changed in Lang version 2.0. It no longer trims the
	 * String. That functionality is available in isBlank().
	 * </p>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is empty or null
	 */
	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	/**
	 * <p>
	 * Checks if a String is not empty ("") and not null.
	 * </p>
	 * 
	 * <pre>
	 * StringUtils.isNotEmpty(null)      = false
	 * StringUtils.isNotEmpty(&quot;&quot;)        = false
	 * StringUtils.isNotEmpty(&quot; &quot;)       = true
	 * StringUtils.isNotEmpty(&quot;bob&quot;)     = true
	 * StringUtils.isNotEmpty(&quot;  bob  &quot;) = true
	 * </pre>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is not empty and not null
	 */
	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}

	/**
	 * <p>
	 * Checks if a String is whitespace, empty ("") or null.
	 * </p>
	 * 
	 * <pre>
	 * StringUtils.isBlank(null)      = true
	 * StringUtils.isBlank(&quot;&quot;)        = true
	 * StringUtils.isBlank(&quot; &quot;)       = true
	 * StringUtils.isBlank(&quot;bob&quot;)     = false
	 * StringUtils.isBlank(&quot;  bob  &quot;) = false
	 * </pre>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is null, empty or whitespace
	 * @since 2.0
	 */
	public static boolean isBlank(String str) {
		int strLen;
		if (str == null || (strLen = str.length()) == 0) {
			return true;
		}
		for (int i = 0; i < strLen; i++) {
			if ((Character.isWhitespace(str.charAt(i)) == false)) {
				return false;
			}
		}
		return true;
	}

	/**
	 * <p>
	 * Checks if a String is not empty (""), not null and not whitespace only.
	 * </p>
	 * 
	 * <pre>
	 * StringUtils.isNotBlank(null)      = false
	 * StringUtils.isNotBlank(&quot;&quot;)        = false
	 * StringUtils.isNotBlank(&quot; &quot;)       = false
	 * StringUtils.isNotBlank(&quot;bob&quot;)     = true
	 * StringUtils.isNotBlank(&quot;  bob  &quot;) = true
	 * </pre>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is not empty and not null and
	 *         not whitespace
	 * @since 2.0
	 */
	public static boolean isNotBlank(String str) {
		return !isBlank(str);
	}

	/**
	 * <li>用於处理JS参解码,配合WEB页面二次转码</li>
	 * <li>JS：params="&name="+encodeURI(encodeURI("姓名"));</li>
	 * <li>JAVA：ParamUtil.decode(request,"name")=="姓名"</li>
	 * 
	 * @param value
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String decode(String value) {
		try {
			return java.net.URLDecoder.decode(value, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * <li>获取Request中的参，并且去除NULL</li>
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static String get(HttpServletRequest request, String param ){
		return get(request, param,"");
	}

	/**
	 * <li>获取Request中的参，并且去除NULL,以指定内容取代</li>
	 * 
	 * @param request
	 * @param param
	 * @param defValue
	 * @return
	 */
	public static String get(HttpServletRequest request, String param,
			String defValue) {
		String value = request.getParameter(param);
		return null == value ? defValue : value.trim();
	}

	/**
	 * 整型值
	 * 
	 * @param request
	 * @param param
	 * @param defValue
	 * @return
	 */
	public static int getInt(HttpServletRequest request, String param,
			int defValue) {
		String value = request.getParameter(param);
		if (!isEmpty(value)) {
			try {
				return Integer.parseInt(value);
			} catch (Exception e) {
			}
		}
		return defValue;
	}

	/**
	 * 布林值
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static boolean getBoolean(HttpServletRequest request, String param) {
		return "true".equals(get(request, param));
	}

	/**
	 * 金额类型
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static Double getDouble(HttpServletRequest request, String param) {
		try {
			String value = get(request, param, "0").replaceAll(",", "");
			return new Double(value);
		} catch (Exception e) {
		}
		return new Double(0.0);//zhangxunhong 于2012-4-27 修改 (旧版是 return null）
	}

	/**
	 * 日期类型
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static Date getDate(HttpServletRequest request, String param) {
		return DateUtil.parseDate(get(request, param));
	}

	/**
	 * 日期类型字串yyyyMMdd
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static String getDateStr(HttpServletRequest request, String param) {
		return get(request, param).replaceAll("-|\\/", "");
	}

	/**
	 * 向从Request中获取字串值到Map中，包含''值(ibatis动态条件用到)
	 * 
	 * @param request
	 * @param param
	 * @param params
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void putStr2Map(HttpServletRequest request, String param,
			Map paramMap) {
		String value = request.getParameter(param);
		if (null != value) {
			paramMap.put(param, value.trim());
		}
	}
	

	/**
	 * 向从Request中获取字串值到Map中，包含''值(ibatis动态条件用到) 去掉了左边的空格 2010-04-29 fanhong
	 * 
	 * @param request
	 * @param param
	 * @param params
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void putQRYStr2Map(HttpServletRequest request, String param,
			Map paramMap) {
		String value = request.getParameter(param);
		if (null != value) {
			paramMap.put(param, lTrim(value));
		}
	}

	/**
	 * 向从Request中获取整型值到Map中，不包含空值
	 * 
	 * @param request
	 * @param param
	 * @param map
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void putInt2Map(HttpServletRequest request, String param,
			Map paramMap) {
		paramMap.put(param, new Integer(getInt(request, param, 0)));
	}

	/**
	 * 向从Request中获取浮点值到Map中，不包含空值
	 * 
	 * @param request
	 * @param param
	 * @param map
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void putDouble2Map(HttpServletRequest request, String param,
			Map paramMap) {
		paramMap.put(param, getDouble(request, param));
	}

	/**
	 * 向从Request中将日期值yyyy-MM-dd转成yyyyMMdd到Map中，不包含空值
	 * 
	 * @param request
	 * @param param
	 * @param map
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void putDateStr2Map(HttpServletRequest request, String param,
			Map map) {
		String value = request.getParameter(param);
		if (null != value) {
			map.put(param, value.replaceAll("-|\\/", ""));
		}
	}

	private static String[] forbids = { "action" };

	private static boolean checkParams(String name) {
		for (int i = 0, j = forbids.length; i < j; i++) {
			if (forbids[i].equals(name))
				return false;
		}
		return true;
	}

	public static String generyHiddenInput(String name, String value) {
		String html = "<input type='hidden' name='0' value=\"1\">";
		html = html.replaceFirst("0", name);
		html = html.replaceFirst("1", value);
		return html;
	}

	public static String fixParamToHtml(String[] params,
			HttpServletRequest request, String prefix) {
		StringBuffer bf = new StringBuffer();
		for (int i = 0, j = params.length; i < j; i++) {
			String name = params[i];
			String value = get(request, name);
			if (!isEmpty(value)) {
				bf.append(generyHiddenInput(prefix + name, value));
			}
		}
		return bf.toString();
	}

	public static String fixParamToHtml(HttpServletRequest request,
			String prefix) {
		return fixParamToHtml(request, prefix, true);
	}

	@SuppressWarnings("rawtypes")
	public static String fixParamToHtml(HttpServletRequest request,
			String prefix, boolean forbid) {
		StringBuffer bf = new StringBuffer();
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			String value = get(request, name);
			if (!isEmpty(value)) {
				if (forbid) {
					if (!checkParams(name)) {
						continue;
					}
				}
				bf.append(generyHiddenInput(prefix + name, value));
			}
		}
		return bf.toString();
	}

	/**
	 * <ul>
	 * 保留请求中的参，生成限制参之外的参对
	 * <li>forbids[]内设定的参名不会生成参对</li>
	 * </ul>
	 * 
	 * @param request
	 * @param prefix
	 * @param forbids
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static String forbidFixParamToHtml(HttpServletRequest request,
			String prefix, String[] forbids) {
		StringBuffer bf = new StringBuffer();
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			String value = get(request, name);
			// 过滤参对
			if (!isEmpty(value) && StringUtil.indexOf(forbids, name, false) < 0) {
				bf.append(generyHiddenInput(prefix + name, value));
			}
		}
		return bf.toString();
	}

	@SuppressWarnings("rawtypes")
	public static String decodeFixParamToHtml(HttpServletRequest request,
			String prefix) {
		StringBuffer bf = new StringBuffer();
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			if (name.startsWith(prefix)) {
				try {
					String value = decode(get(request, name));
					if (!isEmpty(value)) {
						bf.append(generyHiddenInput(name, value));
					}
				} catch (Exception e) {
				}
			}
		}
		return bf.toString();
	}

	@SuppressWarnings("rawtypes")
	public static String generyFixParamToHtml(HttpServletRequest request,
			String prefix) {
		StringBuffer bf = new StringBuffer();
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			if (name.startsWith(prefix)) {
				try {
					String value = get(request, name);
					if (!isEmpty(value)) {
						bf.append(generyHiddenInput(name, value));
					}
				} catch (Exception e) {
				}
			}
		}
		return bf.toString();
	}

	@SuppressWarnings("rawtypes")
	public static String revertFixParamToHtml(HttpServletRequest request,
			String prefix) {
		StringBuffer bf = new StringBuffer();
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			if (name.startsWith(prefix) && !"_backUrl".equals(name)) {
				String value = get(request, name);
				name = name.substring(prefix.length());
				if (!isEmpty(value)) {
					bf.append(generyHiddenInput(name, value));
				}
			}
		}
		return bf.toString();
	}

	@SuppressWarnings("rawtypes")
	public static String deRevertFixParamToHtml(HttpServletRequest request,
			String prefix) {
		StringBuffer bf = new StringBuffer();
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			if (name.startsWith(prefix)) {
				try {
					String value = decode(get(request, name));
					if (!isEmpty(value)) {
						name = name.substring(prefix.length());
						bf.append(generyHiddenInput(name, value));
					}
				} catch (Exception e) {
				}
			}
		}
		return bf.toString();
	}

	/**
	 * 将装饰过的HttpServletRequest参分离出来，存储到MAP中
	 * <li>request: _name ==> map:_name </li>
	 * 
	 * @param request
	 * @param prefix
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map enfixParam(HttpServletRequest request, String prefix) {
		Enumeration names = request.getParameterNames();
		Map params = new HashMap();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			if (name.startsWith(prefix)) {
				String value = get(request, name);
				if (!isEmpty(value)) {
					params.put(name, value);
				}
			}
		}
		return params;
	}

	/**
	 * <li>还原被装饰过的HttpServletRequest参</li>
	 * <li>去除装饰，并将还原后的参存储到MAP中</li>
	 * <li>request: _name ==> map:name </li>
	 * 
	 * @param request
	 * @param prefix
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map defixParam(HttpServletRequest request, String prefix) {
		Enumeration names = request.getParameterNames();
		Map params = new HashMap();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			if (name.startsWith(prefix)) {
				String value = get(request, name);
				name = name.substring(prefix.length());
				if (!isEmpty(value)) {
					params.put(name, value);
				}
			}
		}
		return params;
	}

	/**
	 * 将装饰过的HttpServletRequest参分离出来，并拼接成一个新的Url字串
	 * 
	 * @param request
	 * @param prefix
	 * @return a=b&c=d&...
	 */
	@SuppressWarnings("rawtypes")
	public static String getEnfixParamString(HttpServletRequest request,
			String prefix) {
		Enumeration names = request.getParameterNames();
		StringBuffer uri = new StringBuffer("");
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			if (name.startsWith(prefix)) {
				String value = get(request, name);
				if (!isEmpty(value)) {
					uri.append("&");
					uri.append(name);
					uri.append("=");
					uri.append(decode(value));
				}
			}
		}
		return uri.toString();
	}

	/**
	 * 解析请求，并将参值对以key:value字串保存
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static String favorit(HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		String ctx = request.getContextPath();
		int index = url.indexOf(ctx);
		String name, value;
		StringBuffer bf = new StringBuffer();
		bf.append("URL:'").append(url.substring(index + ctx.length() + 1))
				.append("'");
		Enumeration names = request.getParameterNames();
		while (names.hasMoreElements()) {
			name = (String) names.nextElement();
			value = get(request, name);
			if (!(null == value || "".equals(value))) {
				bf.append(",").append(name).append(":\"").append(value).append(
						"\"");
			}
		}
		return bf.toString();
	}

	/**
	 * 主机报表，大资料档案需要拆分，本方法可以在原档名中加入拆分档案序号, 获得拆分档名
	 * 
	 * @param fileName
	 * @param xSizeIndex
	 * @param fix
	 * @return
	 */
	public static String splitFileName(String fileName, int xSizeIndex,
			String fix) {
		if (xSizeIndex > 0) {
			// abc.del To abc_N.del
			int index = fileName.lastIndexOf(fix);
			StringBuffer bf = new StringBuffer();
			bf.append(fileName.substring(0, index));
			bf.append("_").append(xSizeIndex);
			bf.append(fileName.substring(index));
			return bf.toString();
		}
		return fileName;
	}

	// 2010-04-29去掉左边的空格
	public static String rTrim(String s) {
		int len = s.length();
		int st = 0;
		int off = 0; /* avoid getfield opcode */
		char[] val = s.toCharArray(); /* avoid getfield opcode */

		while ((st < len) && (val[off + len - 1] <= ' ')) {
			len--;
		}
		return ((st > 0) || (len < s.length())) ? s.substring(st, len) : s;
	}

	// 2010-04-29去掉右边的空格
	public static String lTrim(String s) {
		int len = s.length();
		int st = 0;
		int off = 0; /* avoid getfield opcode */
		char[] val = s.toCharArray(); /* avoid getfield opcode */

		while ((st < len) && (val[off + st] <= ' ')) {
			st++;
		}
		return ((st > 0) || (len < s.length())) ? s.substring(st, len) : s;
	}

	// 拆分字符串,指定返回数组的字符串，下标从1开始
	public static String ToOrderCol(HttpServletRequest request, String col,
			int n) {
		String orderCol = ParamUtil.get(request, col);
		if (n >= 0) {
			if (!"".equals(orderCol)) {
				String[] splitCol = orderCol.split(",");
				if (0 != splitCol.length) {
					if (n == 0) {
						return splitCol[n];
					} else {
						return splitCol[n - 1];
					}
				}
			}
		}
		return "";
	}
	
	 public static Map<String, Object> transBean2Map(Object obj) {
	        if(obj == null){
	            return null;
	        }        
	        Map<String, Object> map = new HashMap<String, Object>();
	        try {
	            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
	            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
	            for (PropertyDescriptor property : propertyDescriptors) {
	                String key = property.getName();

	                // 过滤class属性
	                if (!key.equals("class")) {
	                    // 得到property对应的getter方法
	                    Method getter = property.getReadMethod();
	                    Object value = getter.invoke(obj);

	                    map.put(key, value);
	                }

	            }
	        } catch (Exception e) {
	        }

	        return map;

	    }
	 /*把request参数转化为Map*/
	@SuppressWarnings("unchecked")
	public static Map<String, Object> param2Map(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();

		Enumeration<String> names = request.getParameterNames();
		for (Enumeration<String> e = names; e.hasMoreElements();) {
			String thisName = e.nextElement();
			String thisValue = request.getParameter(thisName);
			param.put(thisName, thisValue);
		}
		
		return param;
	}
	
	public static boolean containsKey(List<Map<String,Object>> list, String key, String value){
		if(list != null && list.size() > 0){
			for(int index=0; index < list.size(); index++){
				Map<String,Object> item = list.get(index);
				if(value.equals((String)item.get(key))){
					return true;
				}
			}
		}
		
		return false;
	}
}
