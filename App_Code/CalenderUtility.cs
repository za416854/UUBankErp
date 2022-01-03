using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for CalenderUtility
/// </summary>
public class CalenderUtility {

    public static int Add(mySchedule mySchedule) {
        DatabaseEntities db = new DatabaseEntities();
        db.mySchedules.Add(mySchedule);
        db.SaveChanges();

        mySchedule tempCalender = GetCalender(mySchedule);
        return tempCalender.Id;
    }

    public static List<mySchedule> GetCalenders() {
        DatabaseEntities db = new DatabaseEntities();

        List<mySchedule> calenderList = db.mySchedules.ToList();

        return calenderList;
    }

    public static mySchedule GetCalender(mySchedule schedule) {

        DatabaseEntities db = new DatabaseEntities();
        mySchedule ms = db.mySchedules.SingleOrDefault(s => s.UserName == schedule.UserName && s.EventName == schedule.EventName && s.StartDate == schedule.StartDate && s.StartTime == schedule.StartTime && s.EndDate == schedule.EndDate && s.EndTime == schedule.EndTime &&s.Loginer == schedule.Loginer);

        if(ms == null) {
            return null;
        } else {
            return ms;
        }
    }

    public static void Update(mySchedule mySchedule) {
        DatabaseEntities db = new DatabaseEntities();
        db.Entry(mySchedule).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }

    public static void Delete(int id) {
        DatabaseEntities db = new DatabaseEntities();
        mySchedule ms = db.mySchedules.SingleOrDefault(s=>s.Id==id);
        db.mySchedules.Remove(ms);
        db.SaveChanges();
    }
}