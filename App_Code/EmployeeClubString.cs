using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeClubString
/// </summary>
public class EmployeeClubString
{
    public EmployeeClubString(int eMClubCount, int joinClubID, string joinClubName, int employeeId, string employeeName, string employeeDepartment, string joinClubReason, string approve)
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
    public EmployeeClubString()
    {

    }

    public int EMClubCount { get; set; }
    public int JoinClubID { get; set; }
    public string JoinClubName { get; set; }
    public int EmployeeId { get; set; }
    public string EmployeeName { get; set; }
    public string EmployeeDepartment { get; set; }
    public string JoinClubReason { get; set; }
    public string Approve { get; set; }
}