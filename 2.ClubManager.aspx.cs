using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_ClubManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ep"] == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        Authority aa = Session["au"] as Authority;
        if (aa.ClubManager == false)
        {
            Response.Redirect("~/2.ClubHome.aspx");
        }
    }
}