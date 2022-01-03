using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeClub
/// </summary>
public class EmployeeClub
{
   
    

    

    public EmployeeClub()
    {

    }

    public EmployeeClub(int eMClubCount, int joinClubID, string joinClubName, int employeeId, string employeeName, string employeeDepartment, string joinClubReason, bool approve)
    {
        EMClubCount = eMClubCount;
        JoinClubID = joinClubID;
        JoinClubName = joinClubName;
        EmployeeId = employeeId;
        EmployeeName = employeeName;
        EmployeeDepartment = employeeDepartment;
        JoinClubReason = joinClubReason;
        Approve = approve;
    }

    public int EMClubCount { get; set; }
    public int JoinClubID { get; set; }
    public string JoinClubName { get; set; }
    public int EmployeeId { get; set; }
    public string EmployeeName { get; set; }
    public string EmployeeDepartment { get; set; }
    public string JoinClubReason { get; set; }
    public bool Approve { get; set; }
}