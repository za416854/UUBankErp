using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Session["ep"] == null)
            {
                Response.Redirect("~/1.login.aspx");
            }
            else
            {
                Employee ep = Session["ep"] as Employee;
                HyperLink1.NavigateUrl = $"~/1.profile.aspx?id={ep.ID}";
                HyperLink3.NavigateUrl = $"~/1.mySchedule.aspx?id={ep.ID}";
                HyperLink4.NavigateUrl = $"~/1.meetingRoom.aspx?id={ep.ID}";
                HyperLink5.NavigateUrl = $"~/3.DayOffSystemNew.aspx?id={ep.ID}";
                HyperLink7.NavigateUrl = $"~/3.ClockInSystem.aspx?id={ep.ID}";
                HyperLink9.NavigateUrl = $"~/3.DayOffDetail(UseVueToShow).aspx?id={ep.ID}";
                HyperLink11.NavigateUrl = $"~/4.Product_Home_AJAX.aspx?id={ep.ID}";
                HyperLink12.NavigateUrl = $"~/4.Myshopcartlist.aspx?id={ep.ID}";
                HyperLink13.NavigateUrl = $"~/4.Iamsponsor_Main.aspx?id={ep.ID}";
                tiUser.InnerText = "您好! " + ep.Name;

                //Ted
                HyperLink14.NavigateUrl = $"~/4.manege_page.aspx?id={ep.ID}";

                Boolean Aut = Convert.ToBoolean(AuthorityUtility.GetAuthority(ep.ID, ep.Name).ShopManager);
                if (Aut)
                {
                    HyperLink6.Visible = true;
                    HyperLink8.Visible = true;
                    HyperLink14aaa.Visible = true;
                }
                else
                {
                    HyperLink6.Visible = false;
                    HyperLink8.Visible = false;
                      HyperLink14aaa.Visible = false;
                }
                
                Authority aa = Session["au"] as Authority;
                if (aa.ClubManager == false)
                {
                    ClubManger.Visible = false;
                    hidclubma.Value = "no";
                }

                if (aa.AskForLeave || aa.Clock)
                {
                    HyperLink6.Visible = true;
                    HyperLink8.Visible = true;

                }
                else
                {
                    HyperLink6.Visible = false;
                    HyperLink8.Visible = false;
                }

            }

        }

    }

    //protected void logout_Click(object sender, EventArgs e)
    //{
    //    Session.Clear();
    //    Response.Redirect("~/1.login.aspx");
    //}
}
