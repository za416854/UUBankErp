using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeClubFormal
/// </summary>
public class EmployeeClubFormal
{
    public EmployeeClubFormal(int eMClubCount, int joinClubID, string joinClubName, int employeeId, string employeeName, string employeeDepartment, string joinClubReason)
    {
        EMClubCount = eMClubCount;
        JoinClubID = joinClubID;
        JoinClubName = joinClubName;
        EmployeeId = employeeId;
        EmployeeName = employeeName;
        EmployeeDepartment = employeeDepartment;
        JoinClubReason = joinClubReason;
    }

    public EmployeeClubFormal()
    {

    }

    public int EMClubCount { get; set; }
    public int JoinClubID { get; set; }
    public string JoinClubName { get; set; }
    public int EmployeeId { get; set; }
    public string EmployeeName { get; set; }
    public string EmployeeDepartment { get; set; }
    public string JoinClubReason { get; set; }
}