package com.kafka.crm.service;

import com.kafka.crm.pojo.Customer;
import com.kafka.crm.pojo.QueryPageInfoResult;
import com.kafka.crm.pojo.QueryResult;
import com.kafka.crm.pojo.QueryVo;

public interface CustomerService {

    //根据QueryVo查询用户列表并查询分页
    QueryResult selectCustomerListByQueryVo(int offset,int limit,QueryVo vo);

    //根据QueryVo查询用户列表并查询分页
    QueryPageInfoResult selectCustomerListByPageInfo(int pageInfo,QueryVo vo);

    //通过ID查询客户
    Customer selectCustomerById(Integer id);

    //修改客户通过ID
    void updateCustomerById(Customer customer);

    //删除客户通过ID
    void deleteCustomerById(Integer id);
}
