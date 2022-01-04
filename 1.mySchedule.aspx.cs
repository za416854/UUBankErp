using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemBox.Spreadsheet;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;


public partial class _1_mySchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["ep"] == null)
            {
                Response.Redirect("~/1.login.aspx");
            }
            else
            {
                Employee ep = Session["ep"] as Employee;
                HiddenField1.Value = ep.Name;
            }

        }



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Employee ep = Session["ep"] as Employee;
        SqlDataAdapter da = new SqlDataAdapter(
        "select EventName, StartDate, StartTime, EndDate, EndTime from mySchedule where Loginer=@loginer",
        @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
        );
        da.SelectCommand.Parameters.AddWithValue("@loginer", ep.Name);
        DataTable dt = new DataTable("MySchedule");
        da.Fill(dt);

        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("Schedule1");
        mySheet.Cells[0, 0].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[0, 1].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[0, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[0, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[0, 4].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 0,
               StartRow = 0,
               ColumnHeaders = true
           });
        xlsx.Save(Response,"mySchedule.xlsx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Employee ep = Session["ep"] as Employee;
        SqlDataAdapter da = new SqlDataAdapter(
        "select EventName, StartDate, StartTime, EndDate, EndTime from mySchedule where Loginer=@loginer",
        @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
        );
        da.SelectCommand.Parameters.AddWithValue("@loginer", ep.Name);
        DataTable dt = new DataTable("MySchedule");
        da.Fill(dt);
        string s = "";
        foreach (DataRow item in dt.Rows)
        {
            s += $"{item[0].ToString()}\r\n{item[1].ToString()}\r\n{item[2].ToString()}\r\n{item[3].ToString()}\r\n{item[4].ToString()}<br />";
        }

        MailMessage msg = new MailMessage();

        msg.To.Add(ep.Email);
        msg.From = new MailAddress("a80665308@gmail.com",
            "Louis", System.Text.Encoding.UTF8);
        msg.Subject = "mySchedule";
        //指定Subject的編碼  
        msg.SubjectEncoding = System.Text.Encoding.UTF8;

        msg.Body = s ;
        msg.IsBodyHtml = true;
        msg.BodyEncoding = System.Text.Encoding.UTF8;

        SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

        //寄件者的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential(
            "a80665308@gmail.com", "");

        //啟用 SSL
        MySmtp.EnableSsl = true;
        MySmtp.Send(msg);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/1.scheduleList.aspx");
    }
}
