<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.ClubManager.aspx.cs" Inherits="_2_ClubManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/jsgrid.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/jsgrid-theme.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/sweetalert2.css" rel="stylesheet" />
    <style>
        .jsgrid-cell {
            word-wrap: break-word;
            white-space: normal !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row grid-margin ">
            <div class="col-12" aria-autocomplete="none">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">建立社團申請</h4>
                        <h4 class="card-text">
                            <asp:HyperLink ID="HyperLink1" CssClass="btn btn-warning" runat="server" NavigateUrl="~/2.ClubTotal.aspx">社團總覽</asp:HyperLink>
                        </h4>
                        <div id="js-grid" class="pt-3"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row grid-margin">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">加入社團申請</h4>
                        <div id="js-grid-EmployeeApply" class="pt-3"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row grid-margin">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">退出社團申請</h4>
                        <div id="js-grid-EmployeeQuit" class="pt-3"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="2.custom/tonyJS/jsgrid.min.js"></script>
    <script src="2.custom/tonyJS/jsgrid-zh-tw.js"></script>
    <script src="2.custom/tonyJS/sweetalert2.js"></script>
    <script src="2.custom/tonyJS/jq.tablesort.js"></script>
    <script src="2.custom/tonyJS/tablesorter.js"></script>
    <script>


        $(function () {
            jsGrid.locale("zh-tw");

            var mySelect = [

                { Name: "同意", Bool: "true" },
                { Name: "駁回", Bool: "false" }
            ]

            $("#js-grid").jsGrid({
                height: "500px",
                width: "100%",
                filtering: true,
                editing: true,
                inserting: false,
                sorting: true,
                paging: true,
                pageLoading: true,
                autoload: true,
                pageSize: 5,
                pageButtonCount: 5,
                pageIndex: 1,
                deleteConfirm: "確定要刪除嗎?",
                fields: [
                    {
                        name: "Id2",
                        title: "申請編號",
                        type: "textarea",
                        width: 80,
                        validate: "required"
                    },
                    { name: "ClubName2", title: "社團名稱", type: "textarea", width: 100, validate: "required" },
                    { name: "ClubFounderId2", title: "申請人員工編號", type: "textarea", width: 100, validate: "required" },
                    {
                        name: "ClubFounderName2",
                        title: "申請人姓名",
                        type: "textarea",
                        width: 100,
                        validate: "required"
                    },
                    {
                        name: "ClubScript2",
                        title: "社團描述(30字內)",
                        type: "textarea",
                        width: 120,
                        validate: "required"
                    },
                    {
                        name: "DetailClubScript2",
                        title: "社團詳細描述",
                        type: "textarea",
                        width: 300,
                        validate: "required"
                    },
                    {
                        name: "PeopleCount2",
                        title: "社團人數",
                        type: "number",
                        width: 80,
                        validate: "required"
                    },
                    {
                        name: "Approve2",
                        title: "核准",
                        type: "select",
                        sorting: false,
                        items: mySelect,
                        valueField: "Bool",
                        textField: "Name",
                        width: 80,
                        hidden: false

                    },
                    {
                        type: "control"
                    }
                ],
                controller: {
                    loadData: function (filter) {
                        var myData = null;
                        var itemCount = 0;
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "TonyWebService.asmx/GetTemporaryClub",
                            data: JSON.stringify({
                                pageSize: filter.pageSize,
                                pageIndex: filter.pageIndex
                            }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                myData = data.d.Products;
                                itemCount = data.d.TotalCount;

                            },
                            failure: function (errMsg) {
                                alert(errMsg);
                            }
                        });
                        return {
                            data: myData,
                            itemsCount: itemCount
                        };

                    },
                    insertItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/InsertTemporaryClub",
                            data: JSON.stringify({ club: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { swal('完成!', '資料已新增', 'success') }
                        });
                    },
                    updateItem: function (item) {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "TonyWebService.asmx/EditTemporaryClub",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                swal(data.d, '', 'success');
                                /* alert(data.d);*/
                                /* window.location.reload();*/
                            }
                        });
                    },
                    deleteItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/DeleteTemporaryClub",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                swal(data.d, '', 'success');
                                /*alert(data.d);*/
                                /*window.location.reload();*/
                            }
                        });
                    },
                },

            });



            $("#js-grid-EmployeeApply").jsGrid({
                height: "500px",
                width: "100%",
                filtering: true,
                editing: true,
                inserting: false,
                sorting: true,
                paging: true,
                pageLoading: true,
                autoload: true,
                pageSize: 5,
                pageButtonCount: 5,
                pageIndex: 1,
                deleteConfirm: "確定要刪除嗎?",
                fields: [
                    {
                        name: "EMClubCount",
                        title: "申請編號",
                        type: "textarea",
                        width: 80,
                        validate: "required"
                    },
                    { name: "EmployeeId", title: "員工編號", type: "textarea", width: 100, validate: "required" },
                    { name: "EmployeeName", title: "姓名", type: "textarea", width: 100, validate: "required" },
                    {
                        name: "EmployeeDepartment",
                        title: "部門",
                        type: "textarea",
                        width: 100,
                        validate: "required"
                    },
                    {
                        name: "JoinClubName",
                        title: "社團名稱",
                        type: "textarea",
                        width: 100,
                        validate: "required"
                    },
                    {
                        name: "JoinClubReason",
                        title: "申請原因",
                        type: "textarea",
                        width: 300,
                        validate: "required"
                    },
                    {
                        name: "Approve",
                        title: "核准",
                        type: "select",
                        sorting: false,
                        items: mySelect,
                        valueField: "Bool",
                        textField: "Name",
                        width: 80

                    },
                    {
                        type: "control"
                    }
                ],
                controller: {
                    loadData: function (filter) {
                        var myData = null;
                        var itemCount = 0;
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "TonyWebService.asmx/GetEmployeeApply",
                            data: JSON.stringify({
                                pageSize: filter.pageSize,
                                pageIndex: filter.pageIndex
                            }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                myData = data.d.Products;
                                itemCount = data.d.TotalCount;

                            },
                            failure: function (errMsg) {
                                alert(errMsg);
                            }
                        });
                        return {
                            data: myData,
                            itemsCount: itemCount
                        };

                    },
                    insertItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/InsertEmployeeApply",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { swal('完成!', '資料已新增', 'success') }
                        });
                    },
                    updateItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/EditEmployeeApply",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                swal(data.d, '', 'success');
                                /*  alert(data.d);*/
                                /*window.location.reload();*/
                            }
                        });
                    },
                    deleteItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/DeleteEmployeeApply",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { /*swal('完成!', '資料已刪除', 'success')*/
                                alert(data.d);
                                /* window.location.reload();*/
                            }
                        });
                    },
                },

            });



            $("#js-grid-EmployeeQuit").jsGrid({
                height: "500px",
                width: "100%",
                filtering: true,
                editing: true,
                inserting: false,
                sorting: true,
                paging: true,
                pageLoading: true,
                autoload: true,
                pageSize: 5,
                pageButtonCount: 5,
                pageIndex: 1,
                deleteConfirm: "確定要刪除嗎?",
                fields: [
                    {
                        name: "QuitEMClubCount",
                        title: "申請編號",
                        type: "textarea",
                        width: 80,
                        validate: "required"
                    },
                    { name: "EmployeeId", title: "員工編號", type: "textarea", width: 100, validate: "required" },
                    { name: "EmployeeName", title: "姓名", type: "textarea", width: 100, validate: "required" },
                    {
                        name: "EmployeeDepartment",
                        title: "部門",
                        type: "textarea",
                        width: 100,
                        validate: "required"
                    },
                    {
                        name: "QuitClubName",
                        title: "社團名稱",
                        type: "textarea",
                        width: 100,
                        validate: "required"
                    },
                    {
                        name: "QuitClubReason",
                        title: "申請原因",
                        type: "textarea",
                        width: 300,
                        validate: "required"
                    },
                    {
                        name: "Approve",
                        title: "核准",
                        type: "select",
                        sorting: false,
                        items: mySelect,
                        valueField: "Bool",
                        textField: "Name",
                        width: 80

                    },
                    {
                        type: "control"
                    }
                ],
                controller: {
                    loadData: function (filter) {
                        var myData = null;
                        var itemCount = 0;
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "TonyWebService.asmx/GetEmployeeQuitApply",
                            data: JSON.stringify({
                                pageSize: filter.pageSize,
                                pageIndex: filter.pageIndex
                            }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                myData = data.d.Products;
                                itemCount = data.d.TotalCount;

                            },
                            failure: function (errMsg) {
                                alert(errMsg);
                            }
                        });
                        return {
                            data: myData,
                            itemsCount: itemCount
                        };

                    },
                    insertItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/InsertEmployeeApply",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { swal('完成!', '資料已新增', 'success') }
                        });
                    },
                    updateItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/EditEmployeeQuitApply",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                swal(data.d, '', 'success');
                                /*alert(data.d);*/
                                /*window.location.reload();*/
                            }
                        });
                    },
                    deleteItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/DeleteEmployeeQuitApply",
                            data: JSON.stringify({ la: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                swal(data.d, '', 'success');
                                /* alert(data.d);*/
                                /* window.location.reload();*/
                            }
                        });
                    },
                },

            });

        });


    </script>
</asp:Content>

