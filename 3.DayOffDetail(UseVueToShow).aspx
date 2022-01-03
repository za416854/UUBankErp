<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.DayOffDetail(UseVueToShow).aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="vendors/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link href="Scripts/kris/sweetalert2.min.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <style>
        .nav-link.active {
            background-color: deepskyblue !important;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" id="profile">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class=" text-center pb-4">
                                    <%--class="rounded-circle mb-4" 照片變圓形--%>
                                    <br />
                                    <img id="myImage" :src="'kris/Images/'+ ep.EvidencePic" alt="profile" class="" height="600" width="400"/>
                                    <br />
                                    <br />
                                    <div class="mb-3">
                                        <h1 id="name" style="font-weight: bold; color: brown">{{ep.Name}}</h1>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <br />
                                        <h3 id="myId">假單流水號: {{ep.DayOffId}}</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-10 mx-auto">
                                                <ul class="nav nav-pills nav-pills-custom" id="pills-tab-custom" role="tablist">
                                                    <%-- <li class="nav-item">
                                                        <a class="nav-link active" id="pills-home-tab-custom" data-bs-toggle="pill" href="#pills-health" role="tab" aria-controls="pills-home" aria-selected="true"><i class="fa fa-user-circle"></i>基本資料</a>
                                                    </li>--%>
                                                    <li class="nav-item">
                                                        <%--<a class="nav-link" id="pills-contact-tab-custom" data-bs--toggle="pill" href="#pills-music" role="tab" aria-controls="pills-contact" aria-selected="false"><i class="fa fa-keyboard-o"></i>申請刪除假單(這個可以用ajax做)</a>--%>
                                                        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                                                        <asp:Button ID="ButtonDelete" OnClick="ButtonDelete_Click" OnClientClick="return false;" CssClass="btn btn-danger btn-rounded btn-fw" runat="server" Text="申請刪除請假" />
                                                    </li>
                                                </ul>
                                                <div class="tab-content tab-content-custom-pill" id="pills-tabContent-custom">
                                                    <div class="tab-pane fade show active" id="pills-health" role="tabpanel" aria-labelledby="pills-home-tab-custom">
                                                        <h3>假別: {{ep.Type}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>請假起始日期: {{ep.StartDate}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>請假起始時間: {{ep.StartTime}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>請假結束日期: {{ep.EndDate}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>請假結束時間: {{ep.EndTime}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>請假時數: {{ep.DayOffTime}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>請假原因: {{ep.Reason}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>核准: {{ep.Approval}}<br />
                                                            <br />
                                                        </h3>
                                                        <h3>拒絕准假原因: {{ep.RejectionReason}}</h3>
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-music" role="tabpanel" aria-labelledby="pills-contact-tab-custom">
                                                        <div class="media">
                                                            <img class="me-3 w-25 rounded" src="https://via.placeholder.com/300x300" alt="sample image">
                                                            <div class="media-body">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">

    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="Scripts/kris/sweetalert2.min.js"></script>
    <script src="vendors/fullcalendar/fullcalendar.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="js/calendar.js"></script>
    <!-- End custom js for this page-->
    <script src="https://vuejs.org/js/vue.js"></script>
    <script>
        //Vue.js來呈現請假資訊
        var app = new Vue(
            {
                //這邊再改id
                el: '#profile',
                data: {
                    ep: [],
                },
                created: function () {
                    var urlParams = new URLSearchParams(window.location.search)
                    var myData = {
                        id: urlParams.get('id')
                    };
                    var self = this;
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetDayOffHumanById",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        data: JSON.stringify(myData),
                        success: function (result) {
                            self.ep = result.d;
                        },
                    })
                },
            })
        //用sweetAlert去呈現但沒辦法postback到btn的事件執行程式碼
        $(function () {
            $("#ContentPlaceHolder1_ButtonDelete").click(function () {
                swal({
                    title: '確認?',
                    text: "即將送出申請Email!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {

                        //4.指定name屬性值Button1為postback按鈕
                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$ButtonDelete");

                        //2.手動postback
                        $("#form").submit();
                        swal({
                            title: '已送出刪除申請!',
                            text: '',
                            type: 'success',
                            showCancelButton: false,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#EA0000',
                        });
                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '申請未送出', 'error')
                        }
                    });

            });

        });
    </script>
</asp:Content>
