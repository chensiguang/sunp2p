package com.sunyard.directbank.tools;
 

import org.apache.commons.lang.time.FastDateFormat;

import com.sunyard.directbank.base.SpringUtil;
import com.sunyard.directbank.base.service.IGenerateSeq;

import java.util.Calendar;
import java.util.Map;

public final class GenerateSeqUtil {

    private GenerateSeqUtil() {
    }

    public static final String generateSeq_Time(String prefix) {
        String id = prefix;
        id += FastDateFormat.getInstance("yyyyMMddHHMMssSS").format(Calendar.getInstance());
        return id;
    }
    /**
     * 类型定义
     * @see SEQCODETYPE
     **/
    public static Map<String,String> generateSeq(final String[] seq_codes) throws Exception{
    	IGenerateSeq generateSeqImpl = (IGenerateSeq)SpringUtil.getBean("generateSeqImpl");
        Map<String,String> seq = generateSeqImpl.getSeq(seq_codes);
        return seq;
    }


}
