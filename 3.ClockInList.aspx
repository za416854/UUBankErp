<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.ClockInList.aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link href="Scripts/kris/sweetalert2.min.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="card">
            <div class="card-body">
                <h4 class="badge badge-outline-primary" style="font-size: x-large">員工打卡紀錄</h4>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table id="order-listing" class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type='checkbox' id="AllCheck" name='Check_ctr' value='yes' onclick="Check('check_list[]')"></th>
                                        <th>打卡流水號 #</th>
                                        <th>姓名</th>
                                        <th>打卡日期</th>
                                        <th>上班時間</th>
                                        <th>下班時間</th>
                                        <th>核准情況</th>
                                        <th>核准</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <input type='checkbox' class='QQ' value='<%#Eval("ClockInId") %>' /></td>
                                                <td><%#Eval("ClockInId") %></td>
                                                <td><%#Eval("Name") %></td>
                                                <td><%#Eval("Date") %></td>
                                                <td><%#Eval("ClockInTime") %></td>
                                                <td><%#Eval("ClockOutTime") %></td>
                                                <td><%#Eval("Approval") %></td>
                                                <td><a class="btn btn-outline-primary" href='<%# Eval("ClockInId" , "/3.CheckInApprovalPage.aspx?id={0}") %>'>核准</a></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <input type="button" id="buttonMultiple" class="btn btn-outline-primary" value="批次核准" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <!-- Plugin js for this page-->
    <script src="/vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <!-- End plugin js for this page-->

    <!-- Custom js for this page-->
    <script src="/js/data-table.js"></script>
    <script src="Scripts/kris/sweetalert2.min.js"></script>
    <!-- End custom js for this page-->
    <script>
        $("#AllCheck").click(function () {
            if ($("#AllCheck").prop("checked")) {
                $("input[class='QQ']").each(function () {
                    $(this).prop("checked", true);
                })
            }
            else {
                $("input[class='QQ']").each(function () {
                    $(this).prop("checked", false);
                })
            }
        });

        $(function () {
            $("#buttonMultiple").click(function () {
                swal({
                    title: '確認?',
                    text: "即將送出覆核!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(function () {
                    var myData = new Array();
                    $("input[class='QQ']").each(function () {
                        if ($(this).prop("checked") === true) {
                            myData.push($(this).val());
                        }
                    });
                    if (myData.length == 0) {
                        swal({
                            title: '警告',
                            text: '請至少選一樣',
                            type: 'info',
                            showCancelButton: false,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#EA0000',
                        })
                    } else {
                        var tacked = {
                            id: myData
                            //這個名稱要跟webService的參數名稱一樣
                        };

                        $.ajax({
                            type: 'POST',
                            url: "WebService.asmx/UpdateMultipleClockInApproval",
                            contentType: "application/json;utf-8",
                            dataType: "json",
                            data: JSON.stringify(tacked),
                            async: false,
                            success: function (result) {
                                swal({
                                    title: '已送出覆核!',
                                    text: '',
                                    type: 'success',
                                    showCancelButton: false,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#EA0000',
                                })
                                setTimeout(function myfunction() {
                                    window.location.href = "/3.CheckInApprovalPageForAjax.aspx";
                                }, 1500)
                            }
                        });
                    }

                },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal({
                                title: '打卡未覆核',
                                text: '',
                                type: 'warning',
                                showCancelButton: false,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#EA0000',
                            })
                        }
                    });

            });
        });
    </script>
</asp:Content>

