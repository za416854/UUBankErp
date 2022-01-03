<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.AuthoritySearch.aspx.cs" Inherits="_2_AuthoritySearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%-- <link href="2.custom/bootstrap4-toggle-master/css/bootstrap4-toggle.css" rel="stylesheet" />--%>
    <style>
        .ll {
            font-size: 40em;
            color: #0094ff;
        }

        .bb {
            color: #CC6600;
        }

        .cc {
            color: #357EC7;
        }
    </style>

    <link href="2.custom/tonyCss/sweetalert2.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/dataTables.bootstrap4.css" rel="stylesheet" />
    <script src="2.custom/tonyJS/vue.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
        <div class="row ">
            <div class=" col-2">
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-info btn-rounded" NavigateUrl="~/2.EditSlefPerson-Hight.aspx">返回人事首頁</asp:HyperLink>
            </div>
            <div class="col-2">
                 <button type="button" class="btn btn-github btn-rounded" data-bs-toggle="modal" data-bs-target="#exampleModal">
                員工權限修改
            </button>
            <div class="modal fade" data-bs-backdrop="static" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog .modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">員工權限修改</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="background-color:#EDEDED" >

                            <h3 style="color:#fb851e" >請輸入員工編號及姓名:</h3>
                            <div class="pt-3">
                                <div class="form-group">
                                    <label class="mdi mdi-account-key ll" for="txtNumber" ">
                                        員工編號:
                                
                                    </label>
                                     <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control "></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入員工編號!" ControlToValidate="txtNumber" CssClass="badge badge-outline-danger"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label class="mdi mdi-account ll" for="txtName">
                                        姓名:
                                    </label>                           
                                    
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control "></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請輸入員工姓名!" ControlToValidate="txtName" CssClass="badge badge-outline-danger"></asp:RequiredFieldValidator>
                                </div>
                                <div class="mt-3 row" >
                                    
                                    
                                    <asp:HiddenField ID="hid1" runat="server" />
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="modal-footer">
                             <input type="button" class="btn btn-info btn-rounded btn-fw " id="btnDemo"  value="我是DEMO" />
                                    |
                        <asp:Button ID="btnSearch" runat="server" Text="搜尋" CssClass="btn btn-info btn-rounded btn-fw" OnClick="btn1_Click" OnClientClick="return false;" />    
                        <button type="button" class="btn btn-secondary btn-rounded btn-fw" data-bs-dismiss="modal">取消</button>
                            <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>
                    </div>
                </div>
            </div>
            </div>
           <div class="col-2">
                <asp:Button ID="btnExcel" runat="server" Text="匯出Excel" CssClass=" btn btn-success btn-rounded" OnClick="btnExcel_Click" OnClientClick="return false;"  Font-Size="Large" />
              <asp:HiddenField ID="hid2" runat="server" />
           </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">員工權限資料表</h4>
                <br />
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table id="order-listing" class="table">
                                <thead>
                                    <tr>
                                        <th>員工編號</th>
                                        <th>姓名</th>
                                        <th>登入權限</th>
                                        <th>員工資料查詢權限</th>
                                        <th>員工資料新增權限</th>
                                        <th>員工資料編輯及刪除權限</th>
                                        <th>員工權限修改權限</th>
                                        <th>打卡覆核權限 </th>
                                        <th>請假覆核權限</th>
                                        <th>團購審核權限</th>
                                        <th>社團管理權限</th>
                                        <th>會議室管理</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="s in myList">
                                        <td >{{s.Id}}</td>
                                        <td>{{s.Name}}</td>
                                        <td class="a2">{{s.Login}}</td>
                                        <td class="b2" >{{s.Search}}</td>
                                        <td class="c2"> {{s.AddEM}}</td>
                                        <td class="d2">
                                           {{s.EditDelete}}  
                                        </td>
                                        <td class="e2">{{s.EditAU}}</td>
                                        <td class="f2">{{s.AskForLeave}}</td>
                                        <td class="g2">{{s.Clock}}</td>
                                        <td class="h2">{{s.ShopManager}}</td>
                                        <td class="i2">{{s.ClubManager}}</td>
                                        <td class="j2">{{s.MeetingRoom}}</td>
                                       
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" Runat="Server">
    <script src="2.custom/tonyJS/sweetalert2.js"></script>
    <script src="2.custom/tonyJS/jquery.dataTables.js"></script>
    <script src="2.custom/tonyJS/dataTables.bootstrap4.js"></script>
    <script src="2.custom/tonyJS/data-table.js"></script>
    <script>

        $(function () {

            $("#btnDemo").click(function () {
                $("#ContentPlaceHolder1_txtNumber").val("2")
                $("#ContentPlaceHolder1_txtName").val("李路亞")

            })


            $("#ContentPlaceHolder1_btnSearch").click(function () {
                swal({
                    title: '請確認!',
                    text: "請再次確認員工編號及姓名是否正確!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnSearch");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '取消搜尋', 'error')
                        }
                    });

            });

            if ($("#ContentPlaceHolder1_hid1").val() == "ok") {
                swal('OK!', '即將導向編輯頁', 'success')
                $("#ContentPlaceHolder1_hid1").val("")
            }
            else if ($("#ContentPlaceHolder1_hid1").val() == "false") {
                swal('員工編號或姓名錯誤!', '請再次確認!', 'error')
                $("#ContentPlaceHolder1_hid1").val("")
            }




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
        });

        var app = new Vue({
            el: '#order-listing',
            data: {
                myList: []
            },
            created: function () {
                var self = this;

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/GetHumanAuthorityList",
                    contentType: "application/json;utf-8",
                    async: false,
                    dataType: "json",
                    success: function (result) {
                        self.myList = result.d;
                    }
                });
            }

        });

        $(".a2").each(function () {


            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }

        });


        $(".b2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });

        $(".c2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });

        $(".d2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });

        $(".e2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });

        $(".f2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });


        $(".g2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });

        $(".h2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });

        $(".i2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });


        $(".j2").each(function () {
            if ($(this).text().trim() === "true") {
                $(this).addClass("bb");
                $(this).text("賦予");
            } else {
                $(this).addClass("cc");
                $(this).text("卸除");
            }
        });
    </script>
</asp:Content>

