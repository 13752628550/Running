using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class WebFormApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string password = txtPassWord.Text;
            //把用户名密码存储至 Application 中
            Application["lastuserName"] = userName;
            Response.Redirect("~/details.aspx");  //跳转至主页面
        }
    }
}