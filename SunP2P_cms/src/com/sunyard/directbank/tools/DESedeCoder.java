/********************************************
 * 文件名称: DESedeCoder <br/>
 * 系统名称: 直销银行V1.0
 * 模块名称: WEB业务平台帐户类
 * 软件版权: 信雅达系统工程股份有限公司
 * 功能说明: 3des加密实现 <br/>
 * 系统版本: 1.0.0.1
 * 开发人员:  姚建斌
 * 开发时间: 2014年10月21日 17:09:47 <br/> 
 * 审核人员:
 * 相关文档:
 * 修改记录: 修改日期    修改人员    修改说明
 * V3.0.0.2 20130530-01  XXXX        提示报错 M201305300011
 *********************************************/

package com.sunyard.directbank.tools;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;

import org.apache.commons.codec.binary.Base64;

public class DESedeCoder {
	/**
	 * 密钥算法
	 * */
	public static final String KEY_ALGORITHM = "DESede";

	/**
	 * 加密/解密算法/工作模式/填充方式
	 * */
	public static final String CIPHER_ALGORITHM = "DESede/ECB/PKCS5Padding";

	/**
	 * 
	 * 生成密钥
	 * 
	 * @return byte[] 二进制密钥
	 * */
	/*
	 * public static byte[] initkey() throws Exception{
	 * 
	 * //实例化密钥生成器 KeyGenerator kg=KeyGenerator.getInstance(KEY_ALGORITHM);
	 * //初始化密钥生成器 kg.init(168); //生成密钥 SecretKey secretKey=kg.generateKey();
	 * //获取二进制密钥编码形式 return secretKey.getEncoded(); }
	 */
	/**
	 * 转换密钥
	 * 
	 * @param key
	 *            二进制密钥
	 * @return Key 密钥
	 * */
	public static Key toKey(byte[] key) throws Exception {
		// 实例化Des密钥
		DESedeKeySpec dks = new DESedeKeySpec(key);
		// 实例化密钥工厂
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(KEY_ALGORITHM);
		// 生成密钥
		SecretKey secretKey = keyFactory.generateSecret(dks);
		return secretKey;
	}

	/**
	 * 加密数据
	 * 
	 * @param data
	 *            待加密数据
	 * @param key
	 *            密钥
	 * @return byte[] 加密后的数据
	 * */
	public static String encrypt(String text) throws Exception {
		byte[] data=text.getBytes();
		String key_String = "8cJ50OkBcw1AE2LWp1c3+837aNBbBLPH";// 静态密钥
		byte[] key = Base64.decodeBase64(key_String);
		// 还原密钥
		Key k = toKey(key);
		// 实例化
		Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
		// 初始化，设置为加密模式
		cipher.init(Cipher.ENCRYPT_MODE, k);
		// 执行操作
		byte[] data_1=cipher.doFinal(data);
		return Base64.encodeBase64String(data_1);
	}

	/**
	 * 解密数据
	 * 
	 * @param data
	 *            待解密数据
	 * @param key
	 *            密钥
	 * @return byte[] 解密后的数据
	 * */
	public static String decrypt(String text) throws Exception {
		byte[] data=Base64.decodeBase64(text);
		String key_String = "8cJ50OkBcw1AE2LWp1c3+837aNBbBLPH";// 静态密钥
		byte[] key = Base64.decodeBase64(key_String);
		// 欢迎密钥
		Key k = toKey(key);
		// 实例化
		Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
		// 初始化，设置为解密模式
		cipher.init(Cipher.DECRYPT_MODE, k);
		// 执行操作
		byte[] data_1=cipher.doFinal(data);
		return new String(data_1);
	}
}
