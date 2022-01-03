<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="1.meetingRoom.aspx.cs" Inherits="_1_meetingRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .meetingImg {
            border-radius: 10px;
        }

        #redText {
            color: orangered;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container text-center pt-2">
                            <h2 class="mb-3 mt-5">UUU Bank 會議室預約系統</h2>
                            <p class="w-75 mx-auto mb-5">請先選擇您想租借的會議室</p>
                            <div class="row pricing-table">
                                <div class=" col-xl-4 grid-margin stretch-card pricing-card">
                                    <div class="card border-primary border pricing-card-body">
                                        <div class="text-center pricing-card-head">
                                            <h1 class="font-weight-normal mb-4">小會議室</h1>
                                        </div>
                                        <img class="meetingImg" src="images/louis/smallmeeting.jpg" /><br />
                                        <ul class="list-unstyled plan-features">
                                            <li>．適合10人以下使用</li>
                                            <li>．租借時間以半天為單位</li>
                                            <li>
                                                <br />
                                            </li>
                                        </ul>
                                        <div class="wrapper">
                                            <asp:Button CssClass="btn btn-outline-primary btn-block btn-lg" ID="Button1" runat="server" Text="點我租借" Font-Size="Larger" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class=" col-xl-4 grid-margin stretch-card pricing-card">
                                    <div class="card border border-success pricing-card-body">
                                        <div class="text-center pricing-card-head">
                                            <h1 class="font-weight-normal mb-4">國際會議室</h1>
                                        </div>
                                        <img class="meetingImg" src="images/louis/bigmeeting.jpg" /><br />
                                        <ul class="list-unstyled plan-features">
                                            <li>．適合10~20人使用</li>
                                            <li>．租借時間以半天為單位</li>
                                            <li id="redText">．此會議室需經管理部簽核過後方可使用</li>
                                        </ul>
                                        <div class="wrapper">
                                            <asp:Button CssClass="btn btn-outline-success btn-block btn-lg" ID="Button2" runat="server" Text="點我租借" Font-Size="Larger" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class=" col-xl-4 grid-margin stretch-card pricing-card">
                                    <div class="card border border-warning pricing-card-body">
                                        <div class="text-center pricing-card-head">
                                            <h1 class="font-weight-normal mb-4">管理簽核處</h1>
                                        </div>
                                        <img class="meetingImg" src="images/louis/approve.jpg" /><br />
                                        <ul class="list-unstyled plan-features">
                                            <li>
                                                <br />
                                            </li>
                                            <li>
                                                <br />
                                            </li>
                                            <li>
                                                <br />
                                            </li>
                                        </ul>
                                        <div class="wrapper">
                                            <asp:Button CssClass="btn btn-outline-warning btn-block btn-lg" ID="Button3" runat="server" Text="進入簽核" Font-Size="Larger" OnClick="Button3_Click" OnClientClick="return false" />
                                            <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                        </div>
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

    <script>
        $(function () {
            if ($("#ContentPlaceHolder1_HiddenField1").val() == 'noUser') {
                swal({
                    title: '您沒有權限進入該頁面!!',
                    type: 'error',
                    showCancelButton: false,
                    confirmButtonText: '好的，我知道了',
                });
                $("#ContentPlaceHolder1_HiddenField1").val("");
            }
            $("#ContentPlaceHolder1_Button3").click(function () {
                $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$Button3");
                $("#form").submit();
            });
        });
    </script>
</asp:Content>

