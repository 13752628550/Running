using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe
{
    public partial class Development : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = "开发中";
                string errstring = "";
                if (Request.QueryString["errstring"] == null)
                {

                    Label2.Text = "正在努力开发中……";
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