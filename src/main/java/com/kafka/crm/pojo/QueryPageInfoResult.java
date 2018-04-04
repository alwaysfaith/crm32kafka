package com.kafka.crm.pojo;

import com.github.pagehelper.PageInfo;

import java.util.List;

public class QueryPageInfoResult {

    //总条数
    private PageInfo total;
    //返回list
    private List<Customer> rows;

    public PageInfo getTotal() {
        return total;
    }
    public void setTotal(PageInfo total) {
        this.total = total;
    }
    public List<Customer> getRows() {
        return rows;
    }
    public void setRows(List<Customer> rows) {
        this.rows = rows;
    }
    @Override
    public String toString() {
        return "QueryPageInfoResult{" +
                "total=" + total +
                ", rows=" + rows +
                '}';
    }
}
