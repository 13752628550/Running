using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.Services.Protocols;
using WeiXinWebApp;

namespace WeiXinCqe.api
{
    /// <summary>
    /// WebService 的摘要说明
    /// </summary>
   // [WebService(Namespace = "http://tempuri.org/WeiXinCqe.api")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    // [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        #region 发送离职信息 SendMes(string staffids)
        public string SendMes(string staffids)
        {
            //staffids="工号|工号|工号|...."
            string UserOID = staffids.Substring(0, staffids.Length - 1);

            string Message = "<a href='https://ctewechat.mitsumi.com.cn/Weixin/sendmessage/DepartureNotice.aspx'>您的离职申请已通过，请点击本信息仔细阅读“离职须知”。</a>";

            string responeJsonStr = "{";
            responeJsonStr += "\"touser\": \"" + UserOID + "\",";
            responeJsonStr += "\"msgtype\": \"text\",";
            responeJsonStr += "\"agentid\": \"0\",";
           // responeJsonStr += "\"agentid\": \"1000018\",";
            responeJsonStr += "\"text\": {";
            responeJsonStr += "  \"content\": \"" + Message + "\"";
            responeJsonStr += "},";
            responeJsonStr += "\"safe\":\"0\"";
            responeJsonStr += "}";

            string SMr = SendQYMessage(responeJsonStr, Encoding.UTF8);

            Message = "<a href='https://ctewechat.mitsumi.com.cn/Weixin/sendmessage/LeaveReason.aspx'>您的离职申请已通过，请点击上报离职原因。</a>";

            responeJsonStr = "{";
            responeJsonStr += "\"touser\": \"" + UserOID + "\",";
            responeJsonStr += "\"msgtype\": \"text\",";
            responeJsonStr += "\"agentid\": \"0\",";
            // responeJsonStr += "\"agentid\": \"1000018\",";
            responeJsonStr += "\"text\": {";
            responeJsonStr += "  \"content\": \"" + Message + "\"";
            responeJsonStr += "},";
            responeJsonStr += "\"safe\":\"0\"";
            responeJsonStr += "}";

            SMr += SendQYMessage(responeJsonStr, Encoding.UTF8);

            return SMr;
        }

        #endregion
        #region 发送各种文字信息
        [WebMethod]
        public string SendMessageTo(string staffids, string infos)
        {
            string newstaffids = "";
            string[] staffid = staffids.Split('|');
            for (int i = 0; i < staffid.Length; i++)
            {
                DataTable dt = OracleOperateHelp.getDataTable("SELECT WEIXIN_ID FROM WEIXIN_USERS WHERE (STAFFID='"+staffid[i].ToString()+"' OR NEWSTAFFID='"+ staffid[i].ToString() + "') AND ERRCODE IS NULL ");
                if (dt.Rows.Count > 0)
                {
                    newstaffids += dt.Rows[0]["WEIXIN_ID"].ToString()+"|";
                }

            }
            //staffids="工号|工号|工号|...."
            if (newstaffids.Length > 0)
            {
                string UserOID = newstaffids.Substring(0, newstaffids.Length - 1);

                string responeJsonStr = "{";
                responeJsonStr += "\"touser\": \"" + UserOID + "\",";
                responeJsonStr += "\"msgtype\": \"text\",";
                 responeJsonStr += "\"agentid\": \"0\",";
               // responeJsonStr += "\"agentid\": \"1000018\",";
                responeJsonStr += "\"text\": {";
                responeJsonStr += "  \"content\": \"" + infos + "\"";
                responeJsonStr += "},";
                responeJsonStr += "\"safe\":\"0\"";
                responeJsonStr += "}";

                string SMr = SendQYMessage(responeJsonStr, Encoding.UTF8);
                LogTextHelper.Error("发送信息记录：" + SMr); //记录用
                return SMr;
            }
            else
            {
                return "工号不存在";
            }
        }

        [WebMethod]

        public string SendMessageTo2(string staffids, string infos,string agentid)
        {
            string newstaffids = "";
            string[] staffid = staffids.Split('|');
            for (int i = 0; i < staffid.Length; i++)
            {
                DataTable dt = OracleOperateHelp.getDataTable("SELECT WEIXIN_ID FROM WEIXIN_USERS WHERE (STAFFID='" + staffid[i].ToString() + "' OR NEWSTAFFID='" + staffid[i].ToString() + "') AND ERRCODE IS NULL ");
                if (dt.Rows.Count > 0)
                {
                    newstaffids += dt.Rows[0]["WEIXIN_ID"].ToString() + "|";
                }

            }
            //staffids="工号|工号|工号|...."
            if (newstaffids.Length > 0)
            {
                string UserOID = newstaffids.Substring(0, newstaffids.Length - 1);

                string responeJsonStr = "{";
                responeJsonStr += "\"touser\": \"" + UserOID + "\",";
                responeJsonStr += "\"msgtype\": \"text\",";
                responeJsonStr += "\"agentid\": \""+ agentid + "\",";
                // responeJsonStr += "\"agentid\": \"1000018\",";
                responeJsonStr += "\"text\": {";
                responeJsonStr += "  \"content\": \"" + infos + "\"";
                responeJsonStr += "},";
                responeJsonStr += "\"safe\":\"0\"";
                responeJsonStr += "}";

                string SMr = SendQYMessage(responeJsonStr, Encoding.UTF8);
                LogTextHelper.Error("发送信息记录：" + SMr+">>>"+ newstaffids); //记录用
                return SMr;
            }
            else
            {
                return "工号不存在";
            }
        }
        #endregion

        #region 发送消息


        public string PostWebRequest(string postUrl, string paramData, Encoding dataEncode)
        {
            string ret = string.Empty;
            try
            {
                byte[] byteArray = dataEncode.GetBytes(paramData); //转化
                HttpWebRequest webReq = (HttpWebRequest)WebRequest.Create(new Uri(postUrl));
                webReq.Method = "POST";
                webReq.ContentType = "application/x-www-form-urlencoded";

                webReq.ContentLength = byteArray.Length;
                Stream newStream = webReq.GetRequestStream();
                newStream.Write(byteArray, 0, byteArray.Length);//写入参数
                newStream.Close();
                HttpWebResponse response = (HttpWebResponse)webReq.GetResponse();
                StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.Default);
                ret = sr.ReadToEnd();
                sr.Close();
                response.Close();
                newStream.Close();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return ret;
        }

        public string SendQYMessage(string paramData, Encoding dataEncode)
        {
            string accessToken = DbOracleUser.GetAppToken("1000004");
            string postUrl = string.Format("https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token={0}", accessToken);

            return PostWebRequest(postUrl, paramData, dataEncode);
        }

        #endregion
 

    }

}
