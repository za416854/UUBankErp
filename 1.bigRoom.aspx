<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="1.bigRoom.aspx.cs" Inherits="_1_meetingRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="1.louis/forMeetingRoom/mark-your-calendar.css" rel="stylesheet" />
    <style>
        .myc-available-time {
            background-color: lightseagreen !important;
        }

            .myc-available-time.selected, .myc-available-time:hover {
                background-color: turquoise !important;
                color: white;
            }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div id="picker"></div>
        <br />
        <hr />
        <br />
        <%--<p>Selected date: <span id="selected-date"></span></p>
            <p>Selected time: <span id="selected-time"></span></p>--%>
        <div>
            <div class="col-12 grid-margin" style="display: block" id="txtfield">
                <div class="card">
                    <div class="card-body">
                        <h3 class="">請填寫以下欄位</h3>
                        <div class="form-sample">
                            <p class="card-description"></p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">日期</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" disabled="disabled" id="date">
                                            <input id="Hidden2" type="hidden" runat="server" />
                                            <label id="dateValidate" style="color: red;" runat="server" visible="false">*日期為必填欄位!</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">時段</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" disabled="disabled" id="time">
                                            <input id="Hidden3" type="hidden" runat="server" />
                                            <label id="timeValidate" style="color: red;" runat="server" visible="false">*時段為必填欄位!</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">申請人</label>
                                        <div class="col-sm-9">
                                            <input id="Hidden1" type="hidden" runat="server" />
                                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">申請原因</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtReason" CssClass="form-control" runat="server">部門會議</asp:TextBox>
                                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*申請原因為必填欄位!" ControlToValidate="txtReason"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="" style="margin:auto;align-content:center">
                                <asp:Button ID="Button1" runat="server" Text="確認申請" CssClass="btn btn-warning btn-lg m-auto" OnClick="Button1_Click" />
                            </div>
                                <asp:Label Text="每位員工每次只能有一個待使用會議室!該使用日期過後才可再次申請。" ID="repeatAlert" Visible="false" runat="server" ForeColor="Red" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="1.louis/forMeetingRoom/mark-your-calendar.js"></script>
    <script type="text/javascript">


        (function ($) {
            $.ajax({
                type: 'POST',
                url: "WebService.asmx/GetAllbigMeeting",
                contentType: "application/json;utf-8",
                dataType: "json",
                success: function (result) {

                    for (var i = 0; i < result.d.length; i++) {
                        var date = result.d[i].substring(0, 10);
                        var time = result.d[i].substring(10, 12);
                        $(`#${date}${time}`).attr("hidden", "hidden")

                    }
                },
            });

            //$("#2021-12-07上午").attr("hidden","hidden")
            var fullDate = new Date();
            var yyyy = fullDate.getFullYear();
            var MM = (fullDate.getMonth() + 1) >= 10 ? (fullDate.getMonth() + 1) : ("0" + (fullDate.getMonth() + 1));
            var dd = fullDate.getDate() < 10 ? ("0" + fullDate.getDate()) : fullDate.getDate();
            var today = yyyy + "-" + MM + "-" + dd;
            $(function () {
                if ($("#date").val(null)) {
                    $("#dateValidate").attr("visibility", "hidden");
                } else {
                    $("#dateValidate").attr("visibility", "visible");
                }
                $(".myc-available-time").click(function () {
                    $("#date").val(this.id.substring(0, 10));
                    $("#ContentPlaceHolder1_Hidden2").val(this.id.substring(0, 10));
                    $("#time").val(this.id.substring(10, 12));
                    $("#ContentPlaceHolder1_Hidden3").val(this.id.substring(10, 12));
                });

                if ($(".myc-available-time").attr("id").substring(0, 10) == today) {
                    $("#myc-prev-week").hide();
                };
                $("#myc-prev-week").click(() => {
                    if ($(".myc-available-time").attr("id").substring(0, 10) == today) {
                        $("#myc-prev-week").hide();
                    };
                });
            })


            $('#picker').markyourcalendar({
                availability: [
                    [
                        ['上午'], ['下午'],
                    ],
                    [
                        ['上午'], ['下午'],
                    ],
                    [
                        ['上午'], ['下午'],
                    ],
                    [
                        ['上午'], ['下午'],
                    ],
                    [
                        ['上午'], ['下午'],
                    ],
                    [
                        ['上午'], ['下午'],
                    ],
                    [
                        ['上午'], ['下午'],
                    ]
                ],
                startDate: new Date(today),
                onClick: function (ev, data) {
                    // data is a list of datetimes
                    var d = data[0].split(' ')[0];
                    var t = data[0].split(' ')[1];
                    $('#selected-date').html(d);
                    $('#selected-time').html(t);
                },
                onClickNavigator: function (ev, instance) {

                    var arr = [
                        [
                            ['上午'], ['下午'],
                        ],
                        [
                            ['上午'], ['下午'],
                        ],
                        [
                            ['上午'], ['下午'],
                        ],
                        [
                            ['上午'], ['下午'],
                        ],
                        [
                            ['上午'], ['下午'],
                        ],
                        [
                            ['上午'], ['下午'],
                        ],
                        [
                            ['上午'], ['下午'],
                        ]
                    ]
                    instance.setAvailability(arr);

                    if ($("#date").val(null)) {
                        $("#dateValidate").attr("visibility", "hidden");
                    } else {
                        $("#dateValidate").attr("visibility", "visible");
                    }
                    $(".myc-available-time").click(function () {
                        $("#date").val(this.id.substring(0, 10));
                        $("#ContentPlaceHolder1_Hidden2").val(this.id.substring(0, 10));
                        $("#time").val(this.id.substring(10, 12));
                        $("#ContentPlaceHolder1_Hidden3").val(this.id.substring(10, 12));
                    });
                    if ($(".myc-available-time").attr("id").substring(0, 10) == today) {
                        $("#myc-prev-week").hide();
                    };
                    $("#myc-prev-week").click(() => {
                        if ($(".myc-available-time").attr("id").substring(0, 10) == today) {
                            $("#myc-prev-week").hide();
                        };
                    });
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetAllbigMeeting",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        success: function (result) {

                            for (var i = 0; i < result.d.length; i++) {
                                var date = result.d[i].substring(0, 10);
                                var time = result.d[i].substring(10, 12);
                                $(`#${date}${time}`).attr("hidden", "hidden")

                            }
                        },
                    });
                }
            });
        })(jQuery);
    </script>
</asp:Content>

