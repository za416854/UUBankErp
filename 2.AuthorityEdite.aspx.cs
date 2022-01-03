using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2_AuthorityEdite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            var id = Request.QueryString["id"];
            var name = Request.QueryString["name"];
            Authority human = AuthorityUtility.GetAuthority(int.Parse(id), name);
            checkLogin.Checked = human.Login;
            checkSearch.Checked = human.Search;
            checkAdd.Checked = human.AddEM;
            checkEditDelete.Checked = human.EditDelete;
            checkEdit.Checked = human.EditAU;
            checkAskForLeave.Checked = human.AskForLeave;
            checkClock.Checked = human.Clock;
            checkShop.Checked = human.ShopManager;
            CheckClub.Checked = human.ClubManager;
            CheckMeetingRoom.Checked = human.MeetingRoom;
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        var id = Request.QueryString["id"];
        var name = Request.QueryString["name"];
        Authority human = AuthorityUtility.GetAuthority(int.Parse(id), name);
        human.Login = checkLogin.Checked;
        human.Search = checkSearch.Checked;
        human.AddEM = checkAdd.Checked;
        human.EditDelete = checkEditDelete.Checked;
        human.EditAU = checkEdit.Checked;
        human.AskForLeave = checkAskForLeave.Checked;
        human.Clock = checkClock.Checked;
        human.ShopManager = checkShop.Checked;
        human.ClubManager = CheckClub.Checked;
        human.MeetingRoom = CheckMeetingRoom.Checked;
        AuthorityUtility.AuthorityEdit(human);
        hid1.Value = "ok";

    }
}