using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WeiXinWebApp;

namespace WeiXinCqe
{
    public partial class getStaffid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string code = "";
                string state = "";
                if (Request.QueryString["code"] == null)
                {// 跳转到失败页面
                    string errstr = "非法打开页面，只能从微信企业号打开";
                    Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
                }
                else
                {//
                    code = Request.QueryString["code"].ToString().Trim();
                    if (Request.QueryString["state"] == null)
                    {// 跳转到失败页面
                        string errstr = "非法打开页面，只能从微信企业号打开";
                        Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
        
                    }
                    else
                    {//
                        state = Request.QueryString["state"].ToString().Trim();
                        WeiXinAccessUser accessuser = WeiXinAccessUserOperatore.GetWeiXinAccessUser(AccessToken.Instance.Access_Token, code);
                        if (accessuser.UserId!=null)
                        {
                            OracleUser oracleuser = DbOracleUser.GetOracleUser(accessuser.UserId);

                            if (oracleuser.WeiXin_ID !=null)
                            {
                                Response.Cookies["staffid"].Value = oracleuser.Staffid;
                                Response.Cookies["staffid"].Expires = DateTime.Now.AddMinutes(60);
                                Response.Cookies["newstaffid"].Value = oracleuser.NewStaffid;
                                Response.Cookies["newstaffid"].Expires = DateTime.Now.AddMinutes(60);
                                Response.Cookies["staffname"].Value = Server.UrlEncode(oracleuser.Staffname);
                                Response.Cookies["staffname"].Expires = DateTime.Now.AddMinutes(60);
                                Response.Cookies["newstaffdate"].Value = Server.UrlEncode(oracleuser.NewStaffDate);
                                Response.Cookies["newstaffdate"].Expires = DateTime.Now.AddMinutes(60);
                                Response.Cookies["deviceid"].Value = accessuser.DeviceId;
                                Response.Cookies["deviceid"].Expires = DateTime.Now.AddMinutes(60);
                                Response.Cookies["weixinid"].Value = accessuser.UserId;
                                Response.Cookies["weixinid"].Expires = DateTime.Now.AddMinutes(60);//1天
       
                                if (state == "status1")
                                {
                                    Response.Redirect("~/Weixin/dinner/MyDinner.aspx");

                                }
                                else if (state == "status2")
                                {
                                    Response.Redirect("~/Weixin/dinner/MyBooking.aspx");

                                }
                                else if (state == "status3")
                                {
                                    //Response.Redirect("~/Weixin/development/Development.aspx");
                                    Response.Redirect("~/Weixin/salary/MySalary.aspx");

                                }
                                else if (state == "status4")
                                {
                                    Response.Redirect("~/Weixin/baseinfo/BaseInfo.aspx");

                                }
                                else if (state == "status5")
                                {
                                    Response.Redirect("~/Weixin/rewardpunishment/RewardPunishment.aspx");

                                }
                                else if (state == "status6")
                                {
                                    Response.Redirect("~/Weixin/attendance/Attendance.aspx");

                                }
                                else
                                {
                                    Response.Redirect("~/Weixin/development/Development.aspx");
                                    
                                }
                            }
                            else
                            {//跳转到失败页面
                                string errstr = "如果确定是从微信企业号打开,可能由于网络原因或者服务器原因造成，稍后重试";
                                Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
        
                            }
                        }
                        else
                        {//跳转到失败页面
                            string errstr = "如果确定是从微信企业号打开,可能由于网络原因，稍后重试";
                            Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
        
                        }
                    }
                }

            }
        }
    }
}