using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clubtable : System.Web.UI.Page
{
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    string imageFileName = HiddenField1.Value;

    //    if (FileUpload1.HasFile)
    //    {
    //        string path = Server.MapPath($"/Images/{FileUpload1.FileName}");

    //        FileUpload1.SaveAs(path);

    //        imageFileName = FileUpload1.FileName;
    //    }


    //    Product p = new Product(
    //           int.Parse(TextBox1.Text),
    //           TextBox2.Text,
    //           int.Parse(TextBox3.Text),
    //           imageFileName);

    //    ProductUtility.Update(p);

    //    Response.Redirect("~/ProductList2.aspx");
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            DayOff d = DayOffUtility.GetDayOff(id);

            TextBoxDayOffId.Text = d.DayOffId.ToString();
            TextBoxName.Text = d.Name;
            TextBoxType.Text = d.Type;
            TextBoxStartDate.Text = d.StartDate;
            TextBoxStartTime.Text = d.StartTime;
            TextBoxEndDate.Text = d.EndDate;
            TextBoxEndTime.Text = d.EndTime;
            TextBoxReason.Text = d.Reason;

            HiddenField1.Value = d.EvidencePic;
            ImageEvidencePic.ImageUrl = "~/kris/Images/" + d.EvidencePic;
            if (d.Approval == "False")
            {
                d.Approval = "尚未核准";
            }
            else
            {
                d.Approval = "已核准";
            }
            TextBoxApproval.Text = d.Approval;
            TextBoxRejectionReason.Text = d.RejectionReason;

        }
    }

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(Request.QueryString["id"]);
        DayOff dayOff = DayOffUtility.GetDayOffById(id);
        Employee ep = Session["ep"] as Employee;
        MailMessage msg = new MailMessage();
        msg.To.Add("za416854@gmail.com");
        msg.From = new MailAddress("z416854@gmail.com",
            $"{ep.Name}", System.Text.Encoding.UTF8);
        msg.Subject = $"{ep.Name}的假單刪除申請";
        //指定Subject的編碼  
        msg.SubjectEncoding = System.Text.Encoding.UTF8;

        msg.Body = $"您好，{dayOff.Name}，我是{ep.Name}<br />假單已完成刪除。";
        msg.IsBodyHtml = true;
        msg.BodyEncoding = System.Text.Encoding.UTF8;

        SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

        //寄件者的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential(
            "z416854@gmail.com", "chris710");

        //啟用 SSL
        MySmtp.EnableSsl = true;
        MySmtp.Send(msg);
         DayOffUtility.DeleteDayOff(id);
        Response.Redirect("~/3.DayOffList.aspx");
    }

    protected void ButtonApproval_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        //DayOff dayOff = new DayOff(TextBoxDayOffId.Text, TextBoxName.Text, TextBoxType.Text, TextBoxStartDate.Text, TextBoxStartTime.Text, TextBoxEndDate.Text, TextBoxEndTime.Text,);
        DayOff dayOff = DayOffUtility.GetDayOff(id);
        dayOff.Approval = "true";
        dayOff.RejectionReason = TextBoxRejectionReason.Text;
        DayOffUtility.UpdateDayOffApproval(dayOff);
        Response.Redirect("~/3.DayOffList.aspx");
    }

    protected void ButtonRejection_Click(object sender, EventArgs e)
    {
        
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DayOff dayOff = DayOffUtility.GetDayOff(id);

Employee ep = Session["ep"] as Employee;
        MailMessage msg = new MailMessage();
        msg.To.Add("za416854@gmail.com");
        msg.From = new MailAddress("z416854@gmail.com",
            $"{ep.Name}", System.Text.Encoding.UTF8);
        msg.Subject = $"{ep.Name}的假單已被退件";
        //指定Subject的編碼  
        msg.SubjectEncoding = System.Text.Encoding.UTF8;

        msg.Body = $"您好，{dayOff.Name}，我是主管{ep.Name}。<br />假單已退件，請去假單詳情查看拒絕原因。";
        msg.IsBodyHtml = true;
        msg.BodyEncoding = System.Text.Encoding.UTF8;

        SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

        //寄件者的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential(
            "z416854@gmail.com", "chris710");

        //啟用 SSL
        MySmtp.EnableSsl = true;
        MySmtp.Send(msg);

        dayOff.Approval = "false";
        dayOff.RejectionReason = TextBoxRejectionReason.Text;
        DayOffUtility.UpdateDayOffApproval(dayOff);
        
        Response.Redirect("~/3.DayOffList.aspx");
    }
}