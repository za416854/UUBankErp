using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using GemBox.Spreadsheet;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

   [WebMethod]
    public List<Employee> GetEmployees()
    {
        DatabaseEntities db = new DatabaseEntities();
        List<Employee> empList = db.Employees.ToList();
        return empList;
    }

    [WebMethod]
    public EmployeePartial GetEmployeeByID(int id)
    {
        DatabaseEntities db = new DatabaseEntities();
        Employee ep = db.Employees.SingleOrDefault(s => s.ID == id);
        EmployeePartial epPartial = new EmployeePartial()
        {
            ID = ep.ID,
            Name = ep.Name,
            Birthday = ep.Birthday.ToString("yyyy/MM/dd"),
            Email = ep.Email,
            Department = ep.Department,
            Extension = ep.Extension,
            Gender = ep.Gender,
            HireDay = ep.HireDay.ToString("yyyy/MM/dd"),
            ImageName = ep.ImageName,
            Position = ep.Position
        };
        return epPartial;
    }

    [WebMethod]
    public List<mySchedule> GetCalenders(string loginer)
    {
        List<mySchedule> calenders = CalenderUtility.GetCalenders().Where(c => c.Loginer == loginer).ToList();

        return calenders;
    }

    [WebMethod]
    public int AddCalender(string userName, string eventName,
                            string startDate, string startTime,
                            string endDate, string endTime, string isAllDay, string loginer)
    {

        mySchedule mySchedule = new mySchedule(
            0, userName, eventName, startDate, startTime, endDate, endTime, isAllDay, loginer
        );

        return CalenderUtility.Add(mySchedule);
    }

    [WebMethod]
    public void Update(int id, string userName, string eventName,
                       string startDate, string startTime,
                       string endDate, string endTime, string isAllDay, string loginer)
    {

        mySchedule mySchedule = new mySchedule(
            id, userName, eventName, startDate, startTime, endDate, endTime, isAllDay, loginer
        );
        //mySchedule = CalenderUtility.GetCalender(mySchedule);
        //return mySchedule;
        CalenderUtility.Update(mySchedule);
    }

    [WebMethod]
    public void Delete(int id)
    {
        CalenderUtility.Delete(id);
    }

    [WebMethod]
    public MeetingRoom GetMyMeeting(string name)
    {
        DatabaseEntities db = new DatabaseEntities();
        MeetingRoom mr = db.MeetingRooms.SingleOrDefault(m => m.UserName == name);
        return mr;
    }

    [WebMethod]
    public List<string> GetAllSmallMeeting()
    {
        DatabaseEntities db = new DatabaseEntities();
        List<MeetingRoom> mtList = db.MeetingRooms.Where(m => m.Room == "小會議室").ToList();
        List<string> sList = new List<string>();
        foreach (var item in mtList)
        {
            string s = item.Date + item.Time;

            sList.Add(s);
        }
        return sList;
    }

    [WebMethod]
    public List<string> GetAllbigMeeting()
    {
        DatabaseEntities db = new DatabaseEntities();
        List<MeetingRoom> mtList = db.MeetingRooms.Where(m => m.Room == "國際會議室" && m.Approval == "審核通過").ToList();
        List<string> sList = new List<string>();
        foreach (var item in mtList)
        {
            string s = item.Date + item.Time;

            sList.Add(s);
        }
        return sList;
    }


    [WebMethod]
    public void MeetingResult(string[] strAry)
    {

        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        SqlCommand cmd = new SqlCommand("update MeetingRoom set Approval=@approval where UserName=@userName", cn);

        foreach (var item in strAry)
        {
            string userName = item.Split('-')[0];
            string approval = item.Split('-')[1];
            cmd.Parameters.AddWithValue("@userName", userName);
            cmd.Parameters.AddWithValue("@approval", approval);
        }
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();


    }

    [WebMethod]
    public void AddToDoList(string userName, string myEvent)
    {
        DatabaseEntities db = new DatabaseEntities();
        ToDoList td = new ToDoList(0, userName, myEvent) { };

        db.ToDoLists.Add(td);
        db.SaveChanges();

    }

    [WebMethod]
    public List<ToDoList> GetMyToDoList(string userName)
    {
        DatabaseEntities db = new DatabaseEntities();
        List<ToDoList> tList = db.ToDoLists.Where(t => t.UserName == userName).ToList();

        return tList;
    }

    [WebMethod]
    public void DeleteMyToDo(string userName, string myEvent)
    {
        DatabaseEntities db = new DatabaseEntities();
        ToDoList td = db.ToDoLists.SingleOrDefault(t => t.UserName == userName && t.myEvent == myEvent);
        db.ToDoLists.Remove(td);
        db.SaveChanges();
    }

    [WebMethod]
    public void Logout()
    {
        //Session.Clear();
    }


    [WebMethod]
    public Club GetMyClub(string userName)
    {

        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        SqlDataAdapter da = new SqlDataAdapter("select * from Club where ClubFounderName=@userName", cn);
        da.SelectCommand.Parameters.AddWithValue("@userName", userName);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DataRow row = dt.Rows[0];
        return new Club(Convert.ToInt32(row[0]), row[1].ToString(), Convert.ToInt32(row[2]), row[3].ToString(), row[4].ToString(), row[5].ToString(), Convert.ToInt32(row[6]), Convert.ToInt32(row[7]), row[8].ToString());

    }

    [WebMethod]
    public ClockIn GetMyClock(string userName)
    {

        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        SqlDataAdapter da = new SqlDataAdapter("select * from ClockIn where Name=@userName", cn);
        da.SelectCommand.Parameters.AddWithValue("@userName", userName);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DataRow row = dt.Rows[0];
        return new ClockIn(Convert.ToInt32(row[0]), row[1].ToString(), row[2].ToString(), row[3].ToString(), row[4].ToString(), row[5].ToString());
    }

    [WebMethod]
    public Sponsor GetMyCart(int id)
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        SqlDataAdapter da = new SqlDataAdapter("select * from Sponsors where Id=@id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DataRow row = dt.Rows[0];

        return new Sponsor(Convert.ToInt32(row[0]), Convert.ToInt32(row[1]), row[2].ToString(), Convert.ToInt32(row[3]), Convert.ToInt32(row[4]), row[5].ToString(),
                            row[6].ToString(), row[7].ToString(), row[8].ToString(), row[9].ToString(), row[10].ToString(),Convert.ToBoolean(row[11]), Convert.ToInt32(row[12]), row[13].ToString());
    }






    [WebMethod]
    public void GetDayOff(string name, string dropDownList1, string startDate, string dropDownList2, string endDate, string dropDownList3, string fileUpload1, string textBoxReason)
    {
        string fileName = Path.GetFileNameWithoutExtension(fileUpload1);
        string sideFileName = Path.GetExtension(fileUpload1);
        //string path = HttpContext.Current.Server.MapPath($"{name}{ext}");
        string path = $"{fileName}{sideFileName}";
        string countTime = DayOffUtility.GetDayOffTime(startDate, dropDownList2, endDate, dropDownList3);
        DayOff dayOff = new DayOff(0, name, dropDownList1, startDate, dropDownList2, endDate, dropDownList3, countTime, path, textBoxReason, "", "");
        DayOffUtility.AddDayOff(dayOff);
        //FileUpload1.SaveAs(path);
    }


    [WebMethod]
    public List<DayOff> DayOffs()
    {
        return DayOffUtility.GetDayOffs();
    }

    [WebMethod]
    public DayOff GetDayOffInfo(int id)
    {
        return DayOffUtility.GetDayOff(id);
    }
    [WebMethod]
    public DayOff GetDayOffHumanById(int id)
    {
        HumanMember h = HumanMemberUtility.GetHumanMemberById(id);
        return DayOffUtility.GetDayOffByName(h.Name);

    }
    [WebMethod]
    public void UpdateMultipleClockInApproval(string[] id)
    {
        List<string> stringList = id.ToList();
        List<int> intList = stringList.ConvertAll(new Converter<string, int>(ClockInUtility.TransToInt));
        foreach (var item in intList)
        {
            ClockIn clockIn = ClockInUtility.GetClockInById(item);
            clockIn.Approval = "true";
            ClockInUtility.UpdateClockInApproval(clockIn);
        }
    }
    [WebMethod]
    public void GetMessage(string fromName, string toName, string topic, string messageContent, string time, string state)
    {
        //Convert.ToInt32(fromId);
        //Convert.ToInt32(toId);
        Message message = new Message(0, fromName, toName, topic, messageContent, time, state);
        MessageUtility.AddMessage(message);
    }

    [WebMethod]
    public Sponsor GetProduct(int waterid)
    {
        return ProductUtility.GetProduct(waterid);
    }
    [WebMethod]
    public List<Sponsor> WGetcheckProducts()
    {
        return ProductUtility.GetcheckProducts();
    }
    //[WebMethod]
    //public List<Employee> GetallMember()
    //{
    //    return MemberUtility.GetMembers();
    //}
    [WebMethod]
    public void ChangePDcheckA(string[] Waterid)
    {
        foreach (var item in Waterid)
        {
            int a = int.Parse(item);

            Sponsor p = ProductUtility.GetProduct(a);
            p.Check = "Agree";
            ProductUtility.UpdateProduct(p);
        }
    }
    [WebMethod]
    public void ChangePDcheckR(string[] Waterid, string text)
    {
        foreach (var item in Waterid)
        {
            int a = int.Parse(item);

            Sponsor p = ProductUtility.GetProduct(a);
            p.Check = "Reject";
            p.RJresult = text;
            ProductUtility.UpdateProduct(p);
        }
    }


    [WebMethod]
    public string GogoSponsor(int waterid)
    {
        Sponsor S = ProductUtility.GetProduct(waterid);
        if (S.PDCountNow >= S.LimitCount)
        {
            S.PDStatus = true;
            ProductUtility.UpdateProduct(S);
            return "Success";
        }
        else
        {
            return "Fail";
        };




    }
    [WebMethod]
    public void Downloadlist(int Waterid)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select Sponsors.Waterid,Sponsors.ProductName,Sponsors.Price,Sponsors.PDCountNow,Cart.Id,Cart.Count,Employee.Name,Employee.Email,Employee.CellPhone from Cart INNER JOIN Sponsors on Cart.Waterid = Sponsors.Waterid RIGHT JOIN Employee on Cart.Id = Employee.ID where Sponsors.Waterid=@id",
            @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
            );
        da.SelectCommand.Parameters.AddWithValue("@id", Waterid);
        DataTable dt = new DataTable("MyTable");
        da.Fill(dt);


        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("sheet1");
        mySheet.InsertDataTable(dt,
            new InsertDataTableOptions()
            {
                StartColumn = 1,
                StartRow = 1,
                ColumnHeaders = true
            });
        //存路徑 AJAX
        //xlsx.Save(Server.MapPath(@"Output\test3.xlsx"));

        xlsx.Save(HttpContext.Current.Response, "Buyerlist.xlsx");
    }
    [WebMethod]
    public void DeleteCart(int CId)
    {
        CartUtility.DeleteCartByCId(CId);
    }



}
