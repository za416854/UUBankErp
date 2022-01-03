using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_ClubHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ep"] == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        else
        {
            Employee ep = Session["ep"] as Employee;
            List<Club> clublist = ClubUtility.GetClubList();
            Repeater1.DataSource = clublist;
            Repeater1.DataBind();
            Repeater2.DataSource = clublist;
            Repeater2.DataBind();
            txtEMId.Text = ep.ID.ToString();
            txtEmName.Text = ep.Name;
            txtId.Text = ep.ID.ToString();
            txtName.Text = ep.Name;
            txtDepartment.Text = ep.Department;
            txtQuitId.Text = ep.ID.ToString();
            txtQuitName.Text = ep.Name;
            txtQuitDepartment.Text = ep.Department;

        }




    }

    protected void btnApplication_Click(object sender, EventArgs e)
    {
        if (txtClubName.Text != string.Empty && txtEMId.Text != string.Empty &&
                        txtEmName.Text != string.Empty && txtScript.Text != string.Empty && txtDetailScript.Text != string.Empty)
        {
            HumanMember h = HumanMemberUtility.GetHumanMemberById(int.Parse(txtEMId.Text));
            if (h != null)
            {
                if (h.Name == txtEmName.Text)
                {
                    if (fulImage.HasFile)
                    {
                        TemporaryClub t = TemporaryClubUtility.GetClub(txtClubName.Text);
                        if (t == null)
                        {

                            Club tt = ClubUtility.GetClubByName(txtClubName.Text);
                            if (tt == null)
                            {
                                string fname = txtClubName.Text;
                                TemporaryClub club = new TemporaryClub()
                                {
                                    Id2 = 0,
                                    ClubName2 = txtClubName.Text,
                                    ClubFounderId2 = int.Parse(txtEMId.Text),
                                    ClubFounderName2 = txtEmName.Text,
                                    ClubScript2 = txtScript.Text,
                                    DetailClubScript2 = txtDetailScript.Text,
                                    PeopleCount2 = 1,
                                    ClubImage2 = fname,
                                    Approve2 = false
                                };
                                TemporaryClubUtility.AddClub(club);
                                string path = HttpContext.Current.Server.MapPath($"~/UUUBankClubImage/{fname}.jpg");
                                fulImage.SaveAs(path);
                                hfd1.Value = "ok";

                                txtClubName.Text = string.Empty;
                                txtEMId.Text = string.Empty;
                                txtEmName.Text = string.Empty;
                                txtScript.Text = string.Empty;
                                txtDetailScript.Text = string.Empty;
                            }
                            else
                            {
                                hfd1.Value = "exit";
                            }


                        }
                        else
                        {
                            hfd1.Value = "no";
                        }

                    }
                    else
                    {
                        hfd1.Value = "notyet";
                    }
                }
                else
                {
                    hfd1.Value = "nameerro";
                }

            }
            else
            {
                hfd1.Value = "iderro";
            }
        }
        else
        {
            hfd1.Value = "false";
        }

    }

    protected void btnJoin_Click(object sender, EventArgs e)
    {
        if (dplClub.SelectedItem.Text != string.Empty && txtId.Text != string.Empty && txtName.Text != string.Empty && txtDepartment.Text != string.Empty
            && txtReason.Text != string.Empty)
        {

            Club c = ClubUtility.GetClubByName(dplClub.SelectedItem.Text);
            HumanMember h = HumanMemberUtility.GetHumanMemberById(int.Parse(txtId.Text));
            if (h != null)
            {
                if (h.Name == txtName.Text && h.Department == txtDepartment.Text)
                {
                    EmployeeClub joinem = EmployeeClubUtility.GetEmployeeApply(Convert.ToInt32(txtId.Text), dplClub.SelectedItem.Text);

                    if (joinem == null)
                    {
                        EmployeeClubFormal formaljoinem = EmployeeClubFormalUtility.GetEmployeeApplyByTwoId(Convert.ToInt32(txtId.Text), c.Id);
                        if (formaljoinem == null)
                        {
                            EmployeeClub club = new EmployeeClub(0, c.Id, dplClub.SelectedItem.Text,
              Convert.ToInt32(txtId.Text), txtName.Text, txtDepartment.Text, txtReason.Text, false);

                            EmployeeClubUtility.AddEmployeeApply(club);
                            hfd2.Value = "ok";

                            //txtId.Text = "";
                            //txtName.Text = "";
                            //txtDepartment.Text = "";
                            txtReason.Text = "";
                        }
                        else
                        {
                            hfd2.Value = "exit";
                        }


                    }
                    else
                    {
                        hfd2.Value = "again";
                    }


                }
                else
                {
                    hfd2.Value = "emerro";
                }


            }
            else
            {
                hfd2.Value = "emerro";
            }

        }
        else
        {
            hfd2.Value = "false";
        }
    }

    protected void btnQuit_Click(object sender, EventArgs e)
    {
        if (dplQuitClub.SelectedItem.Text != string.Empty && txtQuitId.Text != string.Empty && txtQuitName.Text != string.Empty && txtQuitDepartment.Text != string.Empty
            && txtQuitReason.Text != string.Empty)
        {

            Club c = ClubUtility.GetClubByName(dplQuitClub.SelectedItem.Text);
            HumanMember h = HumanMemberUtility.GetHumanMemberById(int.Parse(txtQuitId.Text));
            if (h != null)
            {
                if (h.Name == txtQuitName.Text && h.Department == txtQuitDepartment.Text)
                {
                    QuitEmployeeClub Quitem = QuitEmployeeClubUtility.GetQuitEmployeeApplyByTwoId(Convert.ToInt32(txtQuitId.Text), c.Id);

                    if (Quitem == null)
                    {
                        EmployeeClubFormal formaljoinem = EmployeeClubFormalUtility.GetEmployeeApplyByTwoId(Convert.ToInt32(txtQuitId.Text), c.Id);
                        if (formaljoinem != null)
                        {
                            QuitEmployeeClub Quitclub = new QuitEmployeeClub(0, c.Id, dplQuitClub.SelectedItem.Text,
                Convert.ToInt32(txtQuitId.Text), txtQuitName.Text, txtQuitDepartment.Text, txtQuitReason.Text, false);

                            QuitEmployeeClubUtility.AddQuitEmployeeApply(Quitclub);
                            hfd3.Value = "ok";

                            //txtQuitId.Text = "";
                            //txtQuitName.Text = "";
                            //txtQuitDepartment.Text = "";
                            txtQuitReason.Text = "";
                        }
                        else
                        {
                            hfd3.Value = "exit";
                        }


                    }
                    else
                    {
                        hfd3.Value = "again";
                    }

                }
                else
                {
                    hfd3.Value = "emerro";
                }


            }
            else
            {
                hfd3.Value = "emerro";
            }

        }
        else
        {
            hfd3.Value = "false";
        }
    }
}