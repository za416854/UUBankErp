using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for louisUtility
/// </summary>
public static class louisUtility
{
    public static Employee Login(string email, string password)
    {
        DatabaseEntities db = new DatabaseEntities();
        Employee ep = db.Employees.SingleOrDefault(s => s.Email == email && s.Password == password);

        return ep;
    }

    public static Employee ForgetPassword(string email, string name, string mobile)
    {
        DatabaseEntities db = new DatabaseEntities();
        Employee ep = db.Employees.SingleOrDefault(s => s.Email == email && s.Name == name && s.CellPhone == mobile);

        return ep;
    }

    public static void AddMeeting(string userName, string room, string date, string time, string reason, string approval)
    {
        DatabaseEntities db = new DatabaseEntities();
        MeetingRoom mr = new MeetingRoom(
             userName, room, date, time, reason, approval);
        db.MeetingRooms.Add(mr);
        db.SaveChanges();
    }

    public static MeetingRoom RepeatPerson(string userName)
    {
        DatabaseEntities db = new DatabaseEntities();
        MeetingRoom mr = db.MeetingRooms.SingleOrDefault(m => m.UserName == userName);
        return mr;
    }

    public static void DeleteMeeting(string name)
    {
        DatabaseEntities db = new DatabaseEntities();
        MeetingRoom mr = db.MeetingRooms.SingleOrDefault(m => m.UserName == name);
        db.MeetingRooms.Remove(mr);
        db.SaveChanges();
    }

    public static void ExpiredMeeting()
    {
        DatabaseEntities db = new DatabaseEntities();
        //DateTime dateTime = Convert.ToDateTime(temp);

        List<MeetingRoom> mrList = db.MeetingRooms.ToList();
        foreach (var item in mrList.ToArray())
        {
            string date = item.Date;
            DateTime d = Convert.ToDateTime(date);
            if (d<DateTime.Now)
            {
                db.MeetingRooms.Remove(item);
            }
        }
        db.SaveChanges();
    }

    public static List<MeetingRoom> GetAllUnconfirmedBigMeeting()
    {
        DatabaseEntities db = new DatabaseEntities();
        List<MeetingRoom> mtList = db.MeetingRooms.Where(m => m.Room == "國際會議室" && m.Approval == "待審核").ToList();

        return mtList;
    }

    public static List<MeetingRoom> GetAllMeeting()
    {
        DatabaseEntities db = new DatabaseEntities();
        List<MeetingRoom> mtList = db.MeetingRooms.ToList();

        return mtList;
    }

    public static List<mySchedule> GetAllSchedule(string loginer)
    {
        DatabaseEntities db = new DatabaseEntities();
        List<mySchedule> sList = db.mySchedules.Where(s => s.Loginer == loginer).ToList();

        return sList;
    }
}