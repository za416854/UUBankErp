using GemBox.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_EmployeeList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Authority AU = Session["HumanAuthorityInfo"] as Authority;
        if (AU == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        if (AU.EditDelete == false)
        {
            Response.Redirect("~/2.HumanLogin.aspx");
        }
        else
        {
            List<HumanMember> HumanList = HumanMemberUtility.GetHumanMembers();
            rptHuman.DataSource = HumanList;
            rptHuman.DataBind();
        }
        //List<HumanMember> HumanList = HumanMemberUtility.GetHumanMembers();
        //rptHuman.DataSource = HumanList;
        //rptHuman.DataBind();
    }

    public string GetDate(object o)
    {
        DateTime d = Convert.ToDateTime(o);

        return d.ToString("yyyy/MM/dd");
    }

   

    protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlId.SelectedItem.Text != "")
        {
            int id = int.Parse(ddlId.SelectedItem.Text);
            HumanMember human = HumanMemberUtility.GetHumanMemberById(id);
            txtEditEmail.Text = human.Email;
            txtEditPw.Text = human.Password;
            txtEditPw2.Text = human.Password2;
            txtEditName.Text = human.Name;
            ddlEditGender.SelectedItem.Text = human.Gender;
            txtEditBirth.Text = human.Birthday;
            txtEditAdress.Text = human.Address;
            txtEditCellPhone.Text = human.CellPhone;
            txtEditHomePhone.Text = human.HomePhone;
            txtEditClub.Text = human.Department;
            txtEditPosition.Text = human.Position;
            txtEditExtention.Text = human.Extension.ToString();
            txtEditHireDay.Text = human.HireDay;
            txtEditResginDay.Text = human.Resignday;
            txtEditSalary.Text = human.Salary.ToString();
        }
        else
        {
            txtEditEmail.Text = "";
            txtEditPw.Text = "";
            txtEditPw2.Text = "";
            txtEditName.Text = "";
            ddlEditGender.SelectedItem.Text = "";
            txtEditBirth.Text = "";
            txtEditAdress.Text = "";
            txtEditCellPhone.Text = "";
            txtEditHomePhone.Text = "";
            txtEditClub.Text = "";
            txtEditPosition.Text = "";
            txtEditExtention.Text = "";
            txtEditHireDay.Text = "";
            txtEditResginDay.Text = "";
            txtEditSalary.Text = "";
        }
       
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
      
        if (ddlId.SelectedItem.Text != "")
        {
            int id = int.Parse(ddlId.SelectedItem.Text);
            HumanMember human = HumanMemberUtility.GetHumanMemberById(id);
            human.Email = txtEditEmail.Text;
            human.Name = txtEditName.Text;
            human.Password2 = txtEditPw2.Text;
            human.Password = txtEditPw.Text;
            human.Name = txtEditName.Text;
            human.Gender = ddlEditGender.SelectedItem.Text;
            human.Birthday = txtEditBirth.Text;
            human.Address = txtEditAdress.Text;
            human.CellPhone = txtEditCellPhone.Text;
            human.HomePhone = txtEditHomePhone.Text;
            human.Department = txtEditClub.Text;
            human.Position = txtEditPosition.Text;
            human.Extension = int.Parse(txtEditExtention.Text);
            human.HireDay = txtEditHireDay.Text;
            human.Resignday = txtEditResginDay.Text;
            human.Salary = int.Parse(txtEditSalary.Text);
            if (ddlStop.SelectedItem.Text == "是")
            {
                Authority au = AuthorityUtility.GetAuthority(human.ID, human.Name);
                au.Search = false;
                au.Login = false;
                au.EditDelete = false;
                au.EditAU = false;
                au.AskForLeave = false;
                au.AddEM = false;
                au.Clock = false;
                au.ClubManager = false;
                au.ShopManager = false;
                AuthorityUtility.AuthorityEdit(au);
            }

            HumanMemberUtility.HumanMemberEdit(human);
            hid1.Value = "ok";
            if (fulImage.HasFile)
            {
                string ext = System.IO.Path.GetExtension(fulImage.FileName);
                string path = HttpContext.Current.Server.MapPath($"~/EmployeesImage/{human.ImageName}.jpg");
                fulImage.SaveAs(path);

            }
            

            //Response.Redirect("~/2.EmployeeList.aspx");

        }
        else
        {
            Response.Redirect("~/2.EmployeeList.aspx");
        }

    }



    protected void btnExcel_Click(object sender, EventArgs e)
    {
        string cn = Commons.DbConnecitonstring;
        SqlDataAdapter da = new SqlDataAdapter(
       "select *  from  Employee ",cn
       );
        DataTable dt = new DataTable("MyTable");
        da.Fill(dt);


        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("員工資料");
        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 0,
               StartRow = 0,
               ColumnHeaders = true
           });
        xlsx.Save(Server.MapPath(@"Output\EmployeeList.xlsx"));
        xlsx.Save(Response, "EmployeeList.xlsx");
        hid2.Value = "ok";
    }



    

   
}