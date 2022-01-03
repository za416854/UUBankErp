using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClockIn
/// </summary>
public class ClockIn
{
    public ClockIn(int clockInId, string name, string date, string clockInTime, string clockOutTime, string approval)
    {
        ClockInId = clockInId;
        Name = name;
        Date = date;
        ClockInTime = clockInTime;
        ClockOutTime = clockOutTime;
        Approval = approval;
    }

    public int ClockInId { get; set; }
    public string Name { get; set; }
    public string Date { get; set; }
    public string ClockInTime { get; set; }
    public string ClockOutTime { get; set; }
    public string Approval { get; set; }
}