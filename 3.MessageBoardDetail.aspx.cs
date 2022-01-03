using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clubtable : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            Message m = MessageUtility.GetMessageById(id);
            LabelFromName.Text = $"來自{m.FromName} 於 ";
            LabelToName.Text = $"對象：{m.ToName}";
            LabelTopic.Text = m.Topic;
            LabelContent.Text = m.MessageContent;
            LabelTime.Text = $"{m.Time}發佈";
            m.State = "true";
            MessageUtility.UpdateMessageState(m);
            Employee ep = Session["ep"] as Employee;
            if (ep.Name == m.FromName || ep.Name == m.ToName)
            {
                ButtonDelete.Visible = true;
            }
            else
            {
                ButtonDelete.Visible = false;
            }

            if (Session["ep"] == null)
            {
                Response.Redirect("~/1.login.aspx");
            }
            else
            {
                
                HyperLink1.NavigateUrl = $"~/3.MessageBoardAdd.aspx?id={ep.ID}";

            }


            //TextBoxDayOffId.Text = d.DayOffId.ToString();
            //TextBoxName.Text = d.Name;
            //TextBoxType.Text = d.Type;
            //TextBoxStartDate.Text = d.StartDate;
            //TextBoxStartTime.Text = d.StartTime;
            //TextBoxEndDate.Text = d.EndDate;
            //TextBoxEndTime.Text = d.EndTime;
            //TextBoxReason.Text = d.Reason;

            //HiddenField1.Value = d.EvidencePic;
            //ImageEvidencePic.ImageUrl = "~/kris/Images/" + d.EvidencePic;
            //if (d.Approval == "False")
            //{
            //    d.Approval = "尚未核准";
            //}
            //else
            //{
            //    d.Approval = "已核准";
            //}
            //TextBoxApproval.Text = d.Approval;
            //TextBoxRejectionReason.Text = d.RejectionReason;

        }

        //Repeater1.DataSource = messageList;
        //Repeater1.DataBind();
    }



    protected void ButtonRetuenToMBList_Click(object sender, EventArgs e)
    {
        Response.Redirect("3.MessageBoardList.aspx");
    }

    protected void ButtonRetuenToAddMessage_Click(object sender, EventArgs e)
    {

    }

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(Request.QueryString["id"]);
        MessageUtility.DeleteMessage(id);
        Response.Redirect("3.MessageBoardList.aspx");

    }
}