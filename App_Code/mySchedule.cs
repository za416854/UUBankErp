/// <summary>
/// mySchedule 的摘要描述
/// </summary>
public partial class mySchedule
{
    public mySchedule(int id, string userName, string eventName, string startDate, 
                        string startTime, string endDate, 
                        string endTime, string isAllDay, string loginer)
    {
        Id = id;
        UserName = userName;
        EventName = eventName;
        StartDate = startDate;
        StartTime = startTime;
        EndDate = endDate;
        EndTime = endTime;
        IsAllDay = isAllDay;
        Loginer = loginer;
    }

    //
    public mySchedule()
    {

    }

}