<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ Import Namespace="GemBox.Spreadsheet" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        int waterid = Convert.ToInt32(Request.QueryString["Waterid"]);
        Sponsor P = ProductUtility.GetProduct(waterid);
        SqlDataAdapter da = new SqlDataAdapter(
            "select Cart.Id,Employee.Name,Employee.CellPhone,Employee.Email,Cart.Count from Cart INNER JOIN Sponsors on Cart.Waterid = Sponsors.Waterid RIGHT JOIN Employee on Cart.Id = Employee.ID where Sponsors.Waterid=@id",
            @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
            );
        da.SelectCommand.Parameters.AddWithValue("@id", waterid);
        DataTable dt = new DataTable("MyTable");
        da.Fill(dt);


        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("sheet1");

        mySheet.Cells[0, 0].Value = "產品編號";
        mySheet.Cells[0, 0].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 0].Value = $"No.{P.Waterid}";
        mySheet.Cells[0, 1].Value = "產品名稱";
        mySheet.Cells[0, 1].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 1].Value = P.ProductName;
        mySheet.Cells[0, 2].Value = "產品價格";
        mySheet.Cells[0, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 2].Value = P.Price;
        mySheet.Cells[0, 3].Value = "購買總數量";
        mySheet.Cells[0, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 3].Value = P.PDCountNow;
        
        mySheet.Cells[4, 0].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[4, 0].Value = "員工編號";
        mySheet.Cells[4, 1].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[4, 1].Value = "員工姓名";
        mySheet.Cells[4, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[4, 2].Value = "員工電話";
        mySheet.Cells[4, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[4, 3].Value = "Email";
        mySheet.Cells[4, 4].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[4, 4].Value = "購買數量";
        mySheet.InsertDataTable(dt,
            new InsertDataTableOptions()
            {
                StartColumn = 0,
                StartRow = 5,
                //ColumnHeaders = true
            });
        //存路徑 AJAX
        //xlsx.Save(Server.MapPath(@"Output\test3.xlsx"));

        xlsx.Save(Response,$"No.{waterid}_{P.ProductName}_Buyerlist.xlsx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="HiddenField1" runat="server" />

</asp:Content>

