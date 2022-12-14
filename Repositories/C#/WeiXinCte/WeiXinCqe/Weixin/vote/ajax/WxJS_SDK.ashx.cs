using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using WeiXinWebApp;

namespace WeiXinCqe.Weixin.vote.ajax
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class WxJS_SDK : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
          //   GetInfoMation( context);


        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #region 获取AccessToken
        private static string GetAccessToken()
        {
            return AccessToken.Instance.Access_Token;
        }
        #endregion
        #region 获取Jsapi_Ticket
        private static string GetWeiXinJsapi_Ticket(string accessToken)
        {
            string tokenUrl = string.Format("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type={1}", accessToken, "jsapi");
            var wc = new System.Net.WebClient();
            var strReturn = wc.DownloadString(tokenUrl); //取得微信返回的json数据   
            return strReturn;
        }
        #endregion
        #region 基础字符
        private static string[] strs = new string[]
                               {
                                  "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                                  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
                               };
        #endregion
        #region 创建随机字符串
        private static string CreatenNonce_str()
        {
            Random r = new Random();
            var sb = new StringBuilder();
            var length = strs.Length;
            for (int i = 0; i < 15; i++)
            {
                sb.Append(strs[r.Next(length - 1)]);
            }
            return sb.ToString();
        }
        #endregion
        #region  创建时间戳
        private static long CreatenTimestamp()
        {
            return (DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
        }
        #endregion
        #region 签名算法
        /// <summary>
        /// 签名算法
        ///本代码来自开源微信SDK项目：https://github.com/night-king/weixinSDK
        /// </summary>
        /// <param name="jsapi_ticket">jsapi_ticket</param>
        /// <param name="noncestr">随机字符串(必须与wx.config中的nonceStr相同)</param>
        /// <param name="timestamp">时间戳(必须与wx.config中的timestamp相同)</param>
        /// <param name="url">当前网页的URL，不包含#及其后面部分(必须是调用JS接口页面的完整URL)</param>
        /// <returns></returns>
        public static string GetSignature(string jsapi_ticket, string noncestr, long timestamp, string url, out string string1)
        {
            var string1Builder = new StringBuilder();
            string1Builder.Append("jsapi_ticket=").Append(jsapi_ticket).Append("&")
                          .Append("noncestr=").Append(noncestr).Append("&")
                          .Append("timestamp=").Append(timestamp).Append("&")
                          .Append("url=").Append(url.IndexOf("#") >= 0 ? url.Substring(0, url.IndexOf("#")) : url);
            string1 = string1Builder.ToString();
            return FormsAuthentication.HashPasswordForStoringInConfigFile(string1, "SHA1");
        }
        #endregion

        //GET api/GetInfoMation
        /// <summary>
        ///初始化的数据调用微信接口返回参数
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string GetInfoMation(string url )
        {
            try
            {
                //生成tokcen
                string tocken = GetAccessToken();
                JObject TokenJO = (JObject)JsonConvert.DeserializeObject(tocken);
                //验证签名
                string Jsapi_Ticket = GetWeiXinJsapi_Ticket(TokenJO["access_token"].ToString());
                JObject Jsapi_TicketJo = (JObject)JsonConvert.DeserializeObject(Jsapi_Ticket);
                #region
                string rtn = "";
                string jsapi_ticket = Jsapi_TicketJo["ticket"].ToString();
                string noncestr = CreatenNonce_str();
                long timestamp = CreatenTimestamp();
                string outstring = "";
                string JS_SDK_Result = GetSignature(jsapi_ticket, noncestr, timestamp, url, out outstring);
                //拼接json串返回前台
                rtn = "{\"appid\":\"" + ConfigurationManager.AppSettings["appid"] + "\",\"jsapi_ticket\":\"" + jsapi_ticket + "\",\"noncestr\":\"" + noncestr + "\",\"timestamp\":\"" + timestamp + "\",\"outstring\":\"" + outstring + "\",\"signature\":\"" + JS_SDK_Result.ToLower() + "\"}";
                #endregion
              //  context.Response.Write(rtn);
               return rtn;
            }
            catch (Exception ex)
            {
                return "";            }
        }
    }
}