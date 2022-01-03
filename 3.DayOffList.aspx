<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.DayOffList.aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <!-- End plugin css for this page -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="card">
            <div class="card-body">
                <h4 class="badge badge-outline-primary" style="font-size: x-large">員工假單申請紀錄</h4>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive pt-3">
                            <table id="order-listing" class="table">
                                <thead>
                                    <tr>
                                        <th>假單編號 #</th>
                                        <th>姓名</th>
                                        <th>假別</th>
                                        <th>起始日期</th>
                                        <th>起始時間</th>
                                        <th>結束日期</th>
                                        <th>結束時間</th>
                                        <th>合計</th>
                                        <th>請假證明附檔</th>
                                        <th>請假原因</th>
                                        <th>核准請假</th>
                                        <th>假單資訊</th>
                                        <th>拒絕原因</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("DayOffId") %></td>
                                                <td><%#Eval("Name") %></td>
                                                <td><%#Eval("Type") %></td>
                                                <td><%#Eval("StartDate") %></td>
                                                <td><%#Eval("StartTime") %></td>
                                                <td><%#Eval("EndDate") %></td>
                                                <td><%#Eval("EndTime") %></td>
                                                <td><%#Eval("DayOffTime") %></td>
                                                <td><%#Eval("EvidencePic") %></td>
                                                <td><%#Eval("Reason") %></td>
                                                <td><%#Eval("Approval") %></td>
                                                <td><a class="btn btn-outline-primary" href='<%# Eval("DayOffId" , "/3.DayOffEdit.aspx?id={0}") %>'>詳情</a></td>
                                                <td><%#Eval("RejectionReason") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <asp:Button ID="ButtonDownloadXlsx" CssClass="btn btn-success" OnClientClick="return confirm('確認下載?');" OnClick="ButtonDownloadXlsx_Click" runat="server" Text="下載Xlsx檔" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <!-- Plugin js for this page-->
    <script src="/vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <!-- End plugin js for this page-->

    <!-- Custom js for this page-->
    <script src="/js/data-table.js"></script>
    <!-- End custom js for this page-->
</asp:Content>

