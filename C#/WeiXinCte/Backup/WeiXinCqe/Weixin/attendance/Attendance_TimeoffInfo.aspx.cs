using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Attendance_TimeoffInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["id"] == null)
                {
                    string errstr = "非法打开页面";
                    Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
                }
                else
                {
                    label_newstaffid.Text = Request["id"].ToString().Trim();
      
                    InitInfo();
                }


            }

        }
        private void InitInfo()
        {
            string sql = "SELECT ID,STAFFID,STAFFNAME,LEN,TIMEOFF_TYPE,TO_CHAR(BEGIN_DATE,'YYYY-MM-DD') AS BEGIN_DATE,TO_CHAR(END_DATE,'YYYY-MM-DD') AS END_DATE,TO_CHAR(WORK_DATE,'YYYY-MM-DD') AS WORK_DATE FROM STAFF_TIMEOFF WHERE ID='" + label_newstaffid.Text.ToString().Trim() + "'";

            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count == 0)
            {
                clear();
                label_error.Text = "未能检索到信息，稍后重试";
                label_error.ForeColor = System.Drawing.Color.Red;
                labletitle.Visible = true;
            }
            else
            {
                labletitle.Visible = false;
                DataRow dr = dt.Rows[0];
                label_staffid.Text = dr["STAFFID"].ToString().Trim();
                label_StaffName.Text = dr["STAFFNAME"].ToString().Trim();
                label_topdeptname.Text = dr["TIMEOFF_TYPE"].ToString().Trim();
                label_deptname.Text = dr["BEGIN_DATE"].ToString().Trim();
                label_jiaotileibie.Text = dr["END_DATE"].ToString().Trim();
                label_jiaoti.Text = dr["LEN"].ToString().Trim();
                if (label_topdeptname.Text == "振替休假")
                {
                    label_begin.Text = "休假日期";
                    label_end.Text = "出勤日期";
                    label_jiaotileibie.Text = dr["WORK_DATE"].ToString().Trim();
                    labeldiv.Visible = false;
                }else   if (label_topdeptname.Text == "出差" || label_topdeptname.Text == "研修")
                {
                    labeldiv.Visible = false;
                }
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

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/attendance/Attendance.aspx?oldvalue=" + Server.UrlEncode("欠勤记录"));

        }
    }
}