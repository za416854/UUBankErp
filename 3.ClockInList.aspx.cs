using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clubtable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<ClockIn> clockInList = ClockInUtility.GetClockIns();
        foreach (var item in clockInList)
        {
            if (item.Approval == false.ToString())
            {
                item.Approval = "未審核";
            }
            else
            {
                item.Approval = "已審核";
            }
        }
        Repeater1.DataSource = clockInList;
        Repeater1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}