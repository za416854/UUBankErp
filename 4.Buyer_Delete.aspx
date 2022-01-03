<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        int waterid = int.Parse(Request.QueryString["WaterId"]);
        
        Sponsor SP=  ProductUtility.GetProduct(waterid);

        int buyerid = int.Parse(Request.QueryString["Id"]);
        HiddenField1.Value = buyerid.ToString();
        Cart C = CartUtility.GetoneCartById(buyerid, SP.Waterid);

        ProductUtility.DeleteCountNow(waterid, C.Count);
        CartUtility.DeleteCartByIdWaterid(buyerid,waterid);

        Response.Redirect($"~/4.Myshopcartlist.aspx?Id={HiddenField1.Value}");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="HiddenField1" runat="server" />

</asp:Content>

