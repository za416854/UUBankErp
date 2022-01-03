using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_EmployeeAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblWarning.Text = "";
        if (Page.IsPostBack == false)
        {
            HumanMember h = (HumanMember)Session["HumanInfo"];
            if (h == null)
            {
                Response.Redirect("~/1.login.aspx");
            }
            Authority A = (Authority)Session["HumanAuthorityInfo"];
            if (A.AddEM == false && A.Search == false)
            {
                Response.Redirect("~/2.EditSlefPerson-Common.aspx");
            }
            else if (A.AddEM == false && A.Search == true)
            {
                Response.Redirect("~/2.EditSlefPerson-Hight.aspx");
            }
            if (A.EditDelete == false && A.EditAU == false)
            {
                CheckEdtiDelete.Visible = false;
                hidEMedit.Value = "false";
                CheckEditAU.Visible = false;
                hidAUedit.Value = "false";
            }
            if (A.EditDelete == false)
            {
                CheckEdtiDelete.Visible = false;
                CheckShopManager.Visible = false;
                CheckClub.Visible = false;
                hidEMedit.Value = "false";
            }
            if (A.EditAU == false)
            {
                CheckEditAU.Visible = false;
                hidAUedit.Value = "false";
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            HumanMember h = HumanMemberUtility.CheckEmail(txtEmail.Text);
            if (h == null)
            {

                hid1.Value = "ok";

                if (fulImage.HasFile)
                {
                    string fname = txtEmail.Text + txtName.Text;
                    HumanMember human = new HumanMember(0, txtEmail.Text, txtPW.Text, txtPW2.Text,
                     txtName.Text, dropGender.SelectedItem.Text, txtBirth.Text, txtAdress.Text, txtCellPhone.Text,
                     txtHomePhone.Text, txtClub.Text, txtPosition.Text, txtHireDate.Text,null, Convert.ToInt32(txtMoney.Text), Convert.ToInt32(txtExtention.Text),
                     fname);

                    HumanMemberUtility.HumanMemberAdd(human);

                    Authority authority = new Authority(0, txtName.Text, checkLogin.Checked, CheckSearch.Checked, CheckAddEM.Checked, CheckEdtiDelete.Checked, CheckEditAU.Checked, CheckaskForLeave.Checked, CheckClock.Checked, CheckShopManager.Checked, CheckClub.Checked,CheckMeetingRoom.Checked);
                    AuthorityUtility.AuthorityAdd(authority);

                    string ext = System.IO.Path.GetExtension(fulImage.FileName);
                    string path = HttpContext.Current.Server.MapPath($"~/EmployeesImage/{fname}.jpg");
                    fulImage.SaveAs(path);
                    lblWarning.Text = "員工資料已新增";
                    hid1.Value = "ok";
                    txtEmail.Text = "";
                    txtName.Text = "";
                    txtBirth.Text = "";
                    txtAdress.Text = "";
                    txtCellPhone.Text = "";
                    txtHomePhone.Text = "";
                    txtClub.Text = "";
                    txtPosition.Text = "";
                    txtHireDate.Text = "";
                    txtMoney.Text = "";
                    txtExtention.Text = "";
                }
                else
                {
                    lblWarning.Text = "未上傳檔案";
                    hid1.Value = "notyet";

                }

            }
            else if (h != null && !fulImage.HasFile)
            {
                lblWarning.Text = ":Email不可以使用以及檔案未上傳檔案";
                hid1.Value = "false2";
            }

            else
            {
                lblWarning.Text = ":Email不可以使用";
                hid1.Value = "false";
            }



        }
    }



    //protected void btnCheck_Click(object sender, EventArgs e)
    //{

    //    if (txtEmail.Text == string.Empty)
    //    {
    //        lblCheck.Text = "請輸入Email!!";
    //    }
    //    else
    //    {
    //        HumanMember h = HumanMemberUtility.CheckEmail(txtEmail.Text);
    //        if (h == null)
    //        {
    //            lblCheck.Text = ":Email可以使用";

    //        }
    //        else
    //        {
    //            lblCheck.Text = ":Email不可以使用";
    //        }
    //    }



    //}



    //protected void btnDemo_Click(object sender, EventArgs e)
    //{
    //    txtEmail.Text = "tonyUUUU@gmial.com";
    //    txtName.Text = "tonychen";
    //    txtBirth.Text = "1993/12/14";
    //    txtAdress.Text = "台北市復興北路80號";
    //    txtCellPhone.Text = "0933557823";
    //    txtHomePhone.Text = "02-2223-0806";
    //    txtClub.Text = "人資部門";
    //    txtPosition.Text = "人資長";
    //    txtExtention.Text = "235";
    //    txtHireDate.Text = "2006/12/24";
    //    txtMoney.Text = "500000";
    //}
}