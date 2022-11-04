using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_PerfectAttendanceOut : System.Web.UI.Page
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
                    label_ADJUSTMENT_PAY1.Text = Request["P"].ToString().Trim();
                    label_ADJUSTMENT_PAY2.Text = Request["S"].ToString().Trim();
                    label_ADJUSTMENT_PAY3.Text = Request["O"].ToString().Trim();
                    label_ADJUSTMENT_PAY4.Text = Request["C"].ToString().Trim();
                    double s = Convert.ToDouble(label_ADJUSTMENT_PAY2.Text);
                    double o = Convert.ToDouble(label_ADJUSTMENT_PAY3.Text);
                    label_ADJUSTMENT_PAY2.Text += "/天";
                    Label_GongShi.Text = "计算公式=广义欠勤天数×扣除标准";
                    Label_JieGuo.Text = "计算结果=" +o.ToString()+"×" +s.ToString() + "=" +o*s;
                    if (o * s > Convert.ToDouble(label_ADJUSTMENT_PAY1.Text))
                    {
                        Label_JieGuo.Text += "   计算结果大于精勤总额，精勤扣总额=精勤总额";
                    }
           
                }


            }
        }
    
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}