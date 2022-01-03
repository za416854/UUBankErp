using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _1_login : System.Web.UI.Page
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

        Employee loginEmployee = louisUtility.Login(exampleInputEmail.Value, exampleInputPassword.Value);
        if (loginEmployee == null)
        {
            HiddenField1.Value = "noUser";
        }
        else
        {
            Authority au = AuthorityUtility.GetAuthority(loginEmployee.ID, loginEmployee.Name);
            if (au.Login == false)
            {
                HiddenField1.Value = "noau";
            }
            else
            {
                Session["ep"] = loginEmployee;
                Session["au"] = au;
                Response.Redirect($"~/Default.aspx?id={loginEmployee.ID}");
            }

        }



    }
}