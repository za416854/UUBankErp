using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class profile : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string id = Request.QueryString["id"];
            if (id == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            if (Session["ep"] == null)
            {
                Response.Redirect("~/1.login.aspx");
            }
            else
            {
                Employee ep = Session["ep"] as Employee;
                HiddenField1.Value = ep.Name;
                HiddenField2.Value = ep.Name;
                HiddenField3.Value = ep.Name;
                HiddenField4.Value = ep.ID.ToString();
                if (louisUtility.RepeatPerson(ep.Name) == null)
                {
                    Button1.Visible = false;
                }
                else
                {
                    Button1.Visible = true;
                }



            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Employee ep = Session["ep"] as Employee;
        louisUtility.DeleteMeeting(ep.Name);
        Button1.Visible = false;

    }
}