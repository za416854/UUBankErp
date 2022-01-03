<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.MessageBoardList.aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <!-- End plugin css for this page -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="card">
            <div class="card-body">
                <h1 class="badge badge-outline-primary" style="font-size: xx-large">UUU內部留言板</h1>
                <div class="row">

                    <div class="col-12">
                        <br />
                        <asp:HyperLink ID="HyperLink1" CssClass="btn btn-facebook" runat="server">新增留言</asp:HyperLink>
                        <%--<a class="btn btn-facebook" onclick="return confirm('確認新增?');" href="/3.MessageBoardAdd.aspx">新增留言</a>--%>
                        <%--<asp:Button ID="ButtonDownloadXlsx" CssClass="btn btn-reddit" OnClientClick="return confirm('確認下載?');" runat="server" Text="" />--%>
                        <br />
                        <br />
                        <div class="table-responsive pt-3">
                            <table id="order-listing" class="table">
                                <thead>
                                    <tr>
                                        <th>留言號碼</th>
                                        <th>來自</th>
                                        <th>對象</th>
                                        <th>主旨</th>
                                        <th>留言時間</th>
                                        <th>狀態</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Id") %></td>
                                                <td><%#Eval("FromName") %></td>
                                                <td><%#Eval("ToName") %></td>
                                                <td><a class="" href='<%# Eval("Id","/3.MessageBoardDetail.aspx?id={0}") %>'><%#Eval("Topic") %></a></td>
                                                <td><%#Eval("Time") %></td>
                                                <td><%#Eval("State") %></td>
                                                <%--<td><a class="btn btn-outline-primary" href='<%# Eval("DayOffId" , "/3.DayOffEdit.aspx?id={0}") %>'>詳情</a></td>--%>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br />
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
    <script>

</script>
</asp:Content>
