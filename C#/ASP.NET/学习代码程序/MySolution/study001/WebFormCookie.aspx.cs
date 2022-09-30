using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class WebFormCookie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ;
        }

        protected void btnLOGin_Click(object sender, EventArgs e)
        {
            //创建 Cookie 对象
            HttpCookie hcuser = new HttpCookie("username");
            //设置 Cookie 保存值
            hcuser.Value = txtUserName.Text;
            //设置 Cookie 对象过期时间，将其设置为持久型,否则它是临时性
            hcuser.Expires = new DateTime(2021, 8, 9);
            //设置过期时间值
            hcuser.Expires = DateTime.Now.AddMinutes(79);
            //服务端将数据写入客户端 Cookie
            Response.Cookies.Add(hcuser);
            

        }
    }
}