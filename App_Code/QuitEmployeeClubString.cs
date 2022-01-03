using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for QuitEmployeeClubString
/// </summary>
public class QuitEmployeeClubString
{
    public QuitEmployeeClubString(int quitEMClubCount, int quitClubID, string quitClubName, int employeeId, string employeeName, string employeeDepartment, string quitClubReason, string approve)
    {
        QuitEMClubCount = quitEMClubCount;
        QuitClubID = quitClubID;
        QuitClubName = quitClubName;
        EmployeeId = employeeId;
        EmployeeName = employeeName;
        EmployeeDepartment = employeeDepartment;
        QuitClubReason = quitClubReason;
        Approve = approve;
    }

    public QuitEmployeeClubString()
    {

    }

    public int QuitEMClubCount { get; set; }
    public int QuitClubID { get; set; }
    public string QuitClubName { get; set; }
    public int EmployeeId { get; set; }
    public string EmployeeName { get; set; }
    public string EmployeeDepartment { get; set; }
    public string QuitClubReason { get; set; }
    public string Approve { get; set; }
}