using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_register : System.Web.UI.Page
{
    
    protected void btnSinin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            HumanMember human = HumanMemberUtility.SelectPassword2(Convert.ToInt32(SeachId.Text), SearchEmail.Text);
            if (human != null)
            {
                hif2.Value = "ok";
                hif1.Value = $"已補發至您的Gmail";

                //smtp寄信要到下面網址把[Allow less secure apps]設定為ON
                //https://myaccount.google.com/lesssecureapps?pli=1

                MailMessage msg = new MailMessage();

                msg.To.Add("tony01551251@gmail.com");
                msg.From = new MailAddress("tony01551251@gmail.com",
                    "tony", System.Text.Encoding.UTF8);
                msg.Subject = "UUUBANK人事系統密碼補發" ;
                //指定Subject的編碼  
                msg.SubjectEncoding = System.Text.Encoding.UTF8;

                msg.Body = $"您的人事系統密碼為:{human.Password2}";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

                //寄件者的帳號密碼
                MySmtp.Credentials = new System.Net.NetworkCredential(
                   "tony01551251@gmail.com", "tt0930698813");

                //啟用 SSL
                MySmtp.EnableSsl = true;
                MySmtp.Send(msg);

            }
            else
            {
                hif2.Value = "false";
                lblEnd.Text = "員工編號或Mail錯誤!!!";
            }

        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}