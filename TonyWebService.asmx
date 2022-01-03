<%@ WebService Language="C#" Class="TonyWebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class TonyWebService : System.Web.Services.WebService
{

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public List<HumanMember> GetHumanlist()
    {
        return HumanMemberUtility.GetHumanMembers();

    }
    [WebMethod]
    public List<HumanEasyMember> GetHumanPatiailList()
    {
        List<HumanMember> HumanList = HumanMemberUtility.GetHumanMembers();
        List<HumanEasyMember> HumanEasyList = new List<HumanEasyMember>();
        foreach (var s in HumanList)
        {
            HumanEasyMember easy = new HumanEasyMember()
            {
                ID = s.ID,
                Name = s.Name,
                Email = s.Email,
                Gender = s.Gender,
                Birthday = s.Birthday,
                Address = s.Address,
                CellPhone = s.CellPhone,
                HomePhone = s.HomePhone,
                Department = s.Department,
                Position = s.Position,
                HireDay = s.HireDay,
                Resignday = s.Resignday,
                Salary = s.Salary,
                Extension = s.Extension,
                ImageName = s.ImageName
            };
            HumanEasyList.Add(easy);
        }
        return HumanEasyList;
    }


    [WebMethod]
    public void EditHumanEmployeeByAdress(int id, string address)
    {
        HumanMember HH = HumanMemberUtility.GetHumanMemberById(id);

        HH.Address = address;
        HumanMemberUtility.HumanMemberEdit(HH);

    }

    [WebMethod]
    public void EditHumanEmployeeByBirthday(int id, string birth)
    {
        HumanMember HH = HumanMemberUtility.GetHumanMemberById(id);

        HH.Birthday = birth;
        HumanMemberUtility.HumanMemberEdit(HH);

    }
    [WebMethod]
    public void EditHumanEmployeeByCellPhone(int id, string cellphone)
    {
        HumanMember HH = HumanMemberUtility.GetHumanMemberById(id);

        HH.CellPhone = cellphone;
        HumanMemberUtility.HumanMemberEdit(HH);

    }
    [WebMethod]
    public void EditHumanEmployeeByHomePhone(int id, string homephone)
    {
        HumanMember HH = HumanMemberUtility.GetHumanMemberById(id);

        HH.HomePhone = homephone;
        HumanMemberUtility.HumanMemberEdit(HH);

    }
    [WebMethod]
    public void EditHumanEmployeeByImage(int id, string homephone)
    {
        HumanMember HH = HumanMemberUtility.GetHumanMemberById(id);

        HH.HomePhone = homephone;
        HumanMemberUtility.HumanMemberEdit(HH);

    }

    [WebMethod]
    public void FileUpload()
    {
        if (HttpContext.Current.Request.Files.Count > 0)
        {

            int id = Convert.ToInt32(HttpContext.Current.Request.Form["id"]);
            HumanMember human = HumanMemberUtility.GetHumanMemberById(id);
            HttpFileCollection files = HttpContext.Current.Request.Files;
            HttpPostedFile file = files[0];
            string fname = HttpContext.Current.Server.MapPath($"~/EmployeesImage/{human.ImageName}.jpg");
            file.SaveAs(fname);

        }
    }


    [WebMethod]
    public Authority GetAuthority(string id, string name)
    {
        Authority human = AuthorityUtility.GetAuthority(int.Parse(id), name);

        return human;
    }

    [WebMethod]
    public void AuthorityEdit(string id, string name, bool login, bool search, bool add,
        bool editdelete, bool editau)
    {
        Authority human = AuthorityUtility.GetAuthority(int.Parse(id), name);
        human.Login = login;
        human.Search = search;
        human.AddEM = add;
        human.EditDelete = editdelete;
        human.EditAU = editau;
        AuthorityUtility.AuthorityEdit(human);

    }


    [WebMethod]
    public string CheckMail(string emaill)
    {
        if (emaill == string.Empty)
        {
            return "請輸入Email  !!";
        }
        HumanMember h = HumanMemberUtility.CheckEmail(emaill);
        string a = "";
        if (h == null)
        {
            a = "Email可以使用";

        }
        else
        {
            a = "Email不可以使用";
        }

        return a;
    }


    [WebMethod]
    public HumanMember WriteData(int id)
    {
        HumanMember h = HumanMemberUtility.GetHumanMemberById(id);
        if (h != null)
        {
            return h;
        }
        else
        {
            return null;
        }



    }


    [WebMethod]
    public void deleteEM(string[] id)
    {
        if (id.Length != 0)
        {
            foreach (var i in id)
            {
                int a = int.Parse(i);
                HumanMemberUtility.HumanMemberDelete(a);
                AuthorityUtility.AuthorityrDelete(a);
                //HttpContext.Current.Response.Redirect("~/2.EmployeeList.aspx");
            }
        }
        else
        {
            HttpContext.Current.Response.Redirect("~/2.EmployeeList.aspx");
        }


    }


    [WebMethod]
    public Result GetTemporaryClub(int pageSize, int pageIndex)
    {
        List<TemporaryClub> clublist = TemporaryClubUtility.GetClubList();
        int startIndex = (pageIndex - 1) * pageSize;
        int realPageSize =
               clublist.Count - startIndex > pageSize
                ? pageSize : clublist.Count - startIndex;
        List<TemporaryClub> c = clublist.GetRange(startIndex, realPageSize);
        List<TemporaryClubString> clublist2 = new List<TemporaryClubString>();
        foreach (var s in c)
        {
            string ss = "";
            if (s.Approve2 == true)
            {
                ss = "true";
            }
            else
            {
                ss = "false";
            }
            TemporaryClubString cc = new TemporaryClubString(s.Id2, s.ClubName2,
            s.ClubFounderId2, s.ClubFounderName2, s.ClubScript2, s.DetailClubScript2,
            s.PeopleCount2, s.ClubImage2, ss);
            clublist2.Add(cc);

        }
        return new Result()
        {
            TotalCount = clublist.Count,
            Products = clublist2
        };

    }
    public class Result
    {
        public int TotalCount { get; set; }
        public List<TemporaryClubString> Products { get; set; }
    }

    [WebMethod]
    public string InsertTemporaryClub(TemporaryClub club)
    {
        TemporaryClubUtility.AddClub(club);
        if (club.Approve2 == true)
        {
            Club club2 = ClubUtility.GetClub(club.Id2);
            if (club2 == null)
            {
                Club FormalClub = new Club()
                {
                    Id = club.Id2,
                    ClubName = club.ClubName2,
                    ClubFounderId = club.ClubFounderId2,
                    ClubFounderName = club.ClubFounderName2,
                    ClubScript = club.ClubScript2,
                    DetailClubScript = club.DetailClubScript2,
                    PeopleCount = club.PeopleCount2,
                    ClubImage = club.ClubImage2
                };

                ClubUtility.AddClub(FormalClub);
                HumanMember h = HumanMemberUtility.GetHumanMemberById(club.ClubFounderId2);
                EmployeeClubFormal EMF = new EmployeeClubFormal(
            1, FormalClub.Id, FormalClub.ClubName, h.ID, h.Name,
            h.Department, "我是社長我是創辦人，故不需要加入原因");
                EmployeeClubFormalUtility.AddEmployeeApply(EMF);
                return "社團已建立成功!";
            }
            else
            {
                return "社團已存在!!";
            }

        }
        else
        {
            return "社團申請已審核";
        }

    }
    [WebMethod]
    public string EditTemporaryClub(TemporaryClubString la)
    {
        bool bo = true;
        if (la.Approve2 == "true")
        {
            bo = true;
        }
        else if (la.Approve2 == "false")
        {
            bo = false;
        }


        TemporaryClub club = new TemporaryClub(la.Id2, la.ClubName2, la.ClubFounderId2, la.ClubFounderName2
        , la.ClubScript2, la.DetailClubScript2, la.PeopleCount2, la.ClubImage2, bo);
        TemporaryClubUtility.EditClub(club);
        if (club.Approve2 == true)
        {
            Club club2 = ClubUtility.GetClubByName(club.ClubName2);
            if (club2 == null)
            {
                ClubCount ccc = ClubCountUtility.GetClubTOPONE();
                int idd = 0;
                if (ccc == null)
                {
                    idd = 1;
                    ClubCount c2 = new ClubCount(0, idd);
                    ClubCountUtility.AddClub(c2);
                }
                else
                {
                    idd = ccc.Clubcount + 1;
                    ClubCount c2 = new ClubCount(0, idd);
                    ClubCountUtility.AddClub(c2);
                }

                Club FormalClub = new Club()
                {
                    Id = idd,
                    ClubName = club.ClubName2,
                    ClubFounderId = club.ClubFounderId2,
                    ClubFounderName = club.ClubFounderName2,
                    ClubScript = club.ClubScript2,
                    DetailClubScript = club.DetailClubScript2,
                    PeopleCount = club.PeopleCount2,
                    ClubCount = idd,
                    ClubImage = club.ClubImage2
                };

                ClubUtility.AddClub(FormalClub);
                HumanMember h = HumanMemberUtility.GetHumanMemberById(club.ClubFounderId2);
                EmployeeClubFormal EMF = new EmployeeClubFormal(
                 1, idd, FormalClub.ClubName, h.ID, h.Name,
                  h.Department, "我是社長我是創辦人，故不需要加入原因");
                EmployeeClubFormalUtility.AddEmployeeApply(EMF);

                return "社團已建立成功!";
            }
            else
            {
                return "社團已存在!!";
            }

        }
        else
        {
            return "社團申請已審核";
        }

    }

    [WebMethod]
    public string DeleteTemporaryClub(TemporaryClubString la)
    {
        bool bo = true;
        if (la.Approve2 == "true")
        {
            bo = true;
        }
        else if (la.Approve2 == "false")
        {
            bo = false;
        }

        TemporaryClub t = new TemporaryClub(la.Id2, la.ClubName2, la.ClubFounderId2, la.ClubFounderName2
        , la.ClubScript2, la.DetailClubScript2, la.PeopleCount2, la.ClubImage2, bo);
        TemporaryClubUtility.DeleteClub(t.Id2);
        return "社團申請已刪除成功!";

    }
    [WebMethod]
    public string CheckClubName(string name)
    {
        TemporaryClub t = TemporaryClubUtility.GetClub(name);
        if (t == null)
        {
            Club club = ClubUtility.GetClubByName(name);
            if (club == null)
            {
                return "社團名稱可以使用!!";
            }
            else
            {
                return "社團名稱已被使用!!";
            }
        }
        else
        {
            return "社團名稱已被使用!!";
        }
    }


    [WebMethod]
    public Result2 GetEmployeeApply(int pageSize, int pageIndex)
    {
        List<EmployeeClub> clublist = EmployeeClubUtility.GetEmployeeApplyList();
        int startIndex = (pageIndex - 1) * pageSize;
        int realPageSize =
               clublist.Count - startIndex > pageSize
                ? pageSize : clublist.Count - startIndex;
        List<EmployeeClub> c = clublist.GetRange(startIndex, realPageSize);
        List<EmployeeClubString> employeeApplyList = new List<EmployeeClubString>();
        foreach (var s in c)
        {
            string ss = "";
            if (s.Approve == true)
            {
                ss = "true";
            }
            else
            {
                ss = "false";
            }
            EmployeeClubString cc = new EmployeeClubString(s.EMClubCount, s.JoinClubID, s.JoinClubName, s.EmployeeId
                , s.EmployeeName, s.EmployeeDepartment, s.JoinClubReason, ss);
            employeeApplyList.Add(cc);

        }


        return new Result2()
        {
            TotalCount = clublist.Count,
            Products = employeeApplyList
        };

    }
    public class Result2
    {
        public int TotalCount { get; set; }
        public List<EmployeeClubString> Products { get; set; }
    }


    [WebMethod]
    public string InsertEmployeeApply(EmployeeClub EM)
    {

        if (EM.Approve == true)
        {
            EmployeeClubUtility.AddEmployeeApply(EM);


            return "審核通過";

        }
        else
        {
            return "審核未通過";
        }

    }
    [WebMethod]
    public string EditEmployeeApply(EmployeeClubString la)
    {
        bool bo = true;
        if (la.Approve == "true")
        {
            bo = true;
        }
        else if (la.Approve == "false")
        {
            bo = false;
        }
        EmployeeClub EM = new EmployeeClub(la.EMClubCount, la.JoinClubID
            , la.JoinClubName, la.EmployeeId, la.EmployeeName, la.EmployeeDepartment,
            la.JoinClubReason, bo);


        EmployeeClubUtility.EditEmployeeApply(EM);
        if (EM.Approve == true)
        {

            EmployeeClubFormal e = EmployeeClubFormalUtility.GetEmployeeApplyByTwoId(EM.EmployeeId, EM.JoinClubID);
            if (e == null)
            {

                Club club = ClubUtility.GetClubByName(EM.JoinClubName);
                EmployeeClubFormal EMF = new EmployeeClubFormal(
                EM.EMClubCount, EM.JoinClubID, EM.JoinClubName, EM.EmployeeId, EM.EmployeeName,
                EM.EmployeeDepartment, EM.JoinClubReason);
                EmployeeClubFormalUtility.AddEmployeeApply(EMF);
                club.PeopleCount += 1;
                ClubUtility.EditClub(club);
                return "審核通過";
            }
            else
            {
                return "此筆申請已審核通過!!!";
            }


        }
        else
        {
            return "審核未通過";
        }

    }

    [WebMethod]
    public string DeleteEmployeeApply(EmployeeClubString la)
    {
        bool bo = true;
        if (la.Approve == "true")
        {
            bo = true;
        }
        else if (la.Approve == "false")
        {
            bo = false;
        }
        EmployeeClub EM = new EmployeeClub(la.EMClubCount, la.JoinClubID
            , la.JoinClubName, la.EmployeeId, la.EmployeeName, la.EmployeeDepartment,
            la.JoinClubReason, bo);

        EmployeeClub E = EM;
        EmployeeClubUtility.DeleteEmployeeApply(E.EMClubCount);
        return "加入申請已刪除成功!";

    }

    [WebMethod]
    public List<EmployeeClubFormal> GetClubPeole(string id)
    {
        int a = int.Parse(id);
        return EmployeeClubFormalUtility.GetEmployeeApplyListByClubId(a);

    }


    [WebMethod]
    public string DeleteClub(string[] id)
    {
        if (id.Length != 0)
        {
            foreach (var i in id)
            {

                int a = int.Parse(i);
                Club c = ClubUtility.GetClub(a);
                TemporaryClub te = TemporaryClubUtility.GetClub(c.ClubName);
                if (te != null)
                {

                    TemporaryClubUtility.DeleteClubByname(te.ClubName2);
                }

                ClubUtility.DeleteClub(a);
                EmployeeClubFormalUtility.DeleteJoinClub(a);
                

            }
            return "資料已經被刪除!!";
        }
        else
        {
            return "無勾選欲刪除社團!!!";
        }


    }


    [WebMethod]
    public Result3 GetEmployeeQuitApply(int pageSize, int pageIndex)
    {
        List<QuitEmployeeClub> clublist = QuitEmployeeClubUtility.GetQuitEmployeeApplyList();
        int startIndex = (pageIndex - 1) * pageSize;
        int realPageSize =
               clublist.Count - startIndex > pageSize
                ? pageSize : clublist.Count - startIndex;
        List<QuitEmployeeClub> c = clublist.GetRange(startIndex, realPageSize);
        List<QuitEmployeeClubString> employeeApplyList = new List<QuitEmployeeClubString>();
        foreach (var s in c)
        {
            string ss = "";
            if (s.Approve == true)
            {
                ss = "true";
            }
            else
            {
                ss = "false";
            }
            QuitEmployeeClubString cc = new QuitEmployeeClubString(s.QuitEMClubCount, s.QuitClubID, s.QuitClubName, s.EmployeeId
                , s.EmployeeName, s.EmployeeDepartment, s.QuitClubReason, ss);
            employeeApplyList.Add(cc);

        }


        return new Result3()
        {
            TotalCount = clublist.Count,
            Products = employeeApplyList
        };

    }
    public class Result3
    {
        public int TotalCount { get; set; }
        public List<QuitEmployeeClubString> Products { get; set; }
    }


    [WebMethod]
    public string EditEmployeeQuitApply(QuitEmployeeClubString la)
    {
        bool bo = true;
        if (la.Approve == "true")
        {
            bo = true;
        }
        else if (la.Approve == "false")
        {
            bo = false;
        }
        QuitEmployeeClub EMQuit = new QuitEmployeeClub(la.QuitEMClubCount, la.QuitClubID
            , la.QuitClubName, la.EmployeeId, la.EmployeeName, la.EmployeeDepartment,
            la.QuitClubReason, bo);


        QuitEmployeeClubUtility.EditQuitEmployeeApply(EMQuit);
        if (EMQuit.Approve == true)
        {

            EmployeeClubFormal e = EmployeeClubFormalUtility.GetEmployeeApplyByTwoId(EMQuit.EmployeeId, EMQuit.QuitClubID);
            if (e != null)
            {

                Club club = ClubUtility.GetClubByName(EMQuit.QuitClubName);

                EmployeeClubFormalUtility.DeleteEmployeeApplyByTwoId(EMQuit.EmployeeId, EMQuit.QuitClubID);
                club.PeopleCount -= 1;
                ClubUtility.EditClub(club);
                return "審核通過";
            }
            else
            {
                return "此筆申請已審核通過!!!";
            }


        }
        else
        {
            return "審核未通過";
        }

    }

    [WebMethod]
    public string DeleteEmployeeQuitApply(QuitEmployeeClubString la)
    {
        bool bo = true;
        if (la.Approve == "true")
        {
            bo = true;
        }
        else if (la.Approve == "false")
        {
            bo = false;
        }
        QuitEmployeeClub EMQuit = new QuitEmployeeClub(la.QuitEMClubCount, la.QuitClubID
            , la.QuitClubName, la.EmployeeId, la.EmployeeName, la.EmployeeDepartment,
            la.QuitClubReason, bo);


        QuitEmployeeClub E = EMQuit;
        QuitEmployeeClubUtility.DeleteQuitEmployeeApply(E.QuitEMClubCount);
        return "退出申請已刪除成功!";

    }

    [WebMethod]
    public List<ClubCalenders> GetCalenders(int clubid)
    {

        List<ClubCalenders> calenders = ClubCalendersUtility.GetCalenders(clubid);

        return calenders;
    }

    [WebMethod]
    public int AddCalender(string userName, string eventName,
                            string startDate, string startTime,
                            string endDate, string endTime, string isAllDay, string clubId)
    {
        int a = int.Parse(clubId);

        ClubCalenders calender = new ClubCalenders(
            0, userName, eventName, startDate, startTime, endDate, endTime, isAllDay, a
        );

        return ClubCalendersUtility.Add(calender);
    }

    [WebMethod]
    public void Update(int id, string userName, string eventName,
                       string startDate, string startTime,
                       string endDate, string endTime, string isAllDay, string clubId)
    {

        int a = int.Parse(clubId);
        ClubCalenders calender = new ClubCalenders(
        id, userName, eventName, startDate, startTime, endDate, endTime, isAllDay, a
    );
        //calender = CalenderUtility.GetCalender(calender);
        //return calender;
        ClubCalendersUtility.Update(calender);
    }

    [WebMethod]
    public void Delete(int id)
    {
        ClubCalendersUtility.Delete(id);
    }
    [WebMethod]
    public List<Authority> GetHumanAuthorityList()
    {
        return AuthorityUtility.GetAuthoritys();

    }

}