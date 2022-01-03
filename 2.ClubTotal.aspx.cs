using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_ClubTotal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Club> clublist = ClubUtility.GetClubList();
        rptclub.DataSource = clublist;
        rptclub.DataBind();
    }
}