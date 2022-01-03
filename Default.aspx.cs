using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
                HiddenField1.Value = ep.Name;

            }

        }
    }
}