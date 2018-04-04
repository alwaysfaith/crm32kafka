package com.kafka.crm.mapper;

import java.util.List;

import com.kafka.crm.pojo.BaseDict;
import org.springframework.stereotype.Repository;

@Repository
public interface BaseDictMapper {
      //查询
       List<BaseDict> selectBaseDictListByCode(String code);
}
