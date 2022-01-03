using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditSlefPerson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
        HumanMember em = (HumanMember)Session["HumanInfo"];
        if (em == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        Name.Text = em.Name;
        Gender.Text = em.Gender;
        Email.Text = em.Email;
        Club.Text = em.Department;
        Position.Text = em.Position;
        Extension.Text = em.Extension.ToString();
        HireDate.Text = em.HireDay;
        Salary.Text = em.Salary.ToString();
        myDatepicker.Text = em.Birthday;
        myaddress.Text = em.Address;
        phone.Text = em.CellPhone;
        homephone.Text = em.HomePhone;
        lblHello.Text = $"{em.Name} 您好!";
        hifID.Value =  em.ID.ToString();
        Random myObject = new Random();
        int a = myObject.Next(1, 500);
        EmployeeImage.ImageUrl = $"~/EmployeesImage/{em.ImageName}.jpg?id={a}";


        Authority Au = (Authority)Session["HumanAuthorityInfo"];
        if (Au.Search == false)
        {
            //lblSearch.Visible = false;
            lbtnSearch.Visible = false;
        }
        if (Au.AddEM == false)
        {
            //lblEmployeeAdd.Visible = false;
            lbtnEmployeeAdd.Visible = false;
        }
        if (Au.EditDelete == false)
        {
            //lblEditDelete.Visible = false;
            lbtnEditDelete.Visible = false;
        }
        if (Au.EditAU == false)
        {
            //lbllbtnEditAu.Visible = false;
            lbtnEditAu.Visible = false;
        }
        
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session["HumanInfo"] = null;
        Response.Redirect("~/2.HumanLogin.aspx");
    }
}