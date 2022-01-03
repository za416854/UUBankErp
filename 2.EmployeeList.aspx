<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.EmployeeList.aspx.cs" Inherits="_2_EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/dataTables.bootstrap4.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/dropify.min.css" rel="stylesheet" />
    <link href="2.custom/jquery-ui.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/sweetalert2.min.css" rel="stylesheet" />
    <style>
        .head {
            color: #ff6a00
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row ">
            <div class=" col-2">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary " NavigateUrl="~/2.EditSlefPerson-Hight.aspx">返回人事首頁</asp:HyperLink>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-4">
                        <div class="media">
                            <div class="media-body">
                                <div class="card-body">
                                    <div class=" form-group">
                                        <h3 class="head card-title">變更員工資料</h3>
                                        <div class="card-text">
                                            <asp:Label ID="Label1" runat="server" Text="請選擇員工ID:" Font-Size="Large" >

                                            </asp:Label>
                                            <br />
                                            <br />
                                            <asp:DropDownList CssClass="form-control" ID="ddlId" runat="server" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="ID" OnSelectedIndexChanged="ddlId_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True" Width="200px" Font-Size="Large" ForeColor="Black">
                                                <asp:ListItem>  </asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:UUUBankErpConnectionString1 %>' SelectCommand="SELECT [ID] FROM [Employee]"></asp:SqlDataSource>
                                            <br />
                                            <div class="form-group">
                                                <div class="modal fade " id="exampleModalLive" tabindex="-1" aria-labelledby="exampleModalLiveLabel" style="display: none;" aria-hidden="true" data-bs-backdrop="static">
                                                    <div class="modal-dialog .modal-dialog-scrollable  modal-xl ">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h2 class="modal-title" id="exampleModalLiveLabel" >員工資料修改</h2>
                                                                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body media">
                                                                <div class="media-body col-4">
                                                                    <asp:Label ID="Label2" runat="server" Text="Email:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="ti-email">
                                                                        <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control" placeholder="請輸入email" data-inputmask="'alias': 'email'" im-insert="true" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <small id="emailHelp" class="form-text text-muted">
                                                                        <button type="button" id="btncheck" class="btn-warning">檢查Email是否重複 </button>
                                                                    </small>
                                                                    <br />
                                                                    <asp:Label ID="Label3" CssClass="icon-lock" runat="server" Text="Erp系統密碼:" Font-Size="X-Large" ForeColor="#625D5D">
                                                                        <asp:TextBox ID="txtEditPw" runat="server" CssClass="form-control" placeholder="請輸入密碼" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label4" runat="server" Text="人事系統密碼:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="icon-lock">
                                                                        <asp:TextBox ID="txtEditPw2" runat="server" CssClass="form-control" placeholder="請輸入密碼" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label5" runat="server" Text="姓名:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="icon-user">
                                                                        <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" placeholder="請輸入姓名" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label6" runat="server" Text="性別:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="icon-people">
                                                                        <asp:DropDownList ID="ddlEditGender" runat="server" CssClass="form-control" Width="230px">
                                                                            <asp:ListItem>男</asp:ListItem>
                                                                            <asp:ListItem>女</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label20" runat="server" Text="停權設定:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="icon-lock">
                                                                        <asp:DropDownList ID="ddlStop" runat="server">
                                                                            <asp:ListItem>否</asp:ListItem>
                                                                            <asp:ListItem>是</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </asp:Label>

                                                                </div>

                                                                <div class="media-body col-4">
                                                                    <asp:Label ID="Label15" runat="server" Text="到職日:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-calendar">
                                                                        <asp:TextBox ID="txtEditHireDay" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label16" runat="server" Text="離職日:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-calendar">
                                                                        <asp:TextBox ID="txtEditResginDay" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label17" runat="server" Text="薪資:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="ti-money">
                                                                        <asp:TextBox ID="txtEditSalary" runat="server" CssClass="form-control" placeholder="請輸入薪資" TextMode="Number" min="24000" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />

                                                                    <asp:Label ID="Label13" runat="server" Text="部門:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-briefcase">
                                                                        <asp:TextBox ID="txtEditClub" runat="server" CssClass="form-control" placeholder="請輸入部門" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label14" runat="server" Text="職位:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-id-card">
                                                                        <asp:TextBox ID="txtEditPosition" runat="server" CssClass="form-control" placeholder="請輸入職位" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label11" runat="server" Text="分機:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-address-card">
                                                                        <asp:TextBox ID="txtEditExtention" runat="server" CssClass="form-control" placeholder="請輸入分機" Width="230px"></asp:TextBox>
                                                                    </asp:Label>

                                                                </div>
                                                                <br />
                                                                <div class="media-body col-6">
                                                                    <asp:Label ID="Label7" runat="server" Text="出生日期:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-calendar-o">
                                                                        <asp:TextBox ID="txtEditBirth" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label8" runat="server" Text="居住地址:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-address-card">
                                                                        <asp:TextBox ID="txtEditAdress" runat="server" CssClass="form-control" placeholder="請輸入地址" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label9" runat="server" Text="手機:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-mobile">
                                                                        <asp:TextBox ID="txtEditCellPhone" runat="server" CssClass="form-control" placeholder="請輸入手機" data-inputmask-alias="9999-999999" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label10" runat="server" Text="居住電話:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="fa fa-phone-square">
                                                                        <asp:TextBox ID="txtEditHomePhone" runat="server" CssClass="form-control" placeholder="請輸入居住電話" data-inputmask-alias="(99) 9999-9999" Width="230px"></asp:TextBox>
                                                                    </asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label12" runat="server" Text="個人照片:" Font-Size="X-Large" ForeColor="#625D5D">
                                                                        <div class="card w-50 ">
                                                                            <div class="card-body text-center ">
                                                                                <h4 class="card-title d-flex">照片上傳
                                                                         <small class="ms-auto align-self-end"></small>
                                                                                </h4>
                                                                                <asp:FileUpload ID="fulImage" runat="server" CssClass="dropify" />
                                                                            </div>
                                                                        </div>
                                                                    </asp:Label>
                                                                    <br />
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <asp:Button ID="btnEdit" runat="server" Text="修改" class="btn btn-outline-info" OnClick="btnEdit_Click" OnClientClick="return false;" />
                                                                <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">關閉</button>
                                                                <asp:HiddenField ID="hid1" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="button" class="fa fa-edit btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModalLive">
                                                    修改
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="form-group">
                                        <h3 class="head card-title">刪除員工資料</h3>
                                        <div class="card-text">
                                            <asp:Label ID="Label18" runat="server" Text="請勾選員工:" Font-Size="Large" >  
                                            </asp:Label>
                                            <br />
                                            <br />
                                            <input type="button" id="btndelete" class="mdi mdi-delete-forever btn btn-outline-danger form-control" value="刪除" style="width: 150px; font-size: large" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="form-group">
                                        <h3 class="head card-title">匯出EXCEL</h3>
                                        <div class="card-text">
                                            <asp:Label ID="Label19" runat="server" Text="員工資料匯出:" Font-Size="Large" >
                                            </asp:Label>
                                            <br />
                                            <br />
                                            <asp:Button ID="btnExcel" runat="server" Text="匯出" CssClass="form-control btn btn-outline-success" OnClick="btnExcel_Click" OnClientClick="return false;" Width="150px" Font-Size="Large" />
                                            <asp:HiddenField ID="hid2" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="media-body">
                                <div class="card-body">
                                    <div class="form-group">
                                        <h3 class="head card-title">返回首頁</h3>
                                        <div class="card-text">
                                           

                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <hr />
                <h3 class="head">員工資料表</h3>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <asp:Repeater ID="rptHuman" runat="server">
                                <HeaderTemplate>
                                    <table id="order-listing" class="table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <%--<div>
                                                        <label id="all" for="allcheck">
                                                            全選:
                                                        <input type="checkbox" id="allcheck" name="allcheck" />
                                                        </label>
                                                    </div>--%>
                                                    全選:
                                                        <input type="checkbox" id="allcheck" name="allcheck" />
                                                </th>
                                                <th>員工編號</th>
                                                <th>Email</th>
                                                <th>姓名</th>
                                                <th>性別</th>
                                                <th>出生日期</th>
                                                <th>居住地址</th>
                                                <th>手機</th>
                                                <th>居住電話</th>
                                                <th>部門</th>
                                                <th>職位</th>
                                                <th>分機</th>
                                                <th>薪資</th>
                                                <th>到職日</th>
                                                <th>離職日</th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="QQ" id="CheckboxGroup1_0" value="<%# Eval("ID") %>" />

                                            </td>
                                            <td><%# Eval("ID") %></td>
                                            <td>
                                                <%-- <textarea rows="2" cols="20" readonly="readonly"><%# Eval("Email") %></textarea>--%>
                                                <%# Eval("Email") %>
                                            </td>
                                            <td><%# Eval("Name") %></td>
                                            <td><%# Eval("Gender") %></td>
                                            <%--<td><%# Eval("Birthday","{0:yyyy/MM/dd}") %></td>--%>
                                            <td><%# Eval("Birthday") %></td>
                                            <td>
                                                <textarea rows="2" cols="20" readonly="readonly" style="background-color: snow"> <%# Eval("Address") %></textarea>

                                            </td>
                                            <td><%# Eval("CellPhone") %></td>
                                            <td><%#Eval("HomePhone") %></td>
                                            <td><%#Eval("Department") %></td>
                                            <td><%#Eval("Position") %></td>
                                            <td><%#Eval("Extension") %></td>
                                            <td><%#Eval("Salary","{0:c}") %></td>
                                            <td><%#Eval("HireDay") %></td>
                                            <td><%# Eval("Resignday") %> </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="2.custom/tonyJS/jquery.dataTables.js"></script>
    <script src="2.custom/tonyJS/dataTables.bootstrap4.js"></script>
    <script src="2.custom/tonyJS/data-table.js"></script>
    <script src="2.custom/tonyJS/dropify.min.js"></script>
    <script src="2.custom/tonyJS/dropify.js"></script>
    <script src="2.custom/external/jquery/jquery.js"></script>
    <script src="2.custom/jquery-ui.js"></script>
    <script src="2.custom/tonyJS/jquery.inputmask.bundle.js"></script>
    <script src="2.custom/tonyJS/inputmask.js"></script>
    <script src="2.custom/tonyJS/sweetalert2.js"></script>
    <script>
        $(document).ready(init);
        function init() {
            $("#<% =txtEditHireDay.ClientID %>").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,
                constrainInput: true,
                yearSuffix: ""
            });

            $("#<% =txtEditBirth.ClientID %>").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,
                constrainInput: true,
                yearSuffix: ""
            });

            $("#<% =txtEditResginDay.ClientID %>").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,
                constrainInput: true,
                yearSuffix: ""
            });


            $("#allcheck").click(function () {
                if ($("#allcheck").prop("checked")) {
                    $("input[class='QQ']").each(function () {
                        $(this).prop("checked", true);
                    })
                } else {
                    $("input[class='QQ']").each(function () {

                        $(this).prop("checked", false);
                    })
                }



            })


            $("#btndelete").click(function () {
                swal({
                    title: '請確認!',
                    text: "員工資料即將被刪除!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(function () {
                    var EMid = new Array();
                    $("input[class='QQ']").each(function () {
                        if ($(this).prop("checked") === true) {
                            EMid.push($(this).val());
                        }
                    });
                    var EM = {
                        id: EMid
                    };
                    $.ajax({
                        type: 'POST',
                        url: "TonyWebService.asmx/deleteEM",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        data: JSON.stringify(EM),
                        success: function (result) {
                            swal({
                                title: '完成!!',
                                text: "資料已被刪除!",
                                type: 'success',
                                showCancelButton: false,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#EA0000',
                            });
                            /* window.location.href = "/2.EmployeeList.aspx";*/
                            setTimeout(function () { window.location.reload(); }, 1000)
                        },
                        error: function () {
                            swal('失敗', '資料未刪除', 'error')
                        }
                    });

                }, function (dismiss) {
                    if (dismiss === 'cancel') {
                        swal('取消', '資料未刪除', 'error')
                    }
                }
                )
            })



            $("#btncheck").on('click', function () {
                var myData = {
                    emaill: $("#ContentPlaceHolder1_txtEditEmail").val()
                };
                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/CheckMail",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {

                        swal('檢查完成', result.d, 'info')
                    },
                    error: function () {
                        swal('檢查失敗!', '尚未檢查成功', 'error')
                    }
                });



            });


            $("#ContentPlaceHolder1_btnExcel").click(function () {
                swal({
                    title: '請確認是否要輸出Excel!',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnExcel");
                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '資料未輸出', 'error'); hid2
                        }
                    });

            });
            if ($("#ContentPlaceHolder1_hid2").val() == "ok") {
                swal('完成!', '資料已輸出', 'success');
                $("#ContentPlaceHolder1_hid2").val("");
            }


        };

        $(function () {
            $("#ContentPlaceHolder1_btnEdit").click(function () {
                swal({
                    title: '請確認是否要變更!',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnEdit");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '資料未變更', 'error');
                        }
                    });

            });

            if ($("#ContentPlaceHolder1_hid1").val() == "ok") {
                swal('完成!', '資料已變更', 'success');
                $("#ContentPlaceHolder1_hid1").val("");
                setTimeout(function () {
                    window.location.href =
                    "/2.EmployeeList.aspx"
                }, 1000)
            }
        });


        //$(function () {
        //    $("#ContentPlaceHolder1_btnDelete").click(function () {
        //        swal({
        //            title: '請確認是否要刪除!',
        //            text: "",
        //            type: 'warning',
        //            showCancelButton: true,
        //            confirmButtonColor: '#3085d6',
        //            cancelButtonColor: '#EA0000',
        //        }).then(
        //            function () {


        //                $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnDelete");

        //                $("#form").submit();

        //            },
        //            function (dismiss) {
        //                if (dismiss === 'cancel') {
        //                    swal('取消', '資料未刪除', 'error');
        //                }
        //            });

        //    });

        //    if ($("#ContentPlaceHolder1_hid1").val() == "ok") {
        //        swal('完成!', '資料已刪除', 'success');
        //        $("#ContentPlaceHolder1_hid1").val("");
        //    }
        //});
    </script>
</asp:Content>

