using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_EmployeeList_OnlySearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Authority AU = Session["HumanAuthorityInfo"] as Authority;
        if (AU == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        if (AU.Search == false)
        {
            Response.Redirect("~/2.HumanLogin.aspx");
        }

    }
}