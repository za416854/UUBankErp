<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="1.meetingStatus.aspx.cs" Inherits="_1_meetingConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" id="meetingConfirm">
        <div class="media-body">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table table-light table-hover border-dark" id="meetings">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">會議室</th>
                                <th scope="col">會議日期</th>
                                <th scope="col">會議時間</th>
                                <th scope="col">申請人</th>
                                <th scope="col">會議目的</th>
                                <th scope="col">審核程序</th>
                            </tr>
                        </thead>
                </HeaderTemplate>

                <ItemTemplate>
                    <tbody class="border-dark border-0">
                        <tr >
                            <td><%# Eval("Room") %></td>
                            <td><%# Eval("Date") %></td>
                            <td><%# Eval("Time") %></td>
                            <td class="callName"><%# Eval("UserName") %></td>
                            <td><%# Eval("Reason") %></td>
                            <td><%# Eval("Approval") %></td>

                        </tr>
                    </tbody>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <div class="pt-4">
                <a href="../1.meetingConfirm.aspx" Class="btn btn-warning btn-lg" style="width:400px; margin:auto;">返回上一頁</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="1.louis/forProfile/plugins.js"></script>
    <script src="1.louis/forProfile/jquery.main.js"></script>
    <script>
        $(function () {
            var result = new Array();
            
            $(".temp").change(function () {
                var applyName = $(this).parent().parent().parent().parent().parent().find("td:eq(2)").text();
                var status = $(this).val();
                var isSame = false;
                var index = -1;
                //indexOf=>有重複就還索引值，沒有則還-1
                for (var n = 0; n < result.length; n++) {
                    var temp = result[n].split("-")[0];
                    if (temp.indexOf(applyName) != -1) {
                        isSame = true;
                        index = n;
                    }
                }
                if (isSame) {
                    result[index] = applyName + '-' + status;
                } else {
                    result.push(applyName + '-' + status);
                }
                
            });


            $("#Button1").click(function () {

                var myData = {
                    strAry: result,
                };
                swal({
                    title: '確定審核?',
                    type: 'question',
                    showCancelButton: true,
                    cancelButtonText: '取消',
                    confirmButtonText: '確定',
                    focusConfirm: false
                }).then(function () {
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/MeetingResult",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        data: JSON.stringify(myData),
                        async: false,
                        success: function (result) {
                            document.location.replace("../1.profile.aspx")
                        }
                    });
                });
            });


        });
    </script>
</asp:Content>

