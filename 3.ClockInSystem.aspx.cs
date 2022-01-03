using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class basic_elements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //打卡前這邊先設空字串，打卡之後再把打卡完成的字串丟進去
        Label1.Text = "";
        Label2.Text = "";
        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            HumanMember h = HumanMemberUtility.GetHumanMemberById(id);
            ClockIn c = ClockInUtility.GetClockInByName(h.Name);
            //if (c.ClockInTime != null)
            //{
            //    Label1.Text = $"{c.Name}您好，打卡上班成功，打卡時間為{c.ClockInTime}"; 
            //}
            //這邊到時候再換成登入的ID

            if (c != null)
            {
                Label1.Text = $"{c.Name}您好，打卡上班成功，打卡時間為{c.ClockInTime}";
                TextBoxDate.Text = DateTime.Now.ToString("yyyy年MM月dd日");
                TextBoxId.Text = h.ID.ToString();
                TextBoxName.Text = h.Name;
            }
            else
            {
                TextBoxDate.Text = DateTime.Now.ToString("yyyy年MM月dd日");
                TextBoxId.Text = h.ID.ToString();
                TextBoxName.Text = h.Name;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        HumanMember h = HumanMemberUtility.GetHumanMemberById(id);
        //這邊到時候再換成登入的ID
        TextBoxDate.Text = DateTime.Now.ToString("yyyy年MM月dd日");
        TextBoxId.Text = h.ID.ToString();
        TextBoxName.Text = h.Name;

        var query = from a in ClockInUtility.GetClockIns()
                    where a.Date == DateTime.Now.ToString("yyyy年MM月dd日") && a.Name == TextBoxName.Text
                    select a;
        if(query.Count() == 0)
        {
            Label1.Text = $"{h.Name}您好，打卡上班成功，打卡時間為{DateTime.Now}";
            ClockIn clockIn = new ClockIn(0, TextBoxName.Text, DateTime.Now.ToString("yyyy年MM月dd日"), DateTime.Now.ToString("HH:mm:ss"), "", "");
            ClockInUtility.AddClockIn(clockIn);
        }
        else
        {
            Label2.Text = $"{h.Name}您好，已經重複打卡";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        HumanMember h = HumanMemberUtility.GetHumanMemberById(id);
        string name = h.Name;
        ClockIn c = ClockInUtility.GetClockInByName(name);
        if (c == null)
        {
            TextBoxDate.Text = DateTime.Now.ToString("yyyy年MM月dd日");
            TextBoxName.Text = h.Name;
            TextBoxId.Text = h.ID.ToString();
            Label1.Text = $"{h.Name}您好，請先刷上班卡";
        }
        else
        {
            TextBoxDate.Text = DateTime.Now.ToString("yyyy年MM月dd日");
            TextBoxName.Text = c.Name;
            TextBoxId.Text = h.ID.ToString();
            ClockIn clockIn = new ClockIn(c.ClockInId, c.Name, DateTime.Now.ToString("yyyy年MM月dd日"), c.ClockInTime, DateTime.Now.ToString("HH:mm:ss"), "");
            ClockInUtility.UpdateClockIn(clockIn);
            Label1.Text = $"{c.Name}您好，打卡上班成功，打卡時間為{c.ClockInTime}";
            Label2.Text = $"{c.Name}您好，打卡下班成功，打卡時間為{DateTime.Now.ToString("HH:mm:ss")}";
        }


    }
}