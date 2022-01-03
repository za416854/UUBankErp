<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.ClubOnlyHome.aspx.cs" Inherits="_2_ClubOnlyHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/calander/jquery-ui.min.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/calander/jquery.timepicker.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/calander/site.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/calander/main.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/calander/StyleSheetForMySchedule.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/jsgrid.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/jsgrid-theme.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/sweetalert2.css" rel="stylesheet" />
    <style>
        .forBtns {
            margin-top: 500px;
            margin-left: 70px;
        }

        .fc-h-event {
            background-color: #FF8040;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb ">
                <li class="breadcrumb-item">
                    <h1 class="row justify-content-center ">
                        <asp:Label ID="lblClubName" runat="server" Text="" ForeColor="#4863A0"></asp:Label>
                    </h1>
               </li>
            </ol>
        </nav>
        <div class="row ">
            <div class=" col-2">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-outline-primary " NavigateUrl="~/2.ClubHome.aspx">返回社團首頁</asp:HyperLink>
            </div>
        </div>
    </div>
    <div class="container">
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <div id="dialog-form" title="加入行事曆" class="modal" tabindex="-1" role="dialog">
            <div id="mydiv">
                <fieldset>
                    <div class="row">
                        <div class="col-12">
                            <label for="eventName">事件:</label>
                            <input type="text" name="eventName" id="eventName" class="text ui-widget-content ui-corner-all" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-12">
                            <label for="startDate">開始日期</label>
                            <input type="text" id="startDate" name="startDate" class="text ui-widget-content ui-corner-all datepicker d-inline" />
                            <br />
                            <label for="startTime">開始時間</label>
                            <input type="text" id="startTime" name="startTime" value="8:00am" class="text ui-widget-content ui-corner-all timepicker" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-12">
                            <label for="endDate">結束日期</label>
                            <input type="text" id="endDate" name="endDate" class="text ui-widget-content ui-corner-all datepicker" />
                            <br />
                            <label for="endTime">結束時間</label>
                            <input type="text" id="endTime" name="endTime" value="5:00pm" class="text ui-widget-content ui-corner-all timepicker" />
                        </div>
                    </div>
                    <br />
                    <!-- Allow form submission with keyboard without duplicating the dialog button -->
                    <!--<input type="submit" tabindex="-1" style="position: absolute; top: -1000px" />-->
                </fieldset>
            </div>
        </div>
        <div class="col-md-11 row-col-11" id='calendar'></div>
    </div>
    <div class="content-wrapper">
        <div class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">社團社員名單</h4>
                    

                    <div class="row">
                        <div class="table-sorter-wrapper col-lg-12 table-responsive">
                            <table id="sortable-table-1" class="table">

                                <asp:Repeater ID="rptclubEM" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th class="sortStyle">社員員工編號<i class="ti-angle-down"></th>
                                                <th class="sortStyle">社員姓名<i class="ti-angle-down"></i></th>
                                                <th class="sortStyle">社員部門<i class="ti-angle-down"></i></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("EmployeeId") %></td>
                                            <td><%# Eval("EmployeeName") %></td>
                                            <td><%# Eval("EmployeeDepartment") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>








    <%--<div class="row">
        <div class="col-lg-1 row-cols-1">
            <div class="text-center forBtns">
                <div class="mt-5">
                </div>
                <div class="mt-5">
                </div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
            </div>
        </div>
       
        
    </div>--%>


    <div>
        <asp:HiddenField ID="hfdClubId" runat="server" />
        <asp:HiddenField ID="hfdUserName" runat="server" />
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <%-- <script src="Scripts/jquery-3.6.0.js"></script>--%>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <%-- <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>--%>
    <script src="2.custom/tonyCss/calander/jquery.timepicker.js"></script>
    <script src="2.custom/tonyCss/calander/main.js"></script>
    <script src="2.custom/tonyCss/calander/theme-chooser.js"></script>
    <script src="2.custom/tonyCss/calander/zh-tw.js"></script>
    <script src="2.custom/tonyCss/calander/site.js"></script>
    <script src="2.custom/tonyCss/calander/datepicker-zh-TW.js"></script>
    <script src="2.custom/tonyJS/jsgrid.min.js"></script>
    <script src="2.custom/tonyJS/jsgrid-zh-tw.js"></script>
    <script src="2.custom/tonyJS/sweetalert2.js"></script>
    <script src="2.custom/tonyJS/jq.tablesort.js"></script>
    <script src="2.custom/tonyJS/tablesorter.js"></script>

    <script>


        document.addEventListener('DOMContentLoaded', function () {

            var eventName = $("#eventName"),
                startDate = $("#startDate"),
                startTime = $("#startTime"),
                endDate = $("#endDate"),
                endTime = $("#endTime");
            dialog = $("#dialog-form").dialog({
                autoOpen: false,
                height: 350,
                width: 350,
                modal: true,
                closeOnEscape: false,
                open: function (event, ui) {
                    $(".ui-dialog-titlebar-close").hide();
                }
            });

            function tranTime(time) {
                if (time.indexOf('pm') > 1) {
                    var tempAry = time.replace('pm', '').split(":");
                    var tempTime = (parseInt(tempAry[0]) + 12).toString() + ":" + tempAry[1];
                    return tempTime;
                } else {
                    var tempAry = time.replace('am', '').split(":");
                    var tempTime = "0" + tempAry[0] + ":" + tempAry[1];
                    return tempTime;
                }
            }

            function CorrectSubDate(date) {
                var data = "";
                //date 格式 2021-11-22
                var tempAry = date.split("-");
                var tempYear = parseInt(tempAry[0]);
                var tempMonth = parseInt(tempAry[1]);
                var tempday = parseInt(tempAry[2]);

                tempday = tempday - 1;
                data = JudgeYear(tempYear, tempMonth, tempday);

                tempAry = date.split("-");
                tempYear = parseInt(tempAry[0]);
                tempMonth = parseInt(tempAry[1]);
                tempday = parseInt(tempAry[2]);
                if (tempday == 0) {
                    tempMonth -= 1;
                    data = JudgeYear(tempYear, tempMonth, tempday);

                    tempAry = date.split("-");
                    tempYear = parseInt(tempAry[0]);
                    tempMonth = parseInt(tempAry[1]);
                    tempday = parseInt(tempAry[2]);
                    if (tempMonth == 0) {
                        tempYear -= 1;
                        data = JudgeYear(tempYear, tempMonth, tempday);
                    }
                }
                return data;

            }

            function JudgeYear(year, month, day) {
                if (day == 0) {
                    if (month == 1) {
                        JudgeYear(year - 1, 13);
                    } else if (month == 2 || month == 4 || month == 6 || month == 8 || month == 9 || month == 11 || month == 13) {
                        return year.toString() + "-" + (month - 1).toString() + "-31";
                    } else if (month == 5 || month == 7 || month == 10 || month == 12) {
                        return year.toString() + "-" + (month - 1).toString() + "-30";
                    } else if (month == 3) {
                        if ((year % 4 == 0 && year % 100 != 0) || (yyyy % 400 == 0)) {
                            return year.toString() + "-" + (month - 1).toString() + "-29";
                        } else {
                            return year.toString() + "-" + (month - 1).toString() + "-28";
                        }
                    }
                } else {
                    if (day < 10) {
                        return year.toString() + "-" + month.toString() + "-0" + day.toString();
                    } else {
                        return year.toString() + "-" + month.toString() + "-" + day.toString();
                    }
                }
            }

            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                //initialDate: '2020-09-12',
                locale: 'zh-tw',
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                select: function (arg) {
                    startDate.val(arg.startStr);

                    var tempAry = arg.endStr.split("-");
                    var temp = parseInt(tempAry[2]) - 1;
                    var tempDay;
                    if (temp == 0) {
                        tempAry = arg.startStr.split("-");
                        //alert(parseInt(arg.start.getMonth()) - parseInt(arg.end.getMonth()));
                        //如果 結束日期為"1"(代表跨月) 並且 開始月份 – 結束月份不等於"0"(代表不同月)
                        if (parseInt(arg.end.getDate()) == 1 && parseInt(arg.start.getMonth()) - parseInt(arg.end.getMonth()) != 0) {
                            //如果 開始月份 – 結束月份等於"-2"(代表跨2個月)
                            if (parseInt(arg.start.getMonth()) - parseInt(arg.end.getMonth()) == -2) {
                                tempAry[1] = (parseInt(tempAry[1]) + 1).toString();
                            }
                            //不完美替換
                            temp = arg.end.getUTCDate();
                            if (temp < 10) {
                                temp = "0" + temp.toString();
                            }
                        } else {
                            tempDay = arg.startStr;
                        }
                    } else if (temp < 10 && temp > 0) {
                        temp = "0" + temp.toString();
                    }
                    tempDay = tempAry[0] + "-" + tempAry[1] + "-" + temp;
                    endDate.val(tempDay);

                    dialog.dialog("open");
                    //alert(arg.startStr);
                    dialog.dialog({
                        buttons: {
                            "加入": function () {
                                if (eventName.val() != "" &&
                                    startDate.val() != "" &&
                                    startTime.val() != "" &&
                                    endDate.val() != "" &&
                                    endTime.val() != "") {

                                    //取得是否全天(判斷開始、結束的日期)
                                    var tempBool;
                                    //var tempAry = startDate.val().split("-");
                                    //var tempStart = tempAry[2];
                                    //tempAry = endDate.val().split("-");
                                    //var tempEnd = tempAry[2];
                                    if (startDate.val() == endDate.val()) {
                                        if (startTime.val() != "8:00am" || endTime.val() != "5:00pm") {
                                            tempBool = "False";
                                        } else {
                                            tempBool = "True";
                                        }
                                    } else {
                                        tempBool = "True";
                                    }

                                    var myData = {
                                        userName:  $("#ContentPlaceHolder1_hfdUserName").val(),  //需要更改
                                        eventName: eventName.val(),
                                        startDate: startDate.val(),
                                        startTime: startTime.val(),
                                        endDate: endDate.val(),
                                        endTime: endTime.val(),
                                        isAllDay: tempBool,
                                        clubId: $("#ContentPlaceHolder1_hfdClubId").val()
                                    };

                                    $.ajax({
                                        type: "POST",
                                        url: 'TonyWebService.asmx/AddCalender',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        data: JSON.stringify(myData),
                                        async: false,
                                        success: function (result) {

                                            if (myData.isAllDay == "False") {
                                                var start = myData.startDate + "T" + tranTime(myData.startTime);
                                                var end = myData.endDate + "T" + tranTime(myData.endTime);

                                                calendar.addEvent({
                                                    id: result.d.toString(),
                                                    title: myData.userName + ":" + myData.eventName,
                                                    start: start,
                                                    end: end,
                                                    allDay: tempBool == "True"
                                                })
                                            } else {
                                                calendar.addEvent({
                                                    id: result.d.toString(),
                                                    title: myData.userName + ":" + myData.eventName,
                                                    start: arg.start,
                                                    end: arg.end,
                                                    allDay: tempBool == "True"
                                                })
                                            }
                                            dialog.dialog("close");
                                        }
                                    });
                                }
                            },
                            "關閉": function () {
                                dialog.dialog("close");
                            }
                        }
                    });
                    $(".datepicker").datepicker({
                        dateFormat: 'yy-mm-dd',
                        firstDay: 0,
                        isRTL: false,
                        constrainInput: true,
                        showButtonPanel: true,
                        currentText: "本月",
                        closeText: "關閉"
                    });
                    //https://www.jonthornton.com/jquery-timepicker/
                    $('.timepicker').timepicker({
                        'minTime': '8:00am',
                        'maxTime': '5:00pm',
                        'showDuration': true
                    });
                    calendar.unselect()
                },
                eventClick: function (arg) {
                    var tempNameAry = arg.event.title.split(":");
                    var tempName = tempNameAry[0];
                    var tempEvent = tempNameAry[1];
                    eventName.val(tempEvent);

                    var tempStartDate = arg.event.startStr.substring(0, 10);
                    startDate.val(tempStartDate);
                    var tempAry = arg.event.endStr.substring(0, 10).split("-");
                    var tempDay = tempAry[0] + "-" + tempAry[1] + "-" + tempAry[2];

                    if (arg.event.allDay == true) {
                        tempDay = CorrectSubDate(tempDay);
                    }
                    endDate.val(tempDay);

                    dialog.dialog("open");
                    dialog.dialog({
                        buttons: {
                            "修改": function () {
                                if (eventName.val() != "" &&
                                    startDate.val() != "" &&
                                    startTime.val() != "" &&
                                    endDate.val() != "" &&
                                    endTime.val() != "") {

                                    var tempBool;
                                    var tempAllDay = arg.event.allDay;
                                    var turnAllDay = false;
                                    var turnHalfDay = false;
                                    if (startDate.val() == endDate.val()) {
                                        if (startTime.val() != "8:00am" || endTime.val() != "5:00pm") {
                                            if (tempAllDay) {
                                                turnHalfDay = true;
                                            }
                                            tempBool = "False";
                                        } else {
                                            tempBool = "True";
                                        }
                                    } else {
                                        if (!tempAllDay) {
                                            turnAllDay = true;
                                        }
                                        tempBool = "True";
                                    }

                                    var myData = {
                                        id: parseInt(arg.event.id),
                                        userName: tempName,
                                        eventName: eventName.val(),
                                        startDate: startDate.val(),
                                        startTime: startTime.val(),
                                        endDate: endDate.val(),
                                        endTime: endTime.val(),
                                        isAllDay: tempBool,
                                        clubId: $("#ContentPlaceHolder1_hfdClubId").val()
                                    };

                                    $.ajax({
                                        type: "POST",
                                        url: 'TonyWebService.asmx/Update',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        data: JSON.stringify(myData),
                                        async: false,
                                        success: function (result) {
                                            if (myData.isAllDay == "False") {
                                                var newEnd = myData.endDate;

                                                var start = myData.startDate + "T" + tranTime(myData.startTime);
                                                var end = newEnd + "T" + tranTime(myData.endTime);

                                                arg.event.remove();
                                                calendar.addEvent({
                                                    id: myData.id.toString(),
                                                    title: myData.userName + ":" + myData.eventName,
                                                    start: start,
                                                    end: end,
                                                    allDay: myData.isAllDay == "True"
                                                })
                                            } else {
                                                var newEnd = myData.endDate;
                                                if (turnAllDay) {
                                                    var newAry = newEnd.split("-");
                                                    newAry[2] = (parseInt(newAry[2]) + 1).toString();
                                                    newEnd = newAry[0] + "-" + newAry[1] + "-" + newAry[2];
                                                }

                                                var tempEndAry = newEnd.split("-");
                                                var tempEndNumber = parseInt(tempEndAry[2]) + 1;
                                                if (tempEndNumber < 10) {
                                                    newEnd = tempEndAry[0] + "-" + tempEndAry[1] + "-" + "0" + (tempEndNumber).toString();
                                                } else {
                                                    newEnd = tempEndAry[0] + "-" + tempEndAry[1] + "-" + (tempEndNumber).toString();
                                                }

                                                arg.event.remove();
                                                calendar.addEvent({
                                                    id: myData.id.toString(),
                                                    title: myData.userName + ":" + myData.eventName,
                                                    start: myData.startDate,
                                                    end: newEnd,
                                                    allDay: myData.isAllDay == "True"
                                                })
                                            }
                                            calendar.render();
                                            dialog.dialog("close");
                                        }
                                    });
                                }
                            },
                            "刪除": function () {
                                var myData = {
                                    id: parseInt(arg.event.id)
                                };

                                $.ajax({
                                    type: "POST",
                                    url: 'TonyWebService.asmx/Delete',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    data: JSON.stringify(myData),
                                    async: false,
                                    success: function (result) {
                                        arg.event.remove();
                                        dialog.dialog("close");
                                    }
                                });
                            },
                            "關閉": function () {
                                dialog.dialog("close");
                            }
                        }
                    });
                    $(".datepicker").datepicker({
                        dateFormat: 'yy-mm-dd',
                        firstDay: 0,
                        isRTL: false,
                        constrainInput: true,
                        showButtonPanel: true,
                        currentText: "本月",
                        closeText: "關閉"
                    });
                    //https://www.jonthornton.com/jquery-timepicker/
                    $('.timepicker').timepicker({
                        'minTime': '8:00am',
                        'maxTime': '5:00pm',
                        'showDuration': true
                    });
                    calendar.unselect()
                },
                eventDrop: function (arg) {
                    var tempNameAry = arg.event.title.split(":");
                    var tempName = tempNameAry[0];
                    var tempEvent = tempNameAry[1];
                    eventName.val(tempEvent);

                    if (arg.event.allDay == true) {
                        tempBool = "True";
                        startDate.val(arg.event.startStr);
                        endDate.val(CorrectSubDate(arg.event.endStr));
                    } else {
                        tempBool = "False";
                        startDate.val(arg.event.startStr.substring(0, 10));
                        endDate.val(arg.event.endStr.substring(0, 10));

                        var tempAry = arg.event.startStr.substring(11, 19).split(":");
                        if (parseInt(tempAry[0]) > 12) {
                            var temp = parseInt(tempAry[0]) - 12;
                            startTime.val(temp.toString() + ":" + tempAry[1] + "pm");
                        } else {
                            startTime.val(parseInt(tempAry[0]).toString() + ":" + tempAry[1] + "am");
                        }

                        tempAry = arg.event.endStr.substring(11, 19).split(":");
                        if (parseInt(tempAry[0]) > 12) {
                            var temp = parseInt(tempAry[0]) - 12;
                            endTime.val(temp.toString() + ":" + tempAry[1] + "pm");
                        } else {
                            endTime.val(parseInt(tempAry[0]).toString() + ":" + tempAry[1] + "am");
                        }
                    }

                    var myData = {
                        id: parseInt(arg.event.id),
                        userName: tempName,
                        eventName: eventName.val(),
                        startDate: startDate.val(),
                        startTime: startTime.val(),
                        endDate: endDate.val(),
                        endTime: endTime.val(),
                        isAllDay: tempBool,
                        clubId: $("#ContentPlaceHolder1_hfdClubId").val()
                    };

                    $.ajax({
                        type: "POST",
                        url: 'TonyWebService.asmx/Update',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(myData),
                        async: false,
                        success: function (result) {

                        }
                    });
                },
                eventResize: function (arg) {

                    var tempNameAry = arg.event.title.split(":");
                    var tempName = tempNameAry[0];
                    var tempEvent = tempNameAry[1];
                    eventName.val(tempEvent);

                    if (arg.event.allDay == true) {
                        tempBool = "True";
                        startDate.val(arg.event.startStr);
                        endDate.val(CorrectSubDate(arg.event.endStr));
                    } else {
                        tempBool = "False";
                        startDate.val(arg.event.startStr.substring(0, 10));
                        endDate.val(arg.event.endStr.substring(0, 10));

                        var tempAry = arg.event.startStr.substring(11, 19).split(":");
                        if (parseInt(tempAry[0]) > 12) {
                            var temp = parseInt(tempAry[0]) - 12;
                            startTime.val(temp.toString() + ":" + tempAry[1] + "pm");
                        } else {
                            startTime.val(parseInt(tempAry[0]).toString() + ":" + tempAry[1] + "am");
                        }

                        tempAry = arg.event.endStr.substring(11, 19).split(":");
                        if (parseInt(tempAry[0]) > 12) {
                            var temp = parseInt(tempAry[0]) - 12;
                            endTime.val(temp.toString() + ":" + tempAry[1] + "pm");
                        } else {
                            endTime.val(parseInt(tempAry[0]).toString() + ":" + tempAry[1] + "am");
                        }
                    }

                    var myData = {
                        id: parseInt(arg.event.id),
                        userName: tempName,
                        eventName: eventName.val(),
                        startDate: startDate.val(),
                        startTime: startTime.val(),
                        endDate: endDate.val(),
                        endTime: endTime.val(),
                        isAllDay: arg.event.allDay,
                        clubId: $("#ContentPlaceHolder1_hfdClubId").val()
                    };

                    $.ajax({
                        type: "POST",
                        url: 'TonyWebService.asmx/Update',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(myData),
                        async: false,
                        success: function (result) {

                        }
                    });
                },
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                events: function (error, callback) {
                    //events: function () {
                    $.ajax({
                        type: "POST",
                        url: 'TonyWebService.asmx/GetCalenders',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ clubid: $("#ContentPlaceHolder1_hfdClubId").val() }),
                        async: false,
                        success: function (result) {
                            var events = [];
                            for (var n = 0; n < result.d.length; n++) {
                                var tempAry = result.d[n].StartDate.split("-");
                                var tempStart = tempAry[2];
                                tempAry = result.d[n].EndDate.split("-");
                                var tempEnd = tempAry[2];
                                if (tempStart == tempEnd) {
                                    if (result.d[n].StartTime != "8:00am" || result.d[n].EndTime != "5:00pm") {

                                        var start = result.d[n].StartDate + "T" + tranTime(result.d[n].StartTime);
                                        var end = result.d[n].EndDate + "T" + tranTime(result.d[n].EndTime);

                                        events.push({
                                            id: result.d[n].Id.toString(),
                                            title: result.d[n].UserName + ":" + result.d[n].EventName,
                                            start: start,
                                            end: end,
                                            allDay: result.d[n].IsAllDay == "True"
                                        });
                                    } else {
                                        //全天
                                        //顯示時，若時間為2021-11-28~2021-11-30，只會有11/28、11/29被選到
                                        //此地方為強制+1，讓顯示可以選到11/30
                                        //經測試，因為日期沒有11/31，所以也只會選到11/30，不會跳月選到12/01

                                        var tempEndAry = result.d[n].EndDate.split("-");
                                        var tempEndNumber = parseInt(tempEndAry[2]) + 1;
                                        if (tempEndNumber < 10) {
                                            var tempEndEx = tempEndAry[0] + "-" + tempEndAry[1] + "-" + "0" + (tempEndNumber).toString();
                                        } else {
                                            var tempEndEx = tempEndAry[0] + "-" + tempEndAry[1] + "-" + (tempEndNumber).toString();
                                        }
                                        events.push({
                                            id: result.d[n].Id.toString(),
                                            title: result.d[n].UserName + ":" + result.d[n].EventName,
                                            start: result.d[n].StartDate,
                                            end: tempEndEx,
                                            allDay: result.d[n].IsAllDay == "True"
                                        });
                                    }

                                } else {
                                    //全天
                                    //顯示時，若時間為2021-11-28~2021-11-30，只會有11/28、11/29被選到
                                    //此地方為強制+1，讓顯示可以選到11/30
                                    //經測試，因為日期沒有11/31，所以也只會選到11/30，不會跳月選到12/01

                                    var tempEndAry = result.d[n].EndDate.split("-");
                                    var tempEndNumber = parseInt(tempEndAry[2]) + 1;
                                    if (tempEndNumber < 10) {
                                        var tempEndEx = tempEndAry[0] + "-" + tempEndAry[1] + "-" + "0" + (tempEndNumber).toString();
                                    } else {
                                        var tempEndEx = tempEndAry[0] + "-" + tempEndAry[1] + "-" + (tempEndNumber).toString();
                                    }
                                    events.push({
                                        id: result.d[n].Id.toString(),
                                        title: result.d[n].UserName + ":" + result.d[n].EventName,
                                        start: result.d[n].StartDate,
                                        end: tempEndEx,
                                        allDay: result.d[n].IsAllDay == "True"
                                    });
                                }
                            }
                            callback(events);
                        }
                    });
                }
            });

            calendar.render();

            // build the locale selector's options
            calendar.getAvailableLocaleCodes().forEach(function (localeCode) {
                var optionEl = document.createElement('option');
                optionEl.value = localeCode;
                optionEl.selected = localeCode == 'zh-tw';
                optionEl.innerText = localeCode;
            });
        });
    </script>
</asp:Content>

