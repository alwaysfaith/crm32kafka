<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/2
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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

</head>
<body>


<div id="page-wrapper">
    <div class="panel panel-default">
        <div class="panel-body">
            <form class="form-inline" data-action="/customer/list"  id="J-from-apply">
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
                        <option value="" selected>--请选择--</option>
                        <option value="1">教育培训 </option>
                        <option value="2">电子商务</option>
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

                <button type="button" class="btn btn-primary" name="btnSubmit">查询</button>
            </form>
        </div>
    </div>
</div>

<table id="ArbetTable"></table>

<script type="text/javascript">
    $(function () {
         //1.初始化Table
            var oTable = new TableInit();
          oTable.Init();
      });
    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#ArbetTable').bootstrapTable({
                url: '/customer/list',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize:10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                contentType: "application/x-www-form-urlencoded",
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 700,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "no",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [
                    {
                        field: 'cust_address',
                        title: 'cust_address',
                        align: 'center',
                        sortable: true
                    },
                    {
                        field: 'cust_create_id',
                        title: 'cust_create_id',
                        align: 'center'
                    },
                    {
                        field: 'cust_id',
                        title: 'cust_id',
                        align: 'center'
                    },
                    {
                        field: 'cust_industry',
                        title: 'cust_industry',
                        align: 'center'
                    },
                    {
                        field: 'cust_level',
                        title: 'cust_level',
                        align: 'center'
                    },
                    {
                        field: 'cust_linkman',
                        title: 'cust_linkman',
                        align: 'center'
                    },
                    {
                        field: 'cust_name',
                        title: 'cust_name',
                        align: 'center'
                    },
                    {
                        field: 'cust_phone',
                        title: 'cust_phone',
                        align: 'center'
                    },
                    {
                        field: 'cust_source',
                        title: 'cust_source',
                        align: 'center'
                    },
                    {
                        field: 'cust_user_id',
                        title: 'cust_user_id',
                        align: 'center'
                    },
                    {
                        field: 'cust_zipcode',
                        title: 'cust_zipcode',
                        align: 'center'
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        formatter: operateFormatter //自定义方法，添加操作按钮
                    }
                ],
                rowStyle: function (row, index) {
                    var classesArr = ['success', 'info'];
                    var strclass = "";
                    if (index % 2 === 0) {//偶数行
                        strclass = classesArr[0];
                    } else {//奇数行
                        strclass = classesArr[1];
                    }
                    return { classes: strclass };
                },//隔行变色
            });

        };


        //得到查询的参数
        oTableInit.queryParams = function (params) {
            console.log(params);
            var pageInfo = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset:params.offset
            };
            return pageInfo;
        };
        return oTableInit;
    };


    function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<a class="btn active disabled" href="#">编辑</a>',
            '<a class="btn active" href="#">档案</a>',
            '<a class="btn btn-default" href="#">记录</a>',
            '<a class="btn active" href="#">准入</a>'
        ].join('');
    }

</script>
<script type="text/javascript">
    var form=$('#J-from-apply'),
         btn=form.find('button[name="btnSubmit"]'),
        action=form.attr('data-action'),
        cust_name=form.find('custName').val(),
        cust_source=form.find('custSource').val(),
        cust_industry=form.find('custIndustry').val(),
        cust_level=form.find('custLevel').val();
        btn.on('click',function () {
            $.ajax({
                type: "POST",
                url: action,
                data: {custName:cust_name,custSource:cust_source,custIndustry:cust_industry,custLevel:cust_level},
                success: function(data){
                    console.log(data);
                }
            });
        })
</script>


</body>
</html>
