using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _1_meetingConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ep"]==null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        Employee ep = Session["ep"] as Employee;
        Repeater1.DataSource = louisUtility.GetAllSchedule(ep.Name);
        Repeater1.DataBind();

    }
}