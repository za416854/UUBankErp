using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Message
/// </summary>
public class Message
{
    public Message()
    {
       
    }

    public Message(int id, string fromName, string toName, string topic, string messageContent, string time, string state)
    {
        Id = id;
        FromName = fromName;
        ToName = toName;
        Topic = topic;
        MessageContent = messageContent;
        Time = time;
        State = state;
    }

    public int Id { get; set; }
    public string FromName { get; set; }
    public string ToName { get; set; }
    public string Topic { get; set; }
    public string MessageContent { get; set; }
    public string Time { get; set; }
    public string State { get; set; }
}