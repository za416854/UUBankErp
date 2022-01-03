<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        int clockInId = Convert.ToInt32(Request.QueryString["id"]);
        ClockIn c = ClockInUtility.GetClockInById(clockInId);


        if (Page.IsPostBack == false)
        {
            if (c.Approval == false.ToString())
            {
                HiddenField1.Value = "true";
                c.Approval = HiddenField1.Value;
                ClockInUtility.UpdateClockInApproval(c);
                Response.Redirect("3.ClockInList.aspx");
            }
            else
            {
                Response.Write("已經審核通過，請勿重複審核");
            }
        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Requirement jQuery-->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="kris/jQuery-Date-Time-Picke-Plugin-Simple-Datetimepicker/jquery.simple-dtpicker.js"></script>
    <link href="kris/jQuery-Date-Time-Picke-Plugin-Simple-Datetimepicker/jquery.simple-dtpicker.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </form>
</body>
<script> 
    setTimeout(function myfunction() {
        window.location.href = "/3.ClockInList.aspx";
    }, 1300)

</script>

</html>
