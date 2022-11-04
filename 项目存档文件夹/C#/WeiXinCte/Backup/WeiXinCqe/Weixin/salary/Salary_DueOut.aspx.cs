using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_DueOut : System.Web.UI.Page
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
                    InitInfo();
                }


            }
        }
        private void InitInfo()
        {
            string sql = "SELECT * FROM STAFF_SALARY_DUE_OUT  WHERE STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' ";
            try
            {

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_COMPETENCY_PAY.Text = dr["COMPETENCY_PAY"].ToString().Trim();
                    label_DUE_OUT.Text = dr["DUE_OUT"].ToString().Trim();
                    if (dr["MEMO"].ToString().Trim() !="")
                    Label2.Text = "实扣会费说明:"+dr["MEMO"].ToString().Trim();
                    Label_JieGuo.Text = "计算结果=" + label_COMPETENCY_PAY.Text.ToString().Trim() + "×3÷1000="+Math.Round((Convert.ToDouble(label_COMPETENCY_PAY.Text.ToString().Trim())*3/1000),2).ToString();
                    labletitle.Visible = false;
                    label_error.Text = "";
                }
                else
                {
                    label_COMPETENCY_PAY.Text ="0";
                    label_DUE_OUT.Text = "";
                    Label2.Text = "";
                    Label_JieGuo.Text = "计算结果=" + label_COMPETENCY_PAY.Text.ToString().Trim() + "×3÷1000=" + Math.Round((Convert.ToDouble(label_COMPETENCY_PAY.Text.ToString().Trim()) * 3 / 1000), 2).ToString();
                     
                    labletitle.Visible = true;
                    label_error.Text = "网络错误，稍后重试";

                }



            }
            catch
            {
                label_COMPETENCY_PAY.Text = "0";
                label_DUE_OUT.Text = "";
                Label2.Text = "";
                Label_JieGuo.Text = "应扣会费=" + label_COMPETENCY_PAY.Text.ToString().Trim() + "×3÷1000=" + Math.Round((Convert.ToDouble(label_COMPETENCY_PAY.Text.ToString().Trim()) * 3 / 1000), 2).ToString();
                     
                label_error.Text = "网络错误，稍后重试";
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}