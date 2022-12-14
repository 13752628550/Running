using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_SbOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["staffid"] == null)
                {
                    string errstr = "非法打开页面";
                    Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
                }
                else
                {
                    label_newstaffid.Text = Request["staffid"].ToString().Trim();
                    label_month.Text = Server.UrlDecode(Request["oldmonth"].ToString().Trim());
                    label_type.Text = Request["oldtype"].ToString().Trim();
                    label_stafftype.Text = Request["C"].ToString().Trim();
                    InitInfo();
                }


            }
        }
        private void InitInfo()
        {
            string sql = "  SELECT A.SB_INDEX,A.RETIRE_C,A.RETIRE_P, A.JOBLESS_C, A.JOBLESS_P,A.MATER_C,A.INJURY_C,A.MEDI_C,A.MATER_P,A.INJURY_P,A.MEDI_P,A.SB_SUM_C,A.SB_SUM_P  FROM STAFF_SALARY_XL A   WHERE A.STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' AND A.YYYYMM='" + label_month.Text.ToString() + "'";
            try
            {
               

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_ADJUSTMENT_PAY1.Text = dr["SB_INDEX"].ToString().Trim();
                    label_ADJUSTMENT_PAY2.Text = dr["RETIRE_P"].ToString().Trim();
                    label_ADJUSTMENT_PAY3.Text = dr["MEDI_P"].ToString().Trim();
                    label_ADJUSTMENT_PAY4.Text = dr["JOBLESS_P"].ToString().Trim();
                    label_ADJUSTMENT_PAY5.Text = dr["INJURY_P"].ToString().Trim();
                    label_ADJUSTMENT_PAY6.Text = dr["MATER_P"].ToString().Trim();

                    label_ADJUSTMENT_PAY.Text = dr["SB_SUM_P"].ToString().Trim();
                    labletitle.Visible = false;
                    label_error.Text = "";
                    Label2.Text ="";
                    if (label_stafftype.Text == "返聘" || label_stafftype.Text == "实习")
                    {
                        label_ADJUSTMENT_PAY1.Text = "0";
                        Label2.Text ="特别说明:"+ label_stafftype.Text + "人员不交保险";
                    }
         
                }
                else
                {
                    label_ADJUSTMENT_PAY1.Text = "0";
                    label_ADJUSTMENT_PAY2.Text = "0";
                    label_ADJUSTMENT_PAY3.Text = "0";
                    label_ADJUSTMENT_PAY4.Text = "0";
                    label_ADJUSTMENT_PAY5.Text = "0";
                    label_ADJUSTMENT_PAY6.Text = "0";

                    label_ADJUSTMENT_PAY.Text = "0";

                    Label2.Text = "";
                    labletitle.Visible = true;
                    label_error.Text = "网络错误，稍后重试";

                }



            }
            catch
            {

                Label2.Text = "";
                label_error.Text = "网络错误，稍后重试";
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}