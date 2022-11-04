using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe.Weixin
{
    public partial class Attendance_CalendayInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["staffid"] == null || Request.Cookies["cqe"] == null)
                {
                    string errstr = "非法打开页面";
                    Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
                }
                else
                {
                    //if (Request.Cookies["cqe"].Value.ToString().Trim() == "2")
                   // {
                   //     Response.Redirect("~/Weixin/error/NoRight.aspx");
                  //  }
                   // else
                   // {
                        label_newstaffid.Text = Request["staffid"].ToString().Trim();
                        label_yyyymmdd.Text = Server.UrlDecode(Request["olddate"].ToString().Trim());
                        label_month.Text = Server.UrlDecode(Request["oldmonth"].ToString().Trim());
                        Labeltitle.Text = label_yyyymmdd.Text + "出勤情况";
                        InitInfo();
                  //  }
                }


            }

        }
        private void InitInfo()
        {
            string sql = "SELECT TIMEOFF_TYPE, ID,YYYYMM,TO_CHAR(YYYYMMDD,'YYYY-MM-DD') AS YYYYMMDD,STAFFID,STAFFNAME,TOPDEPTNAME,DEPTNAME,DEPTCODE,CLASSID,CLASSNAME,CLASSTYPE,CLASSWORKTYPE,CLASSWORKMAKER,OVERTIME_TYPE,TO_CHAR(LILUN_IN_DATE,'YYYY-MM-DD HH24:MI') AS LILUN_IN_DATE,TO_CHAR(LILUN_OUT_DATE,'YYYY-MM-DD HH24:MI') AS LILUN_OUT_DATE,TO_CHAR(CHECK_IN_DATE,'YYYY-MM-DD HH24:MI:SS') AS CHECK_IN_DATE,TO_CHAR(CHECK_OUT_DATE,'YYYY-MM-DD HH24:MI:SS') AS CHECK_OUT_DATE,TO_CHAR(WORK_IN_DATE,'YYYY-MM-DD HH24:MI') AS WORK_IN_DATE,TO_CHAR(WORK_OUT_DATE,'YYYY-MM-DD HH24:MI') AS WORK_OUT_DATE,OVERTIME_PLAN,OVERTIME_FACT,OVERTIME_FACT_XL,WORK_FACT_H,REST_FACT_M,EDIT_LOCK_STATUS,(NVL(OVERTIME_FACT,0)+NVL(OVERTIME_FACT_XL,2)) AS OVERTIME,IN_TERMINAL,OUT_TERMINAL,(CASE WHEN CLASSWORKMAKER='R' THEN '休息' ELSE '出勤' END) AS CLASSWORKMAKER_M,CLASSWORKMAKER,OVERTIME_PLAN FROM V_EVERYDAY_STAFF_CHECK_OFF WHERE STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' AND YYYYMMDD=TO_DATE('" + label_yyyymmdd.Text + "','YYYY-MM-DD')";

            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count == 0)
            {
                clear();
                label_error.Text = "未能检索到信息，稍后重试";
                label_error.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                label_error.Text = "基本信息";
                DataRow dr = dt.Rows[0];              
                label_staffid.Text = dr["STAFFID"].ToString().Trim();
                label_StaffName.Text = dr["STAFFNAME"].ToString().Trim();
                label_topdeptname.Text = dr["TOPDEPTNAME"].ToString().Trim();
                label_deptname.Text = dr["DEPTNAME"].ToString().Trim();
                label_jiaotileibie.Text = dr["CLASSTYPE"].ToString().Trim();
                label_jiaoti.Text = dr["CLASSWORKTYPE"].ToString().Trim();
                label_jiabanleibie.Text = dr["OVERTIME_TYPE"].ToString().Trim();
                label_chuqin.Text = dr["CLASSWORKMAKER_M"].ToString().Trim();
                label_qianqin.Text = dr["TIMEOFF_TYPE"].ToString().Trim();
                label_shangbandaka.Text = dr["CHECK_IN_DATE"].ToString().Trim();
                label_xiabandaka.Text = dr["CHECK_OUT_DATE"].ToString().Trim();
                label_gongzuokaishi.Text = dr["WORK_IN_DATE"].ToString().Trim();
                label_gongzuojieshu.Text = dr["WORK_OUT_DATE"].ToString().Trim();
                label_jiabanshenqing.Text = dr["OVERTIME_PLAN"].ToString().Trim()+"H";
                label_jiabanshiji.Text = dr["OVERTIME"].ToString().Trim()+"H";
                label_gongzuoxiaoshi.Text = dr["WORK_FACT_H"].ToString().Trim()+"H";
                label_xiuxifenzhong.Text = dr["REST_FACT_M"].ToString().Trim()+"M";
               
            }
        }
        private void clear()
        {
            
            label_deptname.Text = "";
            label_StaffName.Text = "";
            label_staffid.Text = "";
            label_topdeptname.Text = "";
            label_jiaotileibie.Text = "";
            label_jiaoti.Text = "";
            label_jiabanleibie.Text = "";
            label_chuqin.Text = "";
            label_qianqin.Text = "";
            label_shangbandaka.Text = "";
            label_xiabandaka.Text = "";
            label_gongzuokaishi.Text = "";
            label_gongzuojieshu.Text = "";
            label_jiabanshenqing.Text = "";
            label_jiabanshiji.Text = "";
            label_gongzuoxiaoshi.Text = "";
            label_xiuxifenzhong.Text = "";

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/attendance/Attendance.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim())
                + "&oldvalue=" + Server.UrlEncode("个人日历"));

        }
    }
}