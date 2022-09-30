using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Xml;

namespace WeiXinCqe.Cams
{
    /// <summary>
    /// GetVersion 的摘要说明
    /// </summary>
    public class GetVersion : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string productioncode = context.Request.QueryString["CODE"];

            VersionInfo version = new VersionInfo();
            //Thread.Sleep(5 * 1000);

            try
            {
                XmlDocument xml = new XmlDocument();//初始化一个xml实例          
                xml.Load(HttpContext.Current.Server.MapPath("~/Cams/" + productioncode + ".xml"));
                XmlNode root = xml.SelectSingleNode("/version");//指定一个节点
                XmlNodeList childlist = root.ChildNodes;//获取节点下所有直接子节点
                version.errcode = "ok";
                version.errmsg = "获取成功";
                version.versioncode = Convert.ToDouble(childlist[0].InnerText);
                version.productname = childlist[1].InnerText;
                version.updatecontent = childlist[2].InnerText;
                version.updateurl = childlist[3].InnerText;
                version.serverip = childlist[4].InnerText;

            }
            catch (Exception ex)
            {
                version.errcode = "error";
                version.errmsg = "服务器故障" + ex.ToString();

            }



            JavaScriptSerializer jss = new JavaScriptSerializer();
            string jsonbody = jss.Serialize(version);
            context.Response.Write(jsonbody);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}