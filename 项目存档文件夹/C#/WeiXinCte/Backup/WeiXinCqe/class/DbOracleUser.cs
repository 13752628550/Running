using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using WeiXinWebApp;

namespace WeiXinCqe
{
    public class DbOracleUser
    {
        /// <summary>
        /// 通过微信id，获取关联的用户id
        /// </summary>
        /// <param name="weixin_id">微信id</param>
        /// <returns>OracleUser</returns>
        public static OracleUser GetOracleUser(string weixin_id)
        {
            OracleUser oracleuser = new OracleUser();
            DataTable dt = OracleOperateHelp.getDataTable("SELECT WEIXIN_ID,WEIXIN_NAME AS STAFFNAME,STAFFID,NVL(NEWSTAFFID,STAFFID) AS NEWSTAFFID,WEIXIN_STATUS,TO_CHAR(NVL(NEWSTAFFDATE,SYSDATE),'YYYY-MM-DD') AS NEWSTAFFDATE FROM WEIXIN_USERS  WHERE STATUS<>'0'  AND WEIXIN_ID='" + weixin_id + "'");
            if (dt.Rows.Count > 0)
            {
                oracleuser.WeiXin_ID = dt.Rows[0]["WEIXIN_ID"].ToString().Trim();
                oracleuser.Staffname = dt.Rows[0]["STAFFNAME"].ToString().Trim();
                oracleuser.Staffid = dt.Rows[0]["STAFFID"].ToString().Trim();
                oracleuser.NewStaffid = dt.Rows[0]["NEWSTAFFID"].ToString().Trim();
                oracleuser.WeiXin_Status = dt.Rows[0]["WEIXIN_STATUS"].ToString().Trim();
                oracleuser.NewStaffDate = dt.Rows[0]["NEWSTAFFDATE"].ToString().Trim();
            }
            else
            {
                LogTextHelper.Error(string.Format("获取数据库oracleuser失败:"+weixin_id));
            }
            return oracleuser;
        }
    }
}