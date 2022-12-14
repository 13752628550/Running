using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WeiXinWebApp;

namespace WeiXinCqe
{
    public partial class getWeiXinid : System.Web.UI.Page
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
                        if (accessuser.UserId != null)
                        {
                        

                                Response.Cookies["weixinid"].Value = accessuser.UserId;
                                Response.Cookies["weixinid"].Expires = DateTime.Now.AddMinutes(1440);//1天
       
             
                                if (state == "status1")
                                {
                                    Response.Redirect("~/Weixin/vote/LinWuVote.aspx");

                                }
                                else if (state == "status2")
                                {
                                    Response.Redirect("~/Weixin/vote/Dvote2.aspx");

                                }
                                else if (state == "status3")
                                {
                                    Response.Redirect("~/Weixin/vote/Dvote4.aspx");

                                }
                              
                                else
                                {
                                    Response.Redirect("~/Weixin/development/Development.aspx");

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