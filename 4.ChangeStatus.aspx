<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        int waterid = int.Parse(Request.QueryString["WaterId"]);
        
        Sponsor p=  ProductUtility.GetProduct(waterid);

        HiddenField1.Value = p.Id.ToString();
        p.PDStatus=true;
        ProductUtility.UpdateProduct(p);
        
        Response.Redirect($"~/4.Iamsponsor_Main.aspx?Id={HiddenField1.Value}");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="HiddenField1" runat="server" />

</asp:Content>

