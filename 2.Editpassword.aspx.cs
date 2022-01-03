using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_Editpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            HumanMember m = Session["HumanInfo"] as HumanMember;
            SeachID.Text = m.ID.ToString();
        }
       
    }

    protected void btnSinin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
          
            if (dpl1.SelectedItem.Text == "Erp系統密碼")
            {
                HumanMember human = HumanMemberUtility.EidtErpPassword(int.Parse(SeachID.Text), OldPassword.Text);
                if (human != null)
                {
                    human.Password = NewPassword.Text;
                    HumanMemberUtility.HumanMemberEdit(human);
                    hid1.Value = "ok";
                    SeachID.Text = "";
                    OldPassword.Text = "";
                    NewPassword.Text = "";
                    NewPassword2.Text = "";
                    Session.Clear();
                    Response.Redirect("~/1.login.aspx");
                }
                else
                {
                    hid1.Value = "false";
                }
            }
            else
            {
                HumanMember human = HumanMemberUtility.EidtHumanMemberPassword(int.Parse(SeachID.Text), OldPassword.Text);
                if (human != null)
                {
                    human.Password2 = NewPassword.Text;
                    HumanMemberUtility.HumanMemberEdit(human);
                    hid1.Value = "ok";
                    SeachID.Text = "";
                    OldPassword.Text = "";
                    NewPassword.Text = "";
                    NewPassword2.Text = "";
                    Session["HumanInfo"] = null;
                    Session["HumanAuthorityInfo"] = null;
                    Response.Redirect("~/2.HumanLogin.aspx");
                }
                else
                {
                    hid1.Value = "false";
                }
            }
            
        }
    }
}