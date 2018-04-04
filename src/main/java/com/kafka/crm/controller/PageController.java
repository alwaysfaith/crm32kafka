package com.kafka.crm.controller;
import com.kafka.crm.pojo.*;
import com.kafka.crm.service.BaseDictService;
import com.kafka.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PageController {


    @Autowired
    private CustomerService customerService;

    @Autowired
    private BaseDictService baseDictService;

    //###客户来源002
    @Value("${fromType.code}")
    private String fromTypeCode;

    //###客户级别006
    @Value("${levelType.code}")
    private String levelTypeCode;

    //###所属行业001
    @Value("${industryType.code}")
    private String industryTypeCode;


    @RequestMapping(value = "/page")
    public  String showPageList(@RequestParam(required=true,defaultValue = "1") Integer pageInfo,QueryVo vo, Model model){

        List<BaseDict> fromType = baseDictService.selectBaseDictListByCode(fromTypeCode);
        List<BaseDict> industryType = baseDictService.selectBaseDictListByCode("001");
        List<BaseDict> levelType = baseDictService.selectBaseDictListByCode("006");
        model.addAttribute("fromType", fromType);
        model.addAttribute("industryType", industryType);
        model.addAttribute("levelType", levelType);
        QueryPageInfoResult infoResult = customerService.selectCustomerListByPageInfo(pageInfo, vo);
        model.addAttribute("page", infoResult.getRows());
        model.addAttribute("pageInfo", infoResult.getTotal());
        model.addAttribute("custName", vo.getCustName());
        model.addAttribute("custSource", vo.getCustSource());
        model.addAttribute("custIndustry", vo.getCustIndustry());
        model.addAttribute("custLevel", vo.getCustLevel());

        return "customer";

    }

    @RequestMapping(value = "/page/edit",method=RequestMethod.GET )
    @ResponseBody
    public  Customer customerEdit(Integer id){
        Customer customer = customerService.selectCustomerById(id);
        return customer;
    }

    @RequestMapping(value = "/page/update",method=RequestMethod.POST )
    @ResponseBody
    public  String customerUpdate(Customer customer){
        customerService.updateCustomerById(customer);
        return "OK";
    }

    @RequestMapping(value = "/page/delete",method=RequestMethod.POST )
    @ResponseBody
    public  String customerDelete(Integer id){

        customerService.deleteCustomerById(id);
        return "OK";
    }
}
