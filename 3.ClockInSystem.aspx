<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="3.ClockInSystem.aspx.cs" Inherits="basic_elements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <!-- Plugin css for this page -->
    <%--時鐘CSS--%>
    <style type="text/css">
        h1 {
            font-size: 20px;
            margin-bottom: 3px;
        }

        h2 {
            margin-top: 40px;
            margin-bottom: 3px;
        }

        h3 {
            font-size: 13px;
            margin-top: 0px;
        }

        .main {
            text-align: center;
        }

        .example {
            margin-bottom: 25px;
        }

            .example table {
                width: 650px;
                margin: 0px auto;
            }

        @media (max-width: 650px) {
            .example table {
                width: 100%;
            }

            .example td {
                display: block;
                text-align: center;
            }
        }

        .time {
            display: inline-block;
            font-size: 26px;
            padding: 5px;
            text-align: center;
            width: 94px;
            margin-top: 5px;
        }

    </style>
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link href="Scripts/kris/sweetalert2.min.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div  class="content-wrapper" id="profile">
        <div class="row">
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="badge badge-outline-primary" style="font-size: xx-large">打卡系統/Clock In/Out System</h4>
                        <hr />
                        <p class="card-description" style="font-size: large">
                            打卡資訊/Clock In/Out Information
                        </p>
                        <div class="forms-sample">
                            <%--時鐘--%>
                            <div id="ClockInclock" class="main">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail3">日期</label>
                                <asp:TextBox ID="TextBoxDate" placeholder="這邊要在pageLoad寫程式放現在日期" disabled="" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group" >
                                <label for="exampleInputPassword4">現在時間</label>
                               <div id="showbox" class="form-control"></div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword5">員工編號</label>
                                <%--<input type="password" class="form-control" disabled="disabled" id="exampleInputPassword5" placeholder="QueryString拿ID">--%>
                                <asp:TextBox ID="TextBoxId" CssClass="form-control" disabled="disabled"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword6">員工姓名 </label>
                                <%--<input type="password" class="form-control" disabled="disabled" id="exampleInputPassword6" placeholder="拿ID後秀出姓名">--%>
                                <asp:TextBox ID="TextBoxName" CssClass="form-control" disabled="disabled" placeholder="拿ID後秀出姓名" runat="server"></asp:TextBox>
                            </div>
                            <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="btn btn-primary me-2" runat="server" Text="上班打卡" />
                            <%--<input type="button"  id="Button1" class="btn btn-primary me-2" value="上班打卡" />--%>
                            <%--<button class="btn btn-light">Cancel</button>--%>
                            <asp:Button ID="Button2" OnClick="Button2_Click" CssClass="btn btn-danger me-2" runat="server" Text="下班打卡" />
                            <br /><br /><br />
                            <asp:Label ID="Label1" runat="server" CssClass="badge badge-outline-primary badge-pill ti-comment" Text="&nbsp&nbsp上班打卡成功:打卡時間:{0}" Font-Size="Large"></asp:Label>
                            <asp:Label ID="Label2" runat="server" CssClass="badge badge-outline-danger badge-pill ti-comment" Text="&nbsp&nbsp下班打卡成功:打卡時間:{0}" Font-Size="Large"></asp:Label>
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
       
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <!-- plugins:js -->
    <script src="vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <script src="vendors/select2/select2.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->

    <!-- endinject -->
    <!-- Custom js for this page-->
     <script src="Scripts/kris/sweetalert2.min.js"></script>
    <script src="js/file-upload.js"></script>
    <script src="js/typeahead.js"></script>
    <script src="js/select2.js"></script>
    <script src="kris/js/jquery.thooClock.js"></script>
    <%--時鐘JS--%>
    <!-- End custom js for this page-->
    <script>
        //ShowTime的函式
        $('#ClockInclock').thooClock({
            size: 400,
            dialColor: '#000000',
            dialBackgroundColor: 'transparent',
            secondHandColor: '#F3A829',
            minuteHandColor: '#222222',
            hourHandColor: '#222222',
            alarmHandColor: '#FFFFFF',
            alarmHandTipColor: '#026729',
            timeCorrection: {
                operator: '+',
                hours: 0,
                minutes: 0
            },
            alarmCount: 1,
            showNumerals: true,
            numerals: [
                { 1: 1 },
                { 2: 2 },
                { 3: 3 },
                { 4: 4 },
                { 5: 5 },
                { 6: 6 },
                { 7: 7 },
                { 8: 8 },
                { 9: 9 },
                { 10: 10 },
                { 11: 11 },
                { 12: 12 }
            ],
            sweepingMinutes: true,
            sweepingSeconds: false,
            numeralFont: 'arial',
            brandFont: 'arial'
        });
        function ShowTime() {
            var NowDate = new Date();
            var h = NowDate.getHours();
            var m = NowDate.getMinutes();
            var s = NowDate.getSeconds();
            document.getElementById('showbox').innerHTML = h + '時' + m + '分' + s + '秒';
            setTimeout('ShowTime()', 1000);
        }
        //Ajax上班打卡
            </script>
    
    
    
    
</asp:Content>

