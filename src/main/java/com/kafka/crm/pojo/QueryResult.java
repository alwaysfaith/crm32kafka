package com.kafka.crm.pojo;

import java.util.List;

public class QueryResult {

    //总条数
    private long total;
    //返回list
    private List<Customer> rows;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
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
        return "QueryResult{" +
                "total=" + total +
                ", rows=" + rows +
                '}';
    }
}
