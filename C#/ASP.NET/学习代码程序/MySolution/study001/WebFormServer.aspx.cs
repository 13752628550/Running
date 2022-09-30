using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class WebFormServer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHtmlEncode_Click(object sender, EventArgs e)
        {
            string str = "<span style='color:red'> 我是一个span容器</span>";
            str = Server.HtmlEncode(str);
            Response.Write(str);
        }

        protected void btnHtmlDecode_Click(object sender, EventArgs e)
        {
            string str = "&lt;span style=&#39;color:red&#39;&gt; 我是一个span容器&lt;/span&gt;";
            str = Server.HtmlDecode(str);
            Response.Write(str);
        }

        protected void btnUrlEncode_Click(object sender, EventArgs e)
        {
            string url = "Main.aspx?userName=张三";
            string path = Server.UrlEncode(url);
            Response.Write(path);
        }

        protected void btnUrlDecode_Click(object sender, EventArgs e)
        {
            string url = "'Main.aspx%3fuserName%3d%e5%bc%a0%e4%b8%89'";
            string path = Server.UrlDecode(url);
            Response.Write(path);
            
        }

        protected void btnMapPath_Click(object sender, EventArgs e)
        {
            
            string path = "~/test.txt";     //~表示当前网站目录
            path = Server.MapPath(path);     // 将虚拟路径转成实际能用物理路径
        
        }

        
        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/server.aspx");       //停止当前页面，根据URL加载其他页面，地址栏网址不发生变化
        }

        protected void btnExecute_Click(object sender, EventArgs e)
        {
            Server.Execute("~/server.aspx");        //不停当前页面，根据URL加载其他页面，地址栏网址不发生变化
        }
    }
}

