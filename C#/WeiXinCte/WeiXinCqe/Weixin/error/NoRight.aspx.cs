using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe
{
    public partial class NoRight : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = "没有权限";
                string errstring = "";
                if (Request.QueryString["errstring"] == null)
                {

                    Label2.Text = "非公司用户没有权限";
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