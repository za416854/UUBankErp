<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.DayOffEdit.aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link href="Scripts/kris/sweetalert2.min.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <style>
        .nav-link.active {
            background-color: deepskyblue !important;
        }

        .card-body {
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" id="profile">
        <div class="row grid-margin">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="badge badge-outline-primary" style="font-size: xx-large">請假詳情/Leave Details</h4>
                        <br />
                        <br />
                        <hr />
                        <div class="form-group row">
                            <%--&nbsp&nbsp&nbsp&nbsp--%>
                            <%--&emsp;&emsp;&emsp;&emsp;--%>
                            <p class="card-description" style="font-size: x-large">
                                請輸入請假資訊
                            </p>
                            <br />
                            <br />
                            <br />
                            <br />
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;假單流水號</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxDayOffId" disabled="disabled" runat="server"></asp:TextBox>
                                <%--<input class="form-control" maxlength="10" name="defaultconfig-3" id="defaultconfig-3" type="text" placeholder="Type Something..">--%>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;員工姓名</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxName" disabled="disabled" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;請假類別</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxType" disabled="disabled" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;起始日期</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxStartDate" disabled="disabled" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;起始時間</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxStartTime" disabled="disabled" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;結束日期</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxEndDate" disabled="disabled" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;結束時間</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxEndTime" disabled="disabled" runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;請假事由</label>
                            </div>
                            <div class="col-lg-5">
                                <%--<textarea id="maxlength-textarea" class="form-control" maxlength="100" rows="2" placeholder="This textarea has a limit of 100 chars."></textarea>--%>
                                <asp:TextBox TextMode="MultiLine" MaxLength="100" class="form-control" disabled="disabled" ID="TextBoxReason" Rows="4" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;請假證明</label>
                            </div>
                            <div class="col-lg-5">
                                <%--用隱藏欄位接圖片的檔案名稱，再去pageLoad讀取出來--%>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:Image ID="ImageEvidencePic" runat="server" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;審核狀態</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxApproval" disabled="disabled" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;退件註解</label>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox CssClass="form-control" name="defaultconfig-1" ID="TextBoxRejectionReason" placeholder="請填入拒絕准假原因" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <div class="col-sm-9">
                                        <%--&emsp;--%>
                                        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                                        <asp:Button ID="ButtonApproval" CssClass="btn btn-success btn-rounded btn-fw" OnClientClick="return false" OnClick="ButtonApproval_Click" runat="server" Text="審核通過" />
                                        <%--<input type="button" id="ButtonApproval" class="btn btn-success btn-rounded btn-fw" value="審核通過" />--%>
                                        <asp:Button ID="ButtonRejection" OnClientClick="return false" OnClick="ButtonRejection_Click" CssClass="btn btn-warning btn-rounded btn-fw" runat="server" Text="假單退件" />
                                        <asp:Button ID="ButtonDelete" OnClick="ButtonDelete_Click" OnClientClick="return false" CssClass="btn btn-danger btn-rounded btn-fw" runat="server" Text="假單刪除" />
                                        <input type="button" value="Demo" id="reasonBtn" Class="btn btn-facebook btn-rounded btn-fw" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">

    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="vendors/moment/moment.min.js"></script>
    <script src="vendors/fullcalendar/fullcalendar.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="Scripts/kris/sweetalert2.min.js"></script>
    <script src="js/calendar.js"></script>
    <!-- End custom js for this page-->
    <script src="https://vuejs.org/js/vue.js"></script>
    <script>
        //假單審核通過的按鈕
        $(function () {
            $("#ContentPlaceHolder1_ButtonApproval").click(function () {
                if ($("#ContentPlaceHolder1_TextBoxRejectionReason").val() == "") {
                    swal({
                        title: '錯誤',
                        text: "請輸入拒絕原因，無的話寫無!",
                        type: 'error',
                        showCancelButton: false,
                    })
                } else {
                    swal({
                        title: '確認?',
                        text: "即將審核通過!",
                        type: 'warning',
                        showCancelButton: true,
                    }).then(
                        function () {
                            //4.指定name屬性值Button1為postback按鈕
                            $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$ButtonApproval");
                            //2.手動postback
                            $("#form").submit();
                            //alert("刪除申請已提交");
                            //swal('完成!', '檔案已經刪除', 'success')
                        },
                        function (dismiss) {
                            if (dismiss === 'cancel') {
                                swal('取消', '申請未送出', 'error')
                            }
                        });
                }
            });
        });
        //假單退件的按鈕
        $(function () {
            $("#ContentPlaceHolder1_ButtonRejection").click(function () {
                if ($("#ContentPlaceHolder1_TextBoxRejectionReason").val() == "") {
                    swal({
                        title: '錯誤',
                        text: "請輸入拒絕原因，無的話寫無!",
                        type: 'error',
                        showCancelButton: false,
                    })
                } else {
                    swal({
                        title: '確認?',
                        text: "即將退件!",
                        type: 'warning',
                        showCancelButton: true,
                    }).then(
                        function () {
                            //4.指定name屬性值Button1為postback按鈕
                            $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$ButtonRejection");
                            //2.手動postback
                            $("#form").submit();
                            //alert("刪除申請已提交");
                            //swal('完成!', '檔案已經刪除', 'success')
                        },
                        function (dismiss) {
                            if (dismiss === 'cancel') {
                                swal('取消', '申請未送出', 'error')
                            }
                        });
                }
            });
        });
        //假單刪除
        $(function () {
            $("#ContentPlaceHolder1_ButtonDelete").click(function () {
                swal({
                    title: '確認?',
                    text: "即將刪除此假單!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {
                        //4.指定name屬性值Button1為postback按鈕
                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$ButtonDelete");
                        //2.手動postback
                        $("#form").submit();
                        //alert("刪除申請已提交");
                        //swal('完成!', '檔案已經刪除', 'success')
                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '申請未送出', 'error')
                        }
                    });

            });
        });
        $("#reasonBtn").click(function () {
            $("#ContentPlaceHolder1_TextBoxRejectionReason").val("請假日期填錯");
        });
    </script>
</asp:Content>
