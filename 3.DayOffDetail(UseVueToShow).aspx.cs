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
        //if (Page.IsPostBack == false)
        //{
        //    int id = Convert.ToInt32(Request.QueryString["id"]);

        //    DayOff d = DayOffUtility.GetDayOff(id);

        //    TextBoxDayOffId.Text = d.DayOffId.ToString();
        //    TextBoxName.Text = d.Name;
        //    TextBoxType.Text = d.Type;
        //    TextBoxStartDate.Text = d.StartDate;
        //    TextBoxStartTime.Text = d.StartTime;
        //    TextBoxEndDate.Text = d.EndDate;
        //    TextBoxEndTime.Text = d.EndTime;
        //    TextBoxReason.Text = d.Reason;

        //    HiddenField1.Value = d.EvidencePic;
        //    ImageEvidencePic.ImageUrl = "~/kris/Images/" + d.EvidencePic;
        //    if (d.Approval == "False")
        //    {
        //        d.Approval = "尚未核准";
        //    }
        //    else
        //    {
        //        d.Approval = "已核准";
        //    }
        //    TextBoxApproval.Text = d.Approval;
        //    TextBoxRejectionReason.Text = d.RejectionReason;

        //}

        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            HumanMember human = HumanMemberUtility.GetHumanMemberById(id);
            DayOff d = DayOffUtility.GetDayOffByName(human.Name);
            if (d == null)
            {
                Response.Redirect("3.DayOffDetailApproval.aspx");
            }
            else
            {
            HiddenField1.Value = human.Name;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("3.DayOffSystemNew.aspx");
    }

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        MailMessage msg = new MailMessage();

        //到時候這邊再套員工資料庫的主管跟員工的email的值
        msg.To.Add("z416854@hotmail.com");
        msg.From = new MailAddress("za416854@gmail.com",
            $"{HiddenField1.Value}", System.Text.Encoding.UTF8);
        msg.Subject = $"{HiddenField1.Value}的假單刪除申請";
        //指定Subject的編碼  
        msg.SubjectEncoding = System.Text.Encoding.UTF8;

        msg.Body = $"您好，主管，我是{HiddenField1.Value}<br />由於一些變故，故取消申請請假，希望您幫我把假單取消掉，謝謝。";
        msg.IsBodyHtml = true;
        msg.BodyEncoding = System.Text.Encoding.UTF8;

        SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

        //寄件者的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential(
            "za416854@gmail.com", "");

        //啟用 SSL
        MySmtp.EnableSsl = true;
        MySmtp.Send(msg);
        Response.Redirect("Default.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("3.DayOffSystemNew.aspx");
    }
}
