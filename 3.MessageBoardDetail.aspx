<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.MessageBoardDetail.aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <!-- End plugin css for this page -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="badge badge-outline-primary" style="font-size: xx-large">留言大聲公/Message Board</h4>
                        <br />
                        <br />
                        
                        <p class="card-description">
                            <asp:Label ID="Label1" runat="server" Text="主旨：" Font-Size="X-Large" ForeColor="#FF3300"></asp:Label>
                            <asp:Label ID="LabelTopic" runat="server" Font-Size="X-Large" ForeColor="#FF3300" Text="LabelTopic"></asp:Label>
                            <br /> <br />
                            <asp:Label ID="LabelToName" runat="server" Font-Size="Large" ForeColor="#0099CC" Text="LabelTopic"></asp:Label>
                            

                            <asp:Label ID="LabelTime" runat="server" Font-Size="Large" CssClass="pull-right" Text="LabelTime" ForeColor="#0099CC"></asp:Label>&nbsp
                            <asp:Label ID="LabelFromName" runat="server" Font-Size="Large" CssClass="pull-right" Text="LabelName" ForeColor="#0099CC"></asp:Label> 
                        </p>
                        <div class="card card-inverse-info" id="context-menu-simple">
                            <div class="card-body">
                                <p class="card-text">
                                    <asp:Label ID="LabelContent" runat="server" Text="LabelContent" Font-Size="X-Large"></asp:Label>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<asp:Label ID="Label2" runat="server" Text="留言板"></asp:Label>--%><br />
                <%--<asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>--%><br />
                <br />
                <asp:Button ID="ButtonRetuenToMBList" OnClick="ButtonRetuenToMBList_Click" CssClass="btn btn-reddit" runat="server" Text="回留言板" />
                &nbsp&nbsp&nbsp<asp:Button ID="ButtonDelete" OnClick="ButtonDelete_Click" OnClientClick="return confirm('確認刪除?');" CssClass="btn btn-dark  pull-right" runat="server" Text="刪除此留言" Visible="False" />
                <%--<asp:Button ID="ButtonRetuenToAddMessage" OnClick="ButtonRetuenToAddMessage_Click" CssClass="btn btn-facebook" runat="server" Text="我要留言" />--%>
                <asp:HyperLink ID="HyperLink1" CssClass="btn btn-facebook"  runat="server">我要留言</asp:HyperLink>
                <%--OnClientClick="return confirm('確認下載?');"--%>
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
