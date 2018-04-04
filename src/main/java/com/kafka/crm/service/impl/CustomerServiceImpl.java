package com.kafka.crm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kafka.crm.mapper.CustomerMapper;
import com.kafka.crm.pojo.Customer;
import com.kafka.crm.pojo.QueryPageInfoResult;
import com.kafka.crm.pojo.QueryResult;
import com.kafka.crm.pojo.QueryVo;
import com.kafka.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper  customerMapper;


    @Override
    public QueryResult selectCustomerListByQueryVo(int offset,int limit,QueryVo vo) {

        int page=offset/limit+1;
        PageHelper.startPage(page,limit);
        List<Customer> customerList = customerMapper.selectCustomerListByQueryVo(vo);
        PageInfo<Customer> pageInfo = new PageInfo<>(customerList);
        QueryResult result = new QueryResult();
        //取分页结果
        result.setRows(customerList);
        //取总记录数
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public QueryPageInfoResult selectCustomerListByPageInfo(int pageInfo, QueryVo vo) {

        PageHelper.startPage(pageInfo,10);
        List<Customer> customerList = customerMapper.selectCustomerListByQueryVo(vo);
        PageInfo<Customer> page= new PageInfo<>(customerList);
        QueryPageInfoResult infoResult = new QueryPageInfoResult();
        //取分页结果
        infoResult.setRows(customerList);
        //取总记录数
        infoResult.setTotal(page);

        return infoResult;
    }

    @Override
    public Customer selectCustomerById(Integer id) {
        return customerMapper.selectCustomerById(id);
    }

    @Override
    public void updateCustomerById(Customer customer) {
        customerMapper.updateCustomerById(customer);
    }

    @Override
    public void deleteCustomerById(Integer id) {
        customerMapper.deleteCustomerById(id);
    }
}






