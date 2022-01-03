<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("3.ClockInList.aspx");
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

</html>
