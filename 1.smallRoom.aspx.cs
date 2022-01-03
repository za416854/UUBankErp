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
            if (Session["ep"] == null)
            {
                Response.Redirect("~/1.login.aspx");
            }
            else
            {
                Employee ep = Session["ep"] as Employee;
                TextBox1.Text = ep.Name;
            }

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Employee ep = Session["ep"] as Employee;
        if (Hidden2.Value == "" || Hidden3.Value == "")
        {
            dateValidate.Visible = true;
            timeValidate.Visible = true;
        }
        else
        {
            if (louisUtility.RepeatPerson(ep.Name) == null)
            {
                dateValidate.Visible = false;
                timeValidate.Visible = false;
                louisUtility.AddMeeting(
                            TextBox1.Text,
                            "小會議室",
                            Hidden2.Value,
                            Hidden3.Value,
                            txtReason.Text,
                            "審核通過"
                            );
                Response.Redirect($"~/1.profile.aspx?id={ep.ID}");
            }
            else
            {
                repeatAlert.Visible = true;
            }

        }

    }
}