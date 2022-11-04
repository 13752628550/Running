using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OracleClient;
using System.Xml;
using System.Net;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using System.Web.Services;
using System.Configuration;
using Newtonsoft.Json.Linq;
using System.Web.Security;
using WeiXinWebApp;
using System.Threading;

namespace WeiXinCqe
{
    public partial class FY_everyday : System.Web.UI.Page
    {

        public static string Rstaffid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["newstaffid"] == null || Request.Cookies["cqe"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww4119ac66ab8de522&redirect_uri=https://ctewechat.mitsumi.com.cn/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status18#wechat_redirect");
                }
                else
                {
                    staffid.Text = Request.Cookies["staffid"].Value.ToString().Trim();
                    newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    deviceid.Text = "微信客户端:" + Request.Cookies["deviceid"].Value.ToString().Trim();
                    staffname.Text = Server.UrlDecode(Request.Cookies["staffname"].Value.ToString().Trim());

                    Rstaffid = newstaffid.Text;
                    Init_1();

                }
                //staffid.Text = "171601";
                //newstaffid.Text = "171601";

                //Init_1();


            }

        }
        
        #region 答题状况
        private void Init_1()
        {
           
            try
            {
                lbl_yyyymmdd.InnerText ="日期："+ DateTime.Now.Year + "年" + DateTime.Now.Month + "月" + DateTime.Now.Day + "日";
                //lbl_ty.InnerText = DateTime.Now.Month+"月"+ DateTime.Now.Day+ "日体温";
                //string sql = "  SELECT TO_CHAR(YYYYMMDD,'YYYY-MM-DD') YYYYMMDD ,TEMPERATURE,(CASE WHEN COUGH=1 THEN '是' WHEN COUGH=0 THEN '否' ELSE '' END ) COUGH," +
                //    "(CASE WHEN MEDICINE=1 THEN '是'  WHEN MEDICINE=0 THEN '否' ELSE '' END ) MEDICINE,(CASE WHEN QD=1 THEN '是'  WHEN QD=0 THEN '否' ELSE '' END ) QD," +
                //    "(CASE WHEN ONEHOUSE=1 THEN '是'  WHEN ONEHOUSE=0 THEN '否' ELSE '' END ) ONEHOUSE,(CASE WHEN HUBEI=1 THEN '是'  WHEN HUBEI=0 THEN '否' ELSE '' END ) HUBEI, STAFFID FROM WEIXIN_DOVTE_GZFY WHERE STAFFID='" + newstaffid.Text + "' AND YYYYMMDD>SYSDATE-17 ORDER BY YYYYMMDD desc ";
                string sql = " SELECT TO_CHAR(YYYYMMDD,'YYYY-MM-DD') YYYYMMDD ,TEMPERATURE, (CASE WHEN TEMPERATURE IS NULL THEN NULL WHEN (COUGH || MEDICINE || QD || ONEHOUSE || HUBEI = '00100' and (HS_JC is null or  HS_JC not in ('阳性','可疑'))) THEN '无' " +
                    " ELSE(CASE WHEN COUGH = 1 THEN '咳嗽;' ELSE '' END) || (CASE WHEN MEDICINE = 1 THEN '就医;' ELSE '' END) || (CASE WHEN QD = 0 THEN '离青;' ELSE '' END ) " +
                    "|| (CASE WHEN ONEHOUSE = 1 THEN '同住异常;' ELSE '' END ) || (CASE WHEN HUBEI = 1 THEN '接触疫区;' ELSE '' END ) || (CASE WHEN HS_JC in ('阳性','可疑') THEN '核酸异常' ELSE '' END) END )  YC, STAFFID" +
                    " ,LOCATION || LOC01 || LOC02 LOC FROM WEIXIN_DOVTE_GZFY  WHERE STAFFID = '" + newstaffid.Text + "' AND YYYYMMDD> SYSDATE - 17 ORDER BY YYYYMMDD desc";

                DataTable dt = OracleOperateHelp.getDataTable(sql);
                GridView1.Caption ="每日情况汇总";
                if (dt.Rows.Count > 0)
                {
                    div_cc.Visible = true;
                    //休日自己填写是否在青
                    //string sql1 = " SELECT WORKTYPE FROM BASE_CALENDAR WHERE YYYYMMDD=TO_DATE ('"+ DateTime.Now.ToString("yyyy-MM-dd")+ "','YYYY-MM-DD')";
                    //DataTable dt1 = OracleOperateHelp.getDataTable(sql1);
                    //if (dt1.Rows[0]["WORKTYPE"].ToString() == "1B")
                    //{
                    //    d1.Checked = true;
                    //}

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["YYYYMMDD"].ToString() == DateTime.Now.ToString("yyyy-MM-dd") && !string.IsNullOrEmpty( dt.Rows[i]["TEMPERATURE"].ToString()))
                        {
                            //不显示填写页面
                            div_cc.Visible = false;
                           
                        }
                    }

                    

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.EmptyDataText = "没有数据";
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch
            {
                GridView1.EmptyDataText = "网络错误，稍后重试";
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }


        #endregion

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Q1 = "";
            string Q2 = "";
            string Q3 = "";
            string Q4 = "1";
            string Q5 = "";
            string Q6 = "";
            string Q7 = "";
            string WD = "";
            string loc = "";
            if (!string.IsNullOrEmpty(txt_tw.Value))
            {
                Q1 = txt_tw.Value;
            }
            else
            {
                WD += "1、";
            }
            if (b1.Checked || b2.Checked)
            {
                if (b1.Checked) Q2 = "1";
                if (b2.Checked) Q2 = "0";
            }
            else
            {
                WD += "2、";
            }
            if (c1.Checked || c2.Checked)
            {
                if (c1.Checked) Q3 = "1";
                if (c2.Checked) Q3 = "0";
            }
            else
            {
                WD += "3、";
            }
            //if (d1.Checked || d2.Checked)
            //{
            //    if (d1.Checked) Q4 = "1";
            //    if (d2.Checked) Q4 = "0";
            //}
            //else
            //{
            //    WD += "4、";
            //}
            if (e1.Checked || e2.Checked)
            {
                if (e1.Checked) Q5 = "1";
                if (e2.Checked) Q5 = "0";
            }
            else
            {
                WD += "4、";
            }
            if (f1.Checked || f2.Checked)
            {
                if (f1.Checked) Q6 = "1";
                if (f2.Checked) Q6 = "0";
            }
            else
            {
                WD += "5、";
            }
            //if (g1.Checked || g2.Checked || g3.Checked || g4.Checked || g5.Checked)
            //{
            //    if (g1.Checked) Q7 = "未检测";
            //    if (g2.Checked) Q7 = "未出结果";
            //    if (g3.Checked) Q7 = "阴性";
            //    if (g4.Checked) Q7 = "阳性";
            //    if (g5.Checked) Q7 = "可疑";
            //}
            //else
            //{
            //    WD += "6、";
            //}
            if (!string.IsNullOrEmpty(Request.Form["lbl_loc"].ToString()))
            {
                loc = Request.Form["lbl_loc"].ToString();
            }
            else
            {
                WD += "位置、";
            }


            if (!string.IsNullOrEmpty(WD))
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('" + WD + "题未作答。') ;window.location.href = '#link27';</script>");
                return;
            }
            else
            {

                //提交答案
                using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                {
                    conn.Open();
                    OracleCommand cmd = conn.CreateCommand();
                    OracleTransaction tran = conn.BeginTransaction();
                    try
                    {
                        loc = Request.Form["lbl_loc"].ToString();
                        string country = loc.ToString().Split(',')[0].ToString();
                        string province = loc.ToString().Split(',')[1].ToString();
                        string city = loc.ToString().Split(',')[2].ToString();
                        string district = loc.ToString().Split(',')[3].ToString(); ;
                        // string sql = "UPDATE WEIXIN_DOVTE_GZFY  SET TEMPERATURE='" + Q1 + "',COUGH='" + Q2 + "',MEDICINE='" + Q3 + "',QD='" + Q4 + "',ONEHOUSE='" + Q5 + "',HUBEI='" + Q6 + "',LOCATION='" + loc + "',LOC01='" + loc01 + "',LOC02='" + loc02 + "',ADDTIME=SYSDATE " +
                        //    " WHERE STAFFID='" + newstaffid.Text + "' AND YYYYMMDD=TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD'),'YYYY-MM-DD')";
                        string sql = "UPDATE WEIXIN_DOVTE_GZFY  SET TEMPERATURE='" + Q1 + "',COUGH='" + Q2 + "',MEDICINE='" + Q3 + "',QD='" + Q4 + "',ONEHOUSE='" + Q5 + "',HUBEI='" + Q6 + "',ADDTIME=SYSDATE," +
                            " COUNTRY='" + country + "', LOCATION='" + province + "',LOC01='" + city + "',LOC02='" + district + "',HS_JC='" + Q7 + "'  " +
                            " WHERE STAFFID='" + newstaffid.Text + "' AND YYYYMMDD=TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD'),'YYYY-MM-DD')";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();





                        tran.Commit();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交成功！') ;window.location.href = '#link27';</script>");

                        Init_1();


                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交失败。') ;window.location.href = '#link26';</script>");

                    }

                }
            }

        }


        public string GetCityName(string strIP)
        {
            string Location = "";
            try
            {
                 strIP = strIP == null ?
                     System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] : System.Web.HttpContext.Current.Request.UserHostAddress   ;

               string sURL = "http://ip.taobao.com/service/getIpInfo.php?ip=" + strIP + "";

               string  getJson = webPost(sURL);

                Root rt = JsonConvert.DeserializeObject<Root>(getJson);

                Location = rt.data[0].ip + ":" + rt.data[0].region + rt.data[0].city;

                return Location;  
                
            }
            catch (Exception ex)
            {
                Location = ex.Message;
            }
            return Location;
        }

        public static string webPost(string url)
        {
            string param = ("");//参数
            byte[] bs = Encoding.UTF8.GetBytes(param);
            HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(url);
            req.Method = "POST";

            req.ContentType = "application/json";
            req.ContentLength = bs.Length;


            using (Stream reqStream = req.GetRequestStream())
            {
                reqStream.Write(bs, 0, bs.Length);
                reqStream.Close();
                HttpWebResponse response2 = (HttpWebResponse)req.GetResponse();
                StreamReader sr2 = new StreamReader(response2.GetResponseStream(), Encoding.UTF8);
                var result = sr2.ReadToEnd(); 
                
                return Regex.Unescape(result);

            }
        }


        public class Root
        {
            /// <summary>
            /// 
            /// </summary>
            public int code { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public List<DataItem> data { get; set; }
        }
        public class DataItem
        { 
            public string ip { get; set; } 
            public string country { get; set; } 
            public string area { get; set; } 
            public string region { get; set; }
            public string city { get; set; }
            public string county { get; set; }
            public string isp { get; set; }
            public string city_id { get; set; }
        }


        #region AJAX
 
        #region 获取Jsapi_Ticket
        private static string GetWeiXinJsapi_Ticket(string accessToken)
        {
            //
            //string tokenUrl = string.Format("https://qyapi.weixin.qq.com/cgi-bin/ticket/get?access_token={0}&type={1}", accessToken, "agent_config");
            string tokenUrl = string.Format("https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token={0} ", accessToken );
            var wc = new WebClient();
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
        public static string GetInfoMation(string url)
        { 
            try
            {
                string rtn = "";
                string jsapi_ticket = "";
                // url = HttpContext.Current.Request.Url.ToString();
                //url = "https://ctewechat.mitsumi.com.cn/Weixin/vote/FY_everyday.aspx";
                string sqlt = "SELECT TIKET,UPDATE_DATE FROM  WEIXIN_JSAPI_TICKET";
                DataTable dt = OracleOperateHelp.getDataTable(sqlt);

                if (DateTime.Compare(DateTime.Parse(dt.Rows[0]["UPDATE_DATE"].ToString()).AddHours(1.5), DateTime.Now) > 0)
                {
                    jsapi_ticket = dt.Rows[0]["TIKET"].ToString();
                }
                else
                {
                    string Jsapi_Ticket = GetWeiXinJsapi_Ticket(AccessToken.Instance.Access_Token);
                    JObject Jsapi_TicketJo = (JObject)JsonConvert.DeserializeObject(Jsapi_Ticket);
                    jsapi_ticket = Jsapi_TicketJo["ticket"].ToString();
                    using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                    {
                        conn.Open();
                        OracleCommand cmd = conn.CreateCommand();
                        OracleTransaction tran = conn.BeginTransaction();

                        string sql = "UPDATE WEIXIN_JSAPI_TICKET  SET   TIKET='" + jsapi_ticket + "',UPDATE_DATE=SYSDATE  ";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();

                    }
                }
               
                #region
                string noncestr = CreatenNonce_str(); 
                long timestamp = CreatenTimestamp();
                string outstring = "";
                string JS_SDK_Result = GetSignature(jsapi_ticket, noncestr, timestamp, url, out outstring);
                //拼接json串返回前台
                rtn = "{\"appid\":\"" + ConfigurationManager.AppSettings["CorpId"] + "\",\"jsapi_ticket\":\"" + jsapi_ticket + "\",\"noncestr\":\"" + noncestr + "\",\"timestamp\":\"" + timestamp + "\",\"outstring\":\"" + outstring + "\",\"signature\":\"" + JS_SDK_Result.ToLower() + "\"}";
                #endregion 
                   return rtn;
            }
            catch (Exception ex)
            {
                return "{\"appid\":\"" + ex.Message + "\",\"jsapi_ticket\":\"" + 123+ "\",\"noncestr\":\"" + 456 + "\",\"timestamp\":\"" + 777 + "\",\"outstring\":\"" + 888 + "\",\"signature\":\"" +999 + "\"}";
                
            }
        }
        #endregion

        #region

         
        [WebMethod]
        public static string UpdateAdress( string country, string province, string city, string district)
        {
            if (!string.IsNullOrEmpty(province))
            {
                try
                {
                    //生成tokcen 
                    using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                    {
                        conn.Open();
                        OracleCommand cmd = conn.CreateCommand();
                        OracleTransaction tran = conn.BeginTransaction();

                        string sql = "UPDATE WEIXIN_DOVTE_GZFY  SET   COUNTRY='" + country + "', LOCATION='" + province + "',LOC01='" + city + "',LOC02='" + district + "'  " +
                            " WHERE STAFFID='" + Rstaffid + "' AND YYYYMMDD=TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD'),'YYYY-MM-DD')";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();

                    }

                    return "{\"res\":\"ok\"}";
                }
                catch (Exception ex)
                {
                    return "{\"res\":\"" + ex.Message + "\"}";

                }
            }
            else
            {
                return "{\"res\":\"err\"}";
            }
        }
        #endregion


    }
}