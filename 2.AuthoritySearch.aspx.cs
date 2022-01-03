using GemBox.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_AuthoritySearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Authority AU = Session["HumanAuthorityInfo"] as Authority;
        if (AU == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        if (AU.EditAU == false)
        {
            Response.Redirect("~/2.HumanLogin.aspx");
        }

    }


    protected void btn1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            HumanMember human = HumanMemberUtility.GetHumanMemberByIdAndName(int.Parse(txtNumber.Text),txtName.Text);

            if (human != null)
            {
                Response.Redirect($"~/2.AuthorityEdite.aspx?id={human.ID}&name={human.Name}");
                hid1.Value = "ok";
            }
            else
            {
                hid1.Value = "false";
            }
        }
       
    }

    protected void btnExcel_Click(object sender, EventArgs e)
    {
        string cn = Commons.DbConnecitonstring;
        SqlDataAdapter da = new SqlDataAdapter(
       "select *  from  Authority ", cn
       );
        DataTable dt = new DataTable("MyTable");
        da.Fill(dt);


        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("員工權限資料");
        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 0,
               StartRow = 0,
               ColumnHeaders = true
           });
        xlsx.Save(Server.MapPath(@"Output\EmployeeList.xlsx"));
        xlsx.Save(Response, "EmployeeAuthorityList.xlsx");
        hid2.Value = "ok";
    }
}