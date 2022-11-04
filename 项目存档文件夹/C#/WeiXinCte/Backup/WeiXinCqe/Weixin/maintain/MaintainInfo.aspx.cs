using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe
{
    public partial class MaintainInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = "维护调试";
                string errstring = "";
                if (Request.QueryString["errstring"] == null)
                {

                    Label2.Text = "对不起，系统正在维护调试阶段,请谅解";
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