using GemBox.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clubtable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<DayOff> dayOffList = DayOffUtility.GetDayOffs();
        
        foreach (var item in dayOffList)
        {
            if (item.Approval == false.ToString())
            {
                item.Approval = "未核准";
            }
            else
            {
                item.Approval = "已核准";
            }
        }

        Repeater1.DataSource = dayOffList;
        Repeater1.DataBind();
    }

    protected void ButtonDownloadXlsx_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from DayOff", Common.DbConnecitonstring);
        DataTable dt = new DataTable("MyTable");
        da.Fill(dt);


        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("sheet1");
        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 2,
               StartRow = 2,
               ColumnHeaders = true
           });
        //xlsx.Save(Server.MapPath(@"Output\test3.xlsx"));

        xlsx.Save(Response, "test3.xlsx");
    }
}