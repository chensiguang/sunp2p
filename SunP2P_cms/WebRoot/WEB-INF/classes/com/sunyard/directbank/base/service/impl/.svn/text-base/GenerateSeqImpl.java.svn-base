package com.sunyard.directbank.base.service.impl;

import com.sunyard.directbank.base.dao.GenerateSeqDao;
import com.sunyard.directbank.base.service.IGenerateSeq;
import com.sunyard.directbank.tools.GenerateSeqUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.HashMap;
import java.util.Map;

@Service
@Transactional
public class GenerateSeqImpl implements IGenerateSeq {
    private Logger logger = LoggerFactory.getLogger(GenerateSeqImpl.class);

    @Resource
    private GenerateSeqDao generateSeqDao;

    @Override
    public Map<String,String> getSeq(String[] seq_code) throws Exception {
        Map<String,String> result = new HashMap<String, String>();
        for(String seqCode:seq_code){
            //获取当前值
            String curr_code = generateSeqDao.getSeq(seqCode);
            logger.info("curr_code={}",curr_code);
            //更新当前值
            generateSeqDao.updateSeq(seqCode,curr_code);
            result.put(seqCode,GenerateSeqUtil.generateSeq_Time("F")+curr_code);
        }
        return result;
    }
}
