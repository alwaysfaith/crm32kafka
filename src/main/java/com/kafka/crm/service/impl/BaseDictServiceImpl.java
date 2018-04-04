package com.kafka.crm.service.impl;

import java.util.List;

import com.kafka.crm.mapper.BaseDictMapper;
import com.kafka.crm.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kafka.crm.pojo.BaseDict;

@Service
public class BaseDictServiceImpl implements BaseDictService {

    @Autowired
    private BaseDictMapper baseDictMapper;

    @Override
    public List<BaseDict> selectBaseDictListByCode(String code) {
        return baseDictMapper.selectBaseDictListByCode(code);
    }

}
