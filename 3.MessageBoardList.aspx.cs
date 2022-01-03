using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clubtable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Message> temp = MessageUtility.GetMessages();
        List<Message> messageList = new List<Message>();
        Employee ep = Session["ep"] as Employee;

        foreach (var item in temp)
        {
            if(item.FromName == ep.Name || item.ToName == ep.Name || item.ToName == "所有人")
            {
                if (item.State == false.ToString())
                {
                    item.State = "未讀";
                }
                else
                {
                    item.State = "已讀";
                }
                messageList.Add(item);
            }
        }

        if(messageList != null)
        {
            Repeater1.DataSource = messageList;
            Repeater1.DataBind();
        }
        if (Page.IsPostBack == false)
        {
            if (Session["ep"] == null)
            {
                Response.Redirect("~/1.login.aspx");
            }
            else
            {
                HyperLink1.NavigateUrl = $"~/3.MessageBoardAdd.aspx?id={ep.ID}";
            }

        }
    }
}