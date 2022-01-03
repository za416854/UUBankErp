using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_ClubOnlyHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        Employee ep = (Employee)(Session["ep"]);
        EmployeeClubFormal EMF = EmployeeClubFormalUtility.GetEmployeeApplyByTwoId(ep.ID, id);
        if (ep == null)
        {
            Response.Redirect("~/1.login.aspx");
        }
        if (EMF == null)
        {
            Response.Redirect("~/2.ClubHome.aspx");
        }
        Club club = ClubUtility.GetClub(id);
        lblClubName.Text = $"歡迎來到{ club.ClubName}";


        hfdClubId.Value = id.ToString();

        hfdUserName.Value = EMF.EmployeeName;

        List<EmployeeClubFormal> emflist = EmployeeClubFormalUtility.GetEmployeeApplyListByClubId(id);
        rptclubEM.DataSource = emflist;
        rptclubEM.DataBind();
    }
}