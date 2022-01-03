/// <summary>
/// MeetingRoom 的摘要描述
/// </summary>
public partial class MeetingRoom
{
    public MeetingRoom(string userName, string room, string date, string time, string reason, string approval)
    {
        UserName = userName;
        Room = room;
        Date = date;
        Time = time;
        Reason = reason;
        Approval = approval;
    }

    //
    public MeetingRoom()
    {

    }

}

public partial class ToDoList
{
    public ToDoList(int id, string userName, string myEvent)
    {
        Id = id;
        UserName = userName;
        this.myEvent = myEvent;
    }
    //
    public ToDoList()
    {

    }

}


