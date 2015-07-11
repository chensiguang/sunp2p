package com.sunyard.directbank.base.model;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

public class Properties {
	private static final String CONFIG = "conf";
	private static ResourceBundle CONFIG_RES = ResourceBundle.getBundle(CONFIG);

	private Properties() {
	}

	public static String getString(String key) {
		try {
			return CONFIG_RES.getString(key);
		} catch (MissingResourceException e) {
		}
		return "";
	}

	public static int getInt(String key) {
		String value = getString(key);
		if (!(value == null || "".equals(value))) {
			try {
				return Integer.parseInt(value);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public static boolean getBoolean(String key) {
		return "true".equals(getString(key));
	}
}
