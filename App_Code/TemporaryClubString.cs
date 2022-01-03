using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TemporaryClubString
/// </summary>
public class TemporaryClubString
{
    public TemporaryClubString(int id2, string clubName2, int clubFounderId2, string clubFounderName2, string clubScript2, string detailClubScript2, int peopleCount2, string clubImage2, string approve2)
    {
        Id2 = id2;
        ClubName2 = clubName2;
        ClubFounderId2 = clubFounderId2;
        ClubFounderName2 = clubFounderName2;
        ClubScript2 = clubScript2;
        DetailClubScript2 = detailClubScript2;
        PeopleCount2 = peopleCount2;
        ClubImage2 = clubImage2;
        Approve2 = approve2;
    }
    public TemporaryClubString()
    {

    }

    public int Id2 { get; set; }
    public string ClubName2 { get; set; }
    public int ClubFounderId2 { get; set; }
    public string ClubFounderName2 { get; set; }
    public string ClubScript2 { get; set; }
    public string DetailClubScript2 { get; set; }
    public int PeopleCount2 { get; set; }
    public string ClubImage2 { get; set; }
    public string Approve2 { get; set; }
}