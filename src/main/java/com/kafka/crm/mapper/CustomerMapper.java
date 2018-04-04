package com.kafka.crm.mapper;

import java.util.List;

import com.kafka.crm.pojo.Customer;
import com.kafka.crm.pojo.QueryVo;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerMapper {
	//根据QueryVo查询用户列表
	List<Customer> selectCustomerListByQueryVo(QueryVo vo);

	//通过ID查询客户
	Customer selectCustomerById(Integer id);

	//修改客户通过ID
	void updateCustomerById(Customer customer);

	//删除客户通过ID
	void deleteCustomerById(Integer id);

}
