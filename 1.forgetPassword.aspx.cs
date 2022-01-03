using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _1_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            HiddenField1.Value = "";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Employee loginEmployee = louisUtility.ForgetPassword(exampleInputEmail.Value, exampleInputName.Value,exampleInputMobile.Value);
        if (loginEmployee == null)
        {
            HiddenField1.Value = "noUser";
        }
        else
        {
            MailMessage msg = new MailMessage();

            msg.To.Add("za416854@gmail.com");
            msg.From = new MailAddress("a80665308@gmail.com",
                "Louis", System.Text.Encoding.UTF8);
            msg.Subject = "myPassword";
            //指定Subject的編碼  
            msg.SubjectEncoding = System.Text.Encoding.UTF8;

            msg.Body = "您的密碼為: " + loginEmployee.Password;
            msg.IsBodyHtml = true;
            msg.BodyEncoding = System.Text.Encoding.UTF8;

            SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

            //寄件者的帳號密碼
            MySmtp.Credentials = new System.Net.NetworkCredential(
                "a80665308@gmail.com", "!@@Cc80665308");

            //啟用 SSL
            MySmtp.EnableSsl = true;
            MySmtp.Send(msg);

            HiddenField1.Value = "getUser";
        }



    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect($"~/1.login.aspx");
    }
}