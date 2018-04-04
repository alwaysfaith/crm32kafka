<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/3
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link href="../../css/bootstrap.css" rel="stylesheet">
    <!-- 引入bootstrap-table样式 -->
    <link href="../../css/bootstrap-table.css" rel="stylesheet">
    <!-- jquery -->
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>

    <!-- bootstrap-table.min.js -->
    <script src="../../js/bootstrap-table.js"></script>
    <!-- 引入中文语言包 -->
    <script src="../../js/local/bootstrap-table-zh-CN.js"></script>

    <style type="text/css">
        .panel-body{
            text-align: center;
        }
        .fixed-table-body {
            height:50%;
            min-height: 50%;
        }
    </style>

</head>
<body>


<div id="page-wrapper">
    <div class="panel panel-default">
        <div class="panel-body">
            <form class="form-inline" data-url="${pageContext.request.contextPath}/customer/list" data-query-params="queryParams"  id="searchForm">
                <div class="form-group">
                    <label for="customerName">客户名称</label>
                    <input type="text" class="form-control" id="customerName" value="" name="custName">
                </div>
                <div class="form-group">
                    <label for="customerFrom">客户来源</label>
                    <select class="form-control" id="customerFrom" placeholder="客户来源" name="custSource">
                        <option value="" selected>--请选择--</option>
                        <option value="6">电话营销</option>
                        <option value="7">网络营销</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="custIndustry">所属行业</label>
                    <select class="form-control" id="custIndustry" name="custIndustry">
                        <option value="" >--请选择--</option>
                        <option value="1">教育培训 </option>
                        <option value="2" >电子商务</option>
                        <option value="3">对外贸易</option>
                        <option value="4">酒店旅游</option>
                        <option value="5">房地产</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="custLevel">客户级别</label>
                    <select class="form-control" id="custLevel" name="custLevel">
                        <option value="" selected>--请选择--</option>
                        <option value="22">普通客户</option>
                        <option value="23">VIP客户</option>
                    </select>
                </div>
                <button type="button" class="btn btn-primary" id="btnSubmit">查询</button>
            </form>
        </div>
    </div>
</div>

<table id="table" data-toggle="table" data-url="${pageContext.request.contextPath}/customer/list" data-query-params="queryParams">
    <thead>
        <tr>
            <th data-field="cust_address" data-sortable="true">ID</th>
            <th data-field="cust_name">客户名称</th>
            <th data-field="cust_id">客户来源</th>
            <th data-field="cust_industry">客户所属行业</th>
            <th data-field="cust_level">客户级别</th>
            <th data-field="cust_linkman">固定电话</th>
            <th data-field="cust_phone">手机</th>
            <th data-field="id" data-formatter="operateFormatter">操作</th>
        </tr>
    </thead>
</table>


<script>
    // bootstrapTable
    var table = {
        classes: 'table table-hover table-striped table-no-bordered',//
        pagination: true,
        sidePagination: 'server',
        toolbar: '#toolbar',
        idField: 'id',     // 主键字段,默认给id
        queryParamsType: 'custom'// limit
    };
    $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN'],table);
    var column = {
        align: 'center'
    }
    $.extend($.fn.bootstrapTable.columnDefaults, column);
    /**
     * 表单属性转json
     * <p>
     * 去除空字段
     */
    $.fn.serializeJSON = function() {
        var json = {};
        var form = this.serializeArray();
        console.log(form);
        $.each(form, function() {
            if (this.value) {
                if (json[this.name]) {
                    if (!json[this.name].push) {
                        json[this.name] = [ json[this.name]];
                    }
                    json[this.name].push(this.value);
                } else {
                    json[this.name] = this.value;
                }
            }
        });
        return json;
    };

    // 表单查询条件
    function queryParams(params) {
        var query = $("#searchForm").serializeJSON();
        query["offset"] = params.pageNumber;
        query["limit"] = params.pageSize;
        if (params.custIndustry) {
            query["custIndustry"] = params.custIndustry + " " + params.custIndustry;
        }
        return query;
    }

    //右侧增加删除
    function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<a class="btn active disabled" href="#">编辑</a>',
            '<a class="btn active" href="#">档案</a>',
            '<a class="btn btn-default" href="#">记录</a>',
            '<a class="btn active" href="#">准入</a>'
        ].join('');
    }


    $('#btnSubmit').on('click',function(){
        $("#table").bootstrapTable('refresh');
    });

</script>

</body>
</html>
