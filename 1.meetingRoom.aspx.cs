using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _1_meetingRoom : System.Web.UI.Page
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
        louisUtility.ExpiredMeeting();
        Response.Redirect("~/1.smallRoom.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/1.bigRoom.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Employee ep = Session["ep"] as Employee;
        if (ep.Name != "李路亞" && ep.Password !="123")
        {
            HiddenField1.Value = "noUser";
        }
        else
        {
            Response.Redirect($"~/1.meetingConfirm.aspx?id={ep.ID}");
        }

    }
}