using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe
{
    public partial class Salary_OvertimePay : System.Web.UI.Page
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
                    label_BASE_PAY_JS.Text = Request["js"].ToString().Trim();
                    label_OVERTIME1.Text = Request["overtime"].ToString().Trim();
                    label_O_P.Text = Request["O_P"].ToString().Trim();
                    double b = Convert.ToDouble(label_BASE_PAY_JS.Text);
                    double o = Convert.ToDouble(label_OVERTIME1.Text);
                    if (label_type.Text.ToString().Trim() == "休日")
                    {
                        Label_GongShi.Text = "计算公式=(工资基数÷21.75÷8)×2×加班小时";
                        Label_JieGuo.Text = "计算结果=("+label_BASE_PAY_JS.Text.ToString()+"÷21.75÷8)×2×"+label_OVERTIME1.Text+"="+Math.Round(((b/21.75/8)*2*o),2);
                    }
                    else if (label_type.Text.ToString().Trim() == "祝日")
                    {
                        Label_GongShi.Text = "计算公式=(工资基数÷21.75÷8)×3×加班小时";
                        Label_JieGuo.Text = "计算结果=(" + label_BASE_PAY_JS.Text.ToString() + "÷21.75÷8)×3×" + label_OVERTIME1.Text + "=" + Math.Round(((b / 21.75 / 8) * 3 * o), 2);
           
                    }
                    else
                    {
                        Label_GongShi.Text = "计算公式=(工资基数÷21.75÷8)×1.5×加班小时";
                        Label_JieGuo.Text = "计算结果=(" + label_BASE_PAY_JS.Text.ToString() + "÷21.75÷8)×1.5×" + label_OVERTIME1.Text + "=" + Math.Round(((b / 21.75 / 8) * 1.5 * o), 2);
           
                    }
                    this.Title = label_type.Text.ToString() + "加班费用明细";
                    labled.Text = label_type.Text.ToString() + "加班费用明细";
                }


            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}