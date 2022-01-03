using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClubCalenders
/// </summary>
public class ClubCalenders
{
    public ClubCalenders(int id, string userName, string eventName, string startDate, string startTime, string endDate, string endTime, string isAllDay, int clubID)
    {
        Id = id;
        UserName = userName;
        EventName = eventName;
        StartDate = startDate;
        StartTime = startTime;
        EndDate = endDate;
        EndTime = endTime;
        IsAllDay = isAllDay;
        ClubID = clubID;
    }
    public ClubCalenders()
    {

    }

    public int Id { get; set; }
    public string UserName { get; set; }
    public string EventName { get; set; }
    public string StartDate { get; set; }
    public string StartTime { get; set; }
    public string EndDate { get; set; }
    public string EndTime { get; set; }
    public string IsAllDay { get; set; }
    public int ClubID { get; set; }
}