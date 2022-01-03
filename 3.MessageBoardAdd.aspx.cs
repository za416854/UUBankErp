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
        HiddenField1.Value = "";
        HiddenField2.Value = DateTime.Now.ToString();
        HiddenField3.Value = "0";
        int id = Convert.ToInt32(Request.QueryString["id"]);
        HumanMember human = HumanMemberUtility.GetHumanMemberById(id);
        TextBoxNumber.Text = human.ID.ToString();
        TextBoxName.Text = human.Name;
    }
}