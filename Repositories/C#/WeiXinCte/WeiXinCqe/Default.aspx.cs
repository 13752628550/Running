using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WeiXinWebApp;

namespace WeiXinCqe
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = "欢迎访问天津三美电机微信公众号，请联系人事扫描二维码关注进入。";
                string errstring = "";
                if (Request.QueryString["errstring"] == null)
                {

                   // Label2.Text = "为保证信息安全，此页面不准浏览器访问";
                    Label2.Text = "";
                }
                else
                {
                    errstring = Request.QueryString["errstring"];
                    Label2.Text = Server.UrlDecode(errstring);
                }


            }
        }
    }
}