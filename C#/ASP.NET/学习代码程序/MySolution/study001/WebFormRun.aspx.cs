using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class WebFormRun : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Request.RawUrl+"<br/>");
            Response.Write(Request.HttpMethod);
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write("hello");
            string userName = Request.Form["userName"];
            Response.Write("接受到的用户名是：" + userName);
        }

        protected void txt_TextChanged(object sender, EventArgs e)
        {
            string txt = this.txt.Text;
            lblMsg.Text = "从文本框中获得的值是：" + txt;
        }
    }
}