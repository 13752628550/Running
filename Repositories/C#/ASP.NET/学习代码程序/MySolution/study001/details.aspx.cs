using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class details : System.Web.UI.Page
    {
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ////string sid = Request["username"];
            //string pwd = Request["txtpwd"];
            //string county = Request["txtcounty"];


            HttpCookie hc = Request.Cookies["username"]; 
            if(hc!=null)
            {
                string sid = hc.Value;
                Response.Write(sid);
                
            }

            //else


            //if (Session["username"]==null)
            //{
            //    Response.Write("请先登录然后使用");
            //}else
            //{ 
            //    string sid = Session["username"].ToString();
            //    string fgh = Session["password"].ToString();
            //    Response.Write("当前用户名称为：" + sid + fgh);
            //}
            //txtsno.Text = sid ;
            //txtname.Text = pwd;
            //txtcounty.Text = county;
        }
    
    }
}

