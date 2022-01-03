<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="1.profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://vuejs.org/js/vue.js"></script>
    <style>
        .nav-link.active {
            background-color: dimgray !important;
        }

        .loader-container {
            background: #fff;
            bottom: 0;
            left: 0;
            position: fixed;
            right: 0;
            top: 0;
            z-index: 9999;
        }

        .loader {
            display: block;
            position: absolute;
            font-size: 0;
            color: #f36b21;
            left: 50%;
            top: 50%;
            width: 100px;
            height: 100px;
            -webkit-transform: translateY(-50%) translateX(-50%);
            -ms-transform: translateY(-50%) translateX(-50%);
            transform: translateY(-50%) translateX(-50%);
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="content-wrapper" id="profile">
        <%--<div id="pre-loader" class="loader-container" >
            <div class="loader">
            <img src="images/louis/rings.svg" alt="loader">
            </div>
        </div>--%>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class=" text-center pb-4">
                                    <img id="myImage" :src="'EmployeesImage/'+ ep.ImageName + '.jpg'" alt="profile" class=" rounded-3 mb-4" width="300"/>
                                    <div class="mb-3">
                                        <h1 id="name" style="font-weight:bold;color:mediumturquoise">{{ep.Name}}</h1>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:HiddenField ID="HiddenField2" runat="server" />
                                        <asp:HiddenField ID="HiddenField3" runat="server" />
                                        <asp:HiddenField ID="HiddenField4" runat="server" />
                                        <h3 id="myId">員工編號: {{ep.ID}}</h3><hr />
                                        <h4>
                                            性別: {{ep.Gender}}<br /><br />
                                            生日: {{ep.Birthday}}<br /><br />
                                            Email: {{ep.Email}}<br /><br />
                                            隸屬部門: {{ep.Department}}<br /><br />
                                            職稱: {{ep.Position}}<br /><br />
                                            分機: {{ep.Extension}}<br /><br />
                                            到職日: {{ep.HireDay}}<br />

                                        </h4>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-10 mx-auto">
                                                <ul class="nav nav-pills nav-pills-custom" id="pills-tab-custom" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="pills-club-tab-custom" data-bs-toggle="pill" href="#pills-club" role="tab" aria-controls="pills-contact" aria-selected="false"><i class="fa fa-keyboard-o"></i> 我的社團</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="pills-time-tab-custom" data-bs-toggle="pill" href="#pills-time" role="tab" aria-controls="pills-contact" aria-selected="false"><i class="fa fa-keyboard-o"></i> 今日打卡時間</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="pills-buy-tab-custom" data-bs-toggle="pill" href="#pills-buy" role="tab" aria-controls="pills-contact" aria-selected="false"><i class="fa fa-keyboard-o"></i> 我團購的商品</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="pills-meeting-tab-custom" data-bs-toggle="pill" href="#pills-meeting" role="tab" aria-controls="pills-contact" aria-selected="false"><i class="fa fa-users"></i> 我預約的會議室</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content tab-content-custom-pill" id="pills-tabContent-custom">
                                                    <div class="tab-pane fade active show" id="pills-club" role="tabpanel" aria-labelledby="pills-contact-tab-custom">
                                                        <div class="media">
                                                            <img id="clubImg" class="me-3 w-50" :src="'UUUBankClubImage/'+ club.ClubImage + '.jpg'" alt="sample image" onerror="imageError()" >
                                                            <div class="media-body">
                                                                <h3>社團名稱：{{club.ClubName}}<br /><br /></h3>
                                                                社團描述：{{club.DetailClubScript}}<br /><br />
                                                                成員人數：{{club.PeopleCount}} 人<br /><br />
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-time" role="tabpanel" aria-labelledby="pills-contact-tab-custom">
                                                        <div class="media">
                                                            <div class="media-body">
                                                                <table class="table table-light table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                          <th scope="col">今日日期</th>
                                                                          <th scope="col">上班打卡時間</th>
                                                                          <th scope="col">下班打卡時間</th>
                                                                        </tr>
                                                                      </thead>
                                                                      <tbody >
                                                                        <tr>
                                                                          <td>{{ClockIn.Date}}</td>
                                                                          <td>{{ClockIn.ClockInTime}}</td>
                                                                          <td>{{ClockIn.ClockOutTime}}</td>                                                                          
                                                                        </tr>
                                                                      </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-buy" role="tabpanel" aria-labelledby="pills-contact-tab-custom">
                                                        <div class="media">
                                                            <img id="cartImg" :src="'Sponsors/'+ MyCart.ImgFileName1" alt="profile" class="me-3 w-50" onerror="imageError()"/>
                                                            <div class="media-body">
                                                                <div class="media-body">
                                                                <h3>產品名稱：{{MyCart.ProductName}}<br /><br /></h3>
                                                                產品描述：{{MyCart.ProductInFo}}<br /><br />
                                                                產品價格：$ {{MyCart.Price}} <br /><br />
                                                                目前團購數量：{{MyCart.PDCountNow}} <br /><br />
                                                            </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-meeting" role="tabpanel" aria-labelledby="pills-contact-tab-custom">
                                                        <div class="media">
                                                            <div class="media-body">
                                                                <table class="table table-light table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                          <th scope="col">會議日期</th>
                                                                          <th scope="col">會議時間</th>
                                                                          <th scope="col">會議室</th>
                                                                          <th scope="col">會議目的</th>
                                                                          <th scope="col">是否審核通過</th>
                                                                          <th scope="col">取消會議</th>
                                                                        </tr>
                                                                      </thead>
                                                                      <tbody >
                                                                        <tr>
                                                                          <td>{{meeting.Date}}</td>
                                                                          <td>{{meeting.Time}}</td>
                                                                          <td>{{meeting.Room}}</td>
                                                                          <td>{{meeting.Reason}}</td>
                                                                          <td>{{meeting.Approval}}</td>
                                                                          <th scope="row"><%--<i class="fa fa-trash-o"></i>--%>
                                                                              <asp:Button ID="Button1" runat="server" Text="取消" BorderStyle="None" OnClick="Button1_Click" OnClientClick="return false" />
                                                                              <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                                                                          </th>
                                                                        </tr>
                                                                      </tbody>
                                                                </table>
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
    <script src="1.louis/forProfile/plugins.js"></script>
    <script src="1.louis/forProfile/jquery.main.js"></script>
    
    <script>
        function imageError() {
            var board = document.getElementById("clubImg");
            var board2 = document.getElementById("cartImg");
            board.style.display = 'none';
            board2.style.display = 'none';
        }
        var app = new Vue(
            {
                el: '#profile',
                data: {
                    ep: [],
                    meeting: [],
                    club: [],
                    ClockIn: [],
                    MyCart: [],
                },
                created: function () {

                    var urlParams = new URLSearchParams(window.location.search)
                    var epData = {
                        id: urlParams.get('id'),
                    };
                    var meetingData = {
                        name: $("#ContentPlaceHolder1_HiddenField1").val(),
                    };
                    var clubData = {
                        userName: $("#ContentPlaceHolder1_HiddenField2").val(),
                    };
                    var clockData = {
                        userName: $("#ContentPlaceHolder1_HiddenField3").val(),
                    };
                    var cartData = {
                        id: $("#ContentPlaceHolder1_HiddenField4").val(),
                    };
                    var self = this;
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetEmployeeByID",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        data: JSON.stringify(epData),
                        success: function (result) {
                            self.ep = result.d;
                        },
                    })
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetMyMeeting",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        data: JSON.stringify(meetingData),
                        success: function (result) {
                            self.meeting = result.d;
                        },
                    })
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetMyClub",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        async: false,
                        data: JSON.stringify(clubData),
                        success: function (result) {
                            self.club = result.d;
                        },
                    }),
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetMyClock",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        async: false,
                        data: JSON.stringify(clockData),
                        success: function (result) {
                            self.ClockIn = result.d;
                        },
                    })
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetMyCart",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        async: false,
                        data: JSON.stringify(cartData),
                        success: function (result) {
                            self.MyCart = result.d;
                        },
                    })
                },
            })

        $(function () {
            $("#ContentPlaceHolder1_Button1").click(function () {
                swal({
                    title: '確定要取消會議?',
                    type: 'question',
                    showCancelButton: true,
                    cancelButtonText: '否',
                    confirmButtonText: '是',
                }).then(function () {
                    $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$Button1");
                    $("#form").submit();
                });
            });

            
        });



    </script>
</asp:Content>
