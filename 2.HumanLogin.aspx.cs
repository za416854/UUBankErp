using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_HumanLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //LoginName.Text = "tony0800449@gmial.com";

        if (Session["ep"] == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        else
        {
            Employee ep = Session["ep"] as Employee;
            LoginName.Text = ep.Email;
        }
    }

    protected void btnSinin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {


            HumanMember employee = HumanMemberUtility.GetHumanMember(LoginName.Text, LoginPw.Text);

            if (employee != null)
            {
                Authority EmployeeAuthority = AuthorityUtility.GetAuthority(employee.ID, employee.Name);
                Session["HumanInfo"] = employee;
                Session["HumanAuthorityInfo"] = EmployeeAuthority;
                
                if (EmployeeAuthority.Login == true && EmployeeAuthority.Search == false && EmployeeAuthority.EditDelete == false &&
                    EmployeeAuthority.AddEM == false && EmployeeAuthority.EditAU == false)
                {
                    hif2.Value = "ok";
                    Response.Redirect($"~/2.EditSlefPerson-Common.aspx?id={employee.ID}");
                  
                }
                else if (EmployeeAuthority.Login == false)
                {
                    lblErro.Text = "沒有權限登入!!!!!!請洽人資部門";
                    hif2.Value = "fales";
                }
                else
                {
                    Response.Redirect($"~/2.EditSlefPerson-Hight.aspx?id={employee.ID}");
                    hif2.Value = "fales";
                }
            }
            else
            {
                lblErro.Text = "密碼錯誤!!!";
                hif2.Value = "fales";
            }

        }
    }
}