package com.kafka.crm.controller;

import com.kafka.crm.pojo.BaseDict;
import com.kafka.crm.pojo.QueryResult;
import com.kafka.crm.pojo.QueryVo;
import com.kafka.crm.service.BaseDictService;
import com.kafka.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BaseDictController {


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

    @RequestMapping("/customer/list2")
    public  String showBaseDictList(Model model){

        List<BaseDict> fromType = baseDictService.selectBaseDictListByCode(fromTypeCode);
        List<BaseDict> industryType = baseDictService.selectBaseDictListByCode(industryTypeCode);
        List<BaseDict> levelType = baseDictService.selectBaseDictListByCode(levelTypeCode);

        model.addAttribute("fromType", fromType);
        model.addAttribute("industryType", industryType);
        model.addAttribute("levelType", levelType);

        return "customer";

    }
}
