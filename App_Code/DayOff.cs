using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DayOffUtility
/// </summary>
public class DayOff
{
    public DayOff()
    {
        
    }

    public DayOff(int dayOffId, string name, string type, string startDate, string startTime, string endDate, string endTime, string dayOffTime, string evidencePic, string reason, string approval, string rejectionReason)
    {
        DayOffId = dayOffId;
        Name = name;
        Type = type;
        StartDate = startDate;
        StartTime = startTime;
        EndDate = endDate;
        EndTime = endTime;
        DayOffTime = dayOffTime;
        EvidencePic = evidencePic;
        Reason = reason;
        Approval = approval;
        RejectionReason = rejectionReason;
    }

    public int DayOffId { get; set; }
    public string Name { get; set; }
    public string Type { get; set; }
    public string StartDate { get; set; }
    public string StartTime { get; set; }
    public string EndDate { get; set; }
    public string EndTime { get; set; }
    public string DayOffTime { get; set; }
    public string EvidencePic { get; set; }
    public string Reason { get; set; }
    public string Approval { get; set; }
    public string RejectionReason { get; set; }
  
}