using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClubCount
/// </summary>
public class ClubCount
{
    public ClubCount(int id, int clubcount)
    {
        Id = id;
        Clubcount = clubcount;
    }
    public ClubCount() { }

    public int Id { get; set; }
    public int Clubcount { get; set; }
}