using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Authority
/// </summary>
public class Authority
{
   
    
    public Authority()
    {

    }

    public Authority(int id, string name, bool login, bool search, bool addEM, bool editDelete, bool editAU, bool askForLeave, bool clock, bool shopManager, bool clubManager, bool meetingRoom)
    {
        Id = id;
        Name = name;
        Login = login;
        Search = search;
        AddEM = addEM;
        EditDelete = editDelete;
        EditAU = editAU;
        AskForLeave = askForLeave;
        Clock = clock;
        ShopManager = shopManager;
        ClubManager = clubManager;
        MeetingRoom = meetingRoom;
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public bool Login { get; set; }
    public bool Search { get; set; }
    public bool AddEM { get; set; }
    public bool EditDelete { get; set; }
    public bool EditAU { get; set; }
    public bool AskForLeave { get; set; }
    public bool Clock { get; set; }
    public bool ShopManager { get; set; }
    public bool ClubManager { get; set; }
    public bool MeetingRoom { get; set; }
}