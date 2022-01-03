using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for Common
/// </summary>
public class Common
{
    public static string DbConnecitonstring
    {
        get
        {
            return ConfigurationManager.ConnectionStrings["UUUBankErpConnectionString1"].ConnectionString;
        }

    }
}