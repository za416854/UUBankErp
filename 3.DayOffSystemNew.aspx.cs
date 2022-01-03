using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clubtable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        HumanMember human = HumanMemberUtility.GetHumanMemberById(id);
        TextBoxName.Text = human.Name;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
            Response.Redirect("Default.aspx");
    }
}