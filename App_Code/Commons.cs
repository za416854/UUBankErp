using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Common
/// </summary>
public class Commons
{
    public static string DbConnecitonstring
    {
         get{
            return ConfigurationManager.ConnectionStrings["UUUBankErpConnectionString1"].ConnectionString;
        }
    }
}