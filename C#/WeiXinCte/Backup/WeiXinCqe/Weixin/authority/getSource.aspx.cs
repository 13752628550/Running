using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe
{
    public partial class getSource : System.Web.UI.Page
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



                        Response.Cookies["fromsource"].Value = "WeiXin";
                        Response.Cookies["fromsource"].Expires = DateTime.Now.AddMinutes(60);


                        if (state == "shitang1")
                        {
                            Response.Redirect("~/Weixin/shitang/cchj.aspx");

                        }
                        else if (state == "shitang2")
                        {
                            Response.Redirect("~/Weixin/shitang/jcgj.aspx");

                        }
                        else if (state == "shitang3")
                        {
                            Response.Redirect("~/Weixin/shitang/jqtj.aspx");

                        }
                        else if (state == "shitang4")
                        {
                            Response.Redirect("~/Weixin/shitang/jcsj.aspx");

                        }

                        else
                        {
                            Response.Redirect("~/Weixin/development/Development.aspx");

                        }


                    }
                }
            }


        }
    }
}