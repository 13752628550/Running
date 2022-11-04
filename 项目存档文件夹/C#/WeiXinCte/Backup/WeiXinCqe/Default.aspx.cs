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
                Label1.Text = "访问失败";
                string errstring = "";
                if (Request.QueryString["errstring"] == null)
                {

                    Label2.Text = "对不起，此页面不准浏览器访问";
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