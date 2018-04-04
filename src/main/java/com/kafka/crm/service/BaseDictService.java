package com.kafka.crm.service;

import java.util.List;

import com.kafka.crm.pojo.BaseDict;
import com.kafka.crm.pojo.Customer;
import com.kafka.crm.pojo.QueryVo;


public interface BaseDictService {
    //查询
    List<BaseDict> selectBaseDictListByCode(String code);
}
