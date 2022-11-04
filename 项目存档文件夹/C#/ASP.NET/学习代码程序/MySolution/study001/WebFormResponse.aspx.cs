using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class WebFormResponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {
            Response.Write("普通的文本字符串");
            Response.Write("<input type='button' value='动态按钮'name='btn id='btn'/>");
            Response.Write("<script> alert ('hello');</script>");
        }

        protected void btnEnd_Click(object sender, EventArgs e)
        {
            Response.Write("<input type='button' value='动态按钮1' name='btn1' id='btn1' />");
            Response.End();
            Response.Write("<input type='button' value='动态按钮2' name='btn2' id='btn2' />");
        }

        protected void btnRedirect_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMain.aspx");
            
        }
    }
        
}
