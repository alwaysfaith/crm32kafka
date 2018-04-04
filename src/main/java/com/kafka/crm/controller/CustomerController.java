package com.kafka.crm.controller;


import com.kafka.crm.pojo.QueryResult;
import com.kafka.crm.pojo.QueryVo;
import com.kafka.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CustomerController {

    @Autowired
    private CustomerService  customerService;

    //###客户来源002
    @Value("${fromType.code}")
    private String fromTypeCode;

    //###客户级别006
    @Value("${levelType.code}")
    private String levelTypeCode;

    //###所属行业001
    @Value("${industryType.code}")
    private String industryTypeCode;

    @RequestMapping("/customer")
    public  String page(){
        return "basedict";
    }

    @RequestMapping("/customer/list")
    @ResponseBody
    public  QueryResult showCustomerList(@RequestParam(required=true,defaultValue = "1") Integer offset,@RequestParam(required=true,defaultValue = "10") Integer limit,QueryVo vo){
        QueryResult result = customerService.selectCustomerListByQueryVo(offset,limit,vo);
        return result;
    }
}
