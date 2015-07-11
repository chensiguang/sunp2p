package com.sunyard.directbank.tools;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.lang.StringUtils;

public class StringUtil {

	/**
	 * 是否需要格式化帐户号标识。
	 */
	public static final boolean needFormatAccountNo = true;

	/**
	 * 将STRING转换成INT
	 * 
	 * @param s
	 * @return
	 */
	public static int string2Int(String s) {
		if (s == null || "".equals(s) || "undefined".equals(s))
			return 0;
		int result = 0;
		try {
			if (s.indexOf(",") != -1) {
				s = s.substring(0, s.indexOf(","));
			} else if (s.indexOf(".") != -1) {
				s = s.substring(0, s.indexOf("."));
			} else if (s.indexOf("|") != -1) {
				s = s.substring(0, s.indexOf("|"));
			}
			result = Integer.parseInt(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 禁止显示出NULL值
	 * 
	 * @param str
	 *            输入字串
	 * @return 输出字串
	 */
	public static String forbidNull(Object obj) {
		return (null == obj) ? "" : String.valueOf(obj).trim();
	}

	/**
	 * <li>判断字串是否为空值</li> <li>NULL、空格均为空值</li>
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isEmpty(String value) {
		return null == value || value.length() == 0;
	}

	/**
	 * 重置档案
	 * 
	 * @param filename
	 * @param suffix
	 * @return
	 */
	public static String renameFileSuffix(String filename, String suffix) {
		int pos = filename.lastIndexOf(".");
		String tmp = filename.substring(0, pos);
		return tmp + suffix;
	}

	/**
	 * 重复字串 如 repeatString("a",3) ==> "aaa"
	 * 
	 * @author uke
	 * @param src
	 * @param repeats
	 * @return
	 */
	public static String repeatString(String src, int repeats) {
		if (null == src || repeats <= 0) {
			return src;
		} else {
			StringBuffer bf = new StringBuffer();
			for (int i = 0; i < repeats; i++) {
				bf.append(src);
			}
			return bf.toString();
		}
	}

	/**
	 * 左对齐字串 * lpadString("X",3); ==>" X" *
	 * 
	 * @param src
	 * @param length
	 * @return
	 */
	public static String lpadString(String src, int length) {
		return lpadString(src, length, " ");
	}

	/**
	 * 以指定字串填补空位，左对齐字串 * lpadString("X",3,"0"); ==>"00X"
	 * 
	 * @param src
	 * @param byteLength
	 * @param temp
	 * @return
	 */
	public static String lpadString(String src, int length, String single) {
		if (src == null || length <= src.getBytes().length) {
			return src;
		} else {
			return repeatString(single, length - src.getBytes().length) + src;
		}
	}

	/**
	 * 右对齐字串 * rpadString("9",3)==>"9 "
	 * 
	 * @param src
	 * @param byteLength
	 * @return
	 */
	public static String rpadString(String src, int byteLength) {
		return rpadString(src, byteLength, " ");
	}

	/**
	 * 以指定字串填补空位，右对齐字串 rpadString("9",3,"0")==>"900"
	 * 
	 * @param src
	 * @param byteLength
	 * @param single
	 * @return
	 */
	public static String rpadString(String src, int length, String single) {
		if (src == null || length <= src.getBytes().length) {
			return src;
		} else {
			return src + repeatString(single, length - src.getBytes().length);
		}
	}

	/**
	 * 去除,分隔符，用於金额值去格式化
	 * 
	 * @param value
	 * @return
	 */
	public static String decimal(String value) {
		if (null == value || "".equals(value.trim())) {
			return "0";
		} else {
			return value.replaceAll(",", "");
		}
	}

	/**
	 * 在阵列中查找字串
	 * 
	 * @param params
	 * @param name
	 * @param ignoreCase
	 * @return
	 */
	public static int indexOf(String[] params, String name, boolean ignoreCase) {
		if (params == null)
			return -1;
		for (int i = 0, j = params.length; i < j; i++) {
			if (ignoreCase && params[i].equalsIgnoreCase(name)) {
				return i;
			} else if (params[i].equals(name)) {
				return i;
			}
		}
		return -1;
	}

	/**
	 * 将字元转阵列
	 * 
	 * @param str
	 * @return
	 */
	public static String[] toArr(String str) {
		return toArr(str, ",");
	}

	public static String[] toArr(String str, String delim) {
		String inStr = str;
		String a[] = null;
		try {
			if (null != inStr) {
				StringTokenizer st = new StringTokenizer(inStr, delim);
				if (st.countTokens() > 0) {
					a = new String[st.countTokens()];
					int i = 0;
					while (st.hasMoreTokens()) {
						a[i++] = st.nextToken();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	/**
	 * 字串阵列包装成字串
	 * 
	 * @param ary
	 * @param s
	 *            包装符号如 ' 或 "
	 * @return
	 */
	public static String toStr(String[] ary, String s) {
		if (ary == null || ary.length < 1)
			return "";
		StringBuffer bf = new StringBuffer();
		bf.append(s);
		bf.append(ary[0]);
		for (int i = 1; i < ary.length; i++) {
			bf.append(s).append(",").append(s);
			bf.append(ary[i]);
		}
		bf.append(s);
		return bf.toString();
	}
	
	/**
	 * 设定MESSAGE中的变{0}...{N}
	 * 
	 * @param msg
	 * @param vars
	 * @return
	 */
	public static String getMessage(String msg, String[] vars) {
		for (int i = 0; i < vars.length; i++) {
			msg = msg.replaceAll("\\{" + i + "\\}", vars[i]);
		}
		return msg;
	}

	/**
	 * @param msg
	 * @param var
	 * @return
	 */
	public static String getMessage(String msg, String var) {
		return getMessage(msg, new String[] { var });
	}

	/**
	 * @param msg
	 * @param var
	 * @param var2
	 * @return
	 */
	public static String getMessage(String msg, String var, String var2) {
		return getMessage(msg, new String[] { var, var2 });
	}

	/**
	 * 从Map中取String类型值
	 * 
	 * @param map
	 * @param key
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static Object getMapValue(Map map, Object key) {
		if (null == map || null == key)
			return "";
		Object value = map.get(key);
		return null == value ? "" : value;
	}

	/**
	 * 从Map中取Integer类型值
	 * 
	 * @param map
	 * @param key
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static Object getMapIntValue(Map map, Object key) {
		if (null == map || null == key)
			return new Integer(0);
		Object value = map.get(key);
		return null == value ? new Integer(0) : value;
	}

	/**
	 * 将key=value;key2=value2……转换成Map
	 * 
	 * @param params
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map gerneryParams(String params) {
		Map args = new HashMap();
		if (!isEmpty(params)) {
			try {
				String map, key, value;
				StringTokenizer st = new StringTokenizer(params, ";");
				StringTokenizer stMap;
				while (st.hasMoreTokens()) {
					map = st.nextToken();
					if (isEmpty(map.trim()))
						break;
					stMap = new StringTokenizer(map, "=");
					key = stMap.hasMoreTokens() ? stMap.nextToken() : "";
					if (isEmpty(key.trim()))
						continue;
					value = stMap.hasMoreTokens() ? stMap.nextToken() : "";
					args.put(key, value);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return args;
	}

	/**
	 * 格式化卡号 6221731801000003428 ==>622**********3428
	 * 
	 * @param no
	 * @return
	 */
	public static String noStr(String noStr) {
		noStr = noStr.trim();
		// 只有被设置为可以格式化帐号时才格式化
		if (needFormatAccountNo) {
			if (!isEmpty(noStr)) {
				String resutlt = "";
				StringBuffer flag = new StringBuffer();
				int noStrLength = noStr.length();
				if (noStrLength > 8) {
					flag.append(noStr.substring(0, 4));// prefix string
					flag.append("****"); //
					flag.append(noStr.substring(noStrLength - 3, noStrLength)); //
					return flag.toString();
				} else if (noStrLength > 4) {
					flag.append(noStr.substring(0, 2));// prefix string
					flag.append("****"); //
					flag.append(noStr.substring(noStrLength - 2, noStrLength)); //
					return flag.toString();
				} else if (noStrLength > 2) {
					resutlt = noStr.substring(1, 2) + "**"
							+ noStr.substring(2, 3);
					return resutlt;
				} else {
					return noStr;
				}
			}
			return "";
		} else {
			return noStr;
		}

	}

	/**
	 * 页面格式化日期:yyyyMMdd ---> yyyy-MM-dd
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDate(String date) {
		return isEmpty(date) ? "" : DateUtil.format(date, "yyyyMMdd",
				"yyyy-MM-dd");
	}

	public static String formatDates(String date) {
		return isEmpty(date) ? "" : DateUtil.format(date, "yyyy-MM-dd",
				"yyyyMMdd");
	}

	/**
	 * 分析帐户状态字符串，判断有无帐户，并在原Map中存储一个Key为“ACCOUNT_STATE”的值；
	 * 如果有，则为“has”，没有则为“hasNot”
	 * 
	 * @param list
	 *            存储据的list列表
	 * @param accKind
	 *            分析的种类标识：2. 存款业务账户明细 3.授信业务账户明细
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void analyzeAccState(List list, int accKind) {
		if (list != null && !list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				Map row = (Map) list.get(i);
				String state = StringUtils.trimToEmpty((String) row
						.get("STATE"));
				String accountState = "has";
				// 判断是否全部都由0组成 ，或者 是否全部都由N组成，如果是，表示帐户状态是“无”
				if (StringUtils.containsOnly(state, "0")
						|| StringUtils.containsOnly(state, "N")) {
					accountState = "hasNot";
				} else { // 如果不是，则表示帐户状态为“有”
							// Do nothing
				}
				row.put("ACCOUNT_STATE", accountState);
			}
		}
	}
	
   /**
    * 去掉字符串空格
    * @param str
    * @return
    */
	public static String delSpace(String str) {

		if (str == null) {
			return null;
		}

		// 先将半角空格删除
		str = str.trim();

		while (str.startsWith("　")) {

			// 只可惜String中没有提供replaceLast(), 否则就简单点了
			// 所以本循环完成以后，只能将字符串前端的空格删除，却不能删除后端的空格
			// 故而本循环完成后，又将字符串翻转后再去一次空格
			str = str.replaceFirst("　", "");

			// 一定要 trim()， 不然的话，如果前端的空格是全角和半角相间的话，就搞不定了
			str = str.trim();
		}

		// 将字符串翻转
		str = reverse(str);

		// 再去一次空格
		while (str.startsWith("　")) {

			str = str.replaceFirst("　", "");

			str = str.trim();
		}

		// 最后再将字符串翻转回去
		return str = reverse(str).trim();
	}

	// 自定义的字符串翻转方法。
	// 很多第三方的包的都有实现，但是 Java API 没有实现，这里自己实现一下 ^_^
	public static String reverse(String str) {
		char[] charsOld = str.toCharArray();

		char[] charsNew = new char[charsOld.length];

		int index = charsOld.length - 1;

		for (int i = 0; i < charsOld.length; i++) {

			charsNew[i] = charsOld[index - i];
		}

		return String.valueOf(charsNew);
	}
}
