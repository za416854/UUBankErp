using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Club
/// </summary>
public class Club
{
    
    public Club()
    {

    }

    public Club(int id, string clubName, int clubFounderId, string clubFounderName, string clubScript, string detailClubScript, int peopleCount, int clubCount, string clubImage)
    {
        Id = id;
        ClubName = clubName;
        ClubFounderId = clubFounderId;
        ClubFounderName = clubFounderName;
        ClubScript = clubScript;
        DetailClubScript = detailClubScript;
        PeopleCount = peopleCount;
        ClubCount = clubCount;
        ClubImage = clubImage;
    }

    public int Id { get; set; }
    public string ClubName { get; set; }
    public int ClubFounderId { get; set; }
    public string ClubFounderName { get; set; }
    public string ClubScript { get; set;}
    public string DetailClubScript { get; set; }
    public int PeopleCount { get; set; }
    public int ClubCount { get; set; }
    public string ClubImage { get; set;}
}