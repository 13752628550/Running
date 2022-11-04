using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = "访问失败";
                string errstring="";
                if (Request.QueryString["errstring"] == null)
                {
                  
                    Label2.Text = "对不起，因为服务器开小差,你访问的页面丢失了,稍后重试";
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