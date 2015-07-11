package com.sunyard.directbank.tools;

import java.text.SimpleDateFormat;
import java.util.Date;



public enum PrimaryGenerater {
	  DEFAULT{
	    private static final String SERIAL_NUMBER = "%010d";
	    public synchronized String generaterNextNumber(String sno) {
	      SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
	      int prevNo = 1;
	      if(null != sno && sno.length() == 18) {
	        if(sno.matches("^\\d+$")) {
	          prevNo = Integer.valueOf(sno.substring(8, 18)) + 1;
	        } else {
	          throw new IllegalArgumentException(String.format("非法参数:%s",sno));
	        }
	      }
	      return String.format("%s"+SERIAL_NUMBER, formatter.format(new Date()),prevNo);
	    }
	  };

	  /**
	   * 生成下一个编号
	   */
	  public String generaterNextNumber(String sno) {
	    throw new AbstractMethodError();
	  }  
	
	}

