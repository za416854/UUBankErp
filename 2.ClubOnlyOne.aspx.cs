using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_ClubOnlyOne : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id =  int.Parse(Request.QueryString["id"]);
            Club c = ClubUtility.GetClub(id);
            lblClubData.Text = c.ClubName;
            hfd1.Value = Request.QueryString["id"].ToString();
        }
    }
}