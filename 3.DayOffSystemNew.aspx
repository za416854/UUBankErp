<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.DayOffSystemNew.aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/blitzer/jquery-ui.css" />
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link href="Scripts/kris/sweetalert2.min.css" rel="stylesheet" />
      <link href="vendors/jquery-toast-plugin/jquery.toast.min.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- partial -->
    <div class="content-wrapper">
        <div class="row">
            <div class="col-12 ">
                <div class="card">
                    <div class="card-body">
                        <h4 class="badge badge-outline-primary" style="font-size: xx-large">請假系統/Leave System</h4>
                        <br />
                        <br />
                        <hr />
                        <div class="form-sample">
                            <p class="card-description" style="font-size: x-large">
                                請輸入請假資訊
                            </p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">姓名/Name</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxName" placeholder="請輸入姓名" disabled="disable" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">請假類別</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList1" CssClass="btn btn-light dropdown-toggle" runat="server" ForeColor="Black">
                                                <asp:ListItem Selected="True">請選擇</asp:ListItem>
                                                <asp:ListItem>特休假</asp:ListItem>
                                                <asp:ListItem>病假</asp:ListItem>
                                                <asp:ListItem>事假</asp:ListItem>
                                                <asp:ListItem>公假</asp:ListItem>
                                                <asp:ListItem>生理假</asp:ListItem>
                                                <asp:ListItem>婚產假</asp:ListItem>
                                                <asp:ListItem>喪假</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">起始日期</label>
                                        <div class="col-sm-9">
                                            <%--<asp:TextBox ID="TextBoxStartDate" placeholder="yyyy/mm/dd" CssClass="form-control" runat="server"></asp:TextBox>--%>
                                            <input type="text" id="TextBoxStartDate" class="form-control" onchange="" placeholder="yyyy/mm/dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">起始時間</label>
                                        <div class="col-sm-9">
                                            <select id="DropDownList2" class="btn btn-light dropdown-toggle" onchange = "getDiffByDay(dateStart, dateEnd)" runat="server" style="color: #000000">
                                                <option>請選擇</option>
                                                <option>08:30</option>
                                                <option>09:30</option>
                                                <option>10:30</option>
                                                <option>11:30</option>
                                                <option>13:30</option>
                                                <option>14:30</option>
                                                <option>15:30</option>
                                                <option>16:30</option>
                                                <option>17:30</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">結束日期</label>
                                        <div class="col-sm-9">
                                            <%--<asp:TextBox ID="TextBoxEndDate"   placeholder="yyyy/mm/dd" CssClass="form-control" runat="server"></asp:TextBox>--%>
                                            <input type="text" id="TextBoxEndDate" onchange = "getDiffByDay(dateStart, dateEnd)" class="form-control" placeholder="yyyy/mm/dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">結束時間</label>
                                        <div class="col-sm-4">
                                            <div class="form-check">
                                                <select id="DropDownList3" onchange = "getDiffByDay(dateStart, dateEnd)"  class="btn btn-light dropdown-toggle" runat="server" style="color: #000000">
                                                    <option>請選擇</option>
                                                    <option>08:30</option>
                                                    <option>09:30</option>
                                                    <option>10:30</option>
                                                    <option>11:30</option>
                                                    <option>13:30</option>
                                                    <option>14:30</option>
                                                    <option>15:30</option>
                                                    <option>16:30</option>
                                                    <option>17:30</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p class="card-description"></p>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">上傳請假證明</label>
                                        <div class="col-sm-9">
                                            <asp:FileUpload ID="FileUpload1" CssClass="form-control file-upload-info btn-rounded btn-fw" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">請假原因</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBoxReason" placeholder="限50字" TextMode="MultiLine" CssClass="form-control" Rows="4" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <div class="col-sm-9">
                                            <%--<asp:Button ID="Button1" CssClass="btn btn-primary" OnClick="Button1_Click" runat="server" Text="提交" />--%>
                                            <input type="button" id="Button1" class="btn btn-primary" value="提交" />
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                             <input type="button" id="Button2" class="btn btn-danger" value="首頁" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                             <input type="button" id="reasonBtn" class="btn btn-facebook" value="Demo" />
                                            <%--<asp:Button ID="Button2" OnClientClick="return confirm('確認回Default?');" CssClass="btn btn-danger" OnClick="Button2_Click" runat="server" Text="回Default頁面"  />--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    <!-- main-panel ends -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <!-- Plugin js for this page-->
    <script src="/vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <script src="vendors/select2/select2.min.js"></script>
    <!-- End plugin js for this page-->

    <!-- Custom js for this page-->
    <script src="/js/data-table.js"></script>
    <script src="Scripts/kris/sweetalert2.min.js"></script>
    <script src="js/file-upload.js"></script>
    <script src="js/typeahead.js"></script>
    <script src="js/select2.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     <script src="vendors/jquery-toast-plugin/jquery.toast.min.js"></script>
    <script src="kris/js/toastDemoKris.js"></script>
    <!-- End custom js for this page-->
    <script>
        $(function () {
            $("#TextBoxStartDate").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,//日到一由左至右呈現
                constrainInput: true//只能打數字或是斜線
            });
            $("#TextBoxEndDate").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,//日到一由左至右呈現
                constrainInput: true//只能打數字或是斜線
            });
        });
        $(function () {
            $("#Button1").click(function () {
                if ($("#ContentPlaceHolder1_DropDownList1").val() == "請選擇") {
                    swal({
                        title: '錯誤',
                        text: "請輸入假別!",
                        type: 'error',
                        showCancelButton: false,
                    });
                    showWarningToast();
                } else if ($("#TextBoxStartDate").val() == "" || $("#TextBoxEndDate").val() == "") {
                    swal({
                        title: '錯誤',
                        text: "請輸入開始或結束日期!",
                        type: 'error',
                        showCancelButton: false,
                    });
                    showWarningToast();
                } else if ($("#ContentPlaceHolder1_DropDownList2").val() == "請選擇" || $("#ContentPlaceHolder1_DropDownList3").val() == "請選擇") {
                    swal({
                        title: '錯誤',
                        text: "請輸入開始或結束時間!",
                        type: 'error',
                        showCancelButton: false,
                    });showWarningToast();
                } else if ($("#ContentPlaceHolder1_FileUpload1").val() == "") {
                    swal({
                        title: '錯誤',
                        text: "請上傳檔案!",
                        type: 'error',
                        showCancelButton: false,
                    }); showWarningToast();
                } else if ($("#ContentPlaceHolder1_TextBoxReason").val() == "") {
                    swal({
                        title: '錯誤',
                        text: "請輸入請假原因，無的話寫無",
                        type: 'error',
                        showCancelButton: false,
                    }); showWarningToast();
                }
                else {
                    swal({
                        title: '確認?',
                        text: "檔案即將上傳!",
                        type: 'warning',
                        showCancelButton: true,
                    }).then(
                        function () {
                            var myData = {
                                name: $("#ContentPlaceHolder1_TextBoxName").val(),
                                dropDownList1: $("#ContentPlaceHolder1_DropDownList1").val(),
                                startDate: $("#TextBoxStartDate").val(),
                                dropDownList2: $("#ContentPlaceHolder1_DropDownList2").val(),
                                endDate: $("#TextBoxEndDate").val(),
                                dropDownList3: $("#ContentPlaceHolder1_DropDownList3").val(),
                                fileUpload1: $("#ContentPlaceHolder1_FileUpload1").val(),
                                textBoxReason: $("#ContentPlaceHolder1_TextBoxReason").val(),
                            }

                            $.ajax({
                                type: 'POST',
                                url: "WebService.asmx/GetDayOff",
                                contentType: "application/json;utf-8",
                                dataType: "json",
                                data: JSON.stringify(myData),
                                async: false,
                                success: function (result) {
                                    swal({
                                        title: '已送出覆核!',
                                        text: '',
                                        type: 'success',
                                        showCancelButton: false,
                                        confirmButtonColor: '#3085d6',
                                        cancelButtonColor: '#EA0000',
                                    });
                                    showSuccessToast();
                                    setTimeout(function myfunction() {
                                        window.location.href = "/Default.aspx";
                                    }, 2000)
                                    
                                    //window.location.href = "/3.DayOffList.aspx";
                                    //之後再打開
                                }
                            });
                        },
                        function (dismiss) {
                            if (dismiss === 'cancel') {
                                swal({
                                    title: '檔案未上傳',
                                    text: '',
                                    type: 'warning',
                                    showCancelButton: false,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#EA0000',
                                })
                            }
                        });
                }
            });
        });
        $(function () {
            $("#Button2").click(function () {
                swal({
                    title: '確認取消請假?',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {
                        window.location.href = "/3.DayOffList.aspx";
                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                        }
                    });
            });
        })
        $("#reasonBtn").click(function () {
            $("#ContentPlaceHolder1_TextBoxReason").val("生理期");
            $("#TextBoxStartDate").val("2021/12/24");
            $("#TextBoxEndDate").val("2021/12/24");
        });
    </script>
    
    
    <%--<script>
        var ssdate = "2018-11-12";
        var eedate = "2018-11-14";
        console.log("從" + ssdate + "到" + eedate + "請假天數為" + getHoliday(ssdate, eedate)+ "天");

        function getHoliday(sdate, edate) {
            var num = datedifference(sdate, edate);
            var lastday = num % 7;
            var weeknum = 0;
            if (num >= 7) {
                weeknum = parseInt(num / 7);
            }

            var weekday = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            var result = 0;
            for (var i = 0; i < lastday; i++) {
                var dd = new Date(addDate(sdate, i)).getDay();
                if (weekday[dd] != "星期六" && weekday[dd] != "星期日") {
                    result++;
                }
            }
            return result + weeknum * 5;
        }

        //兩個時間相差天數 相容firefox chrome
        function datedifference(sDate1, sDate2) { //sDate1和sDate2是2006-12-18格式  
            var dateSpan, tempDate, iDays;
            sDate1 = Date.parse(sDate1);
            sDate2 = Date.parse(sDate2);
            dateSpan = sDate2 - sDate1;
            dateSpan = Math.abs(dateSpan);
            iDays = Math.floor(dateSpan / (24 * 3600 * 1000));
            return iDays
        };

        function addDate(date, days) {
            var d = new Date(date);
            d.setDate(d.getDate() + days);
            var m = d.getMonth() + 1;
            return d.getFullYear() + '-' + m + '-' + d.getDate();
        }
    </script>--%>
</asp:Content>

