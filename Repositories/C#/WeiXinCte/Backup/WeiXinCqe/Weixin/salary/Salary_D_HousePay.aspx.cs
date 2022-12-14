using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe.Weixin.salary
{
    public partial class Salary_D_HousePay : System.Web.UI.Page
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
                    label_HOUSE_PAY_COUNT.Text = Request["H_C"].ToString().Trim();
                    label_V_HOUSE_PAY.Text = Request["H_P"].ToString().Trim();
                    label_HOUSE_PAY.Text = Request["H_PP"].ToString().Trim();
                    double b = Convert.ToDouble(label_V_HOUSE_PAY.Text);
                    double o = Convert.ToDouble(label_HOUSE_PAY_COUNT.Text);
                    Label_GongShi.Text = "计算公式=住宅天数×(补贴标准÷21.75)";
              


                        Label_JieGuo.Text = "计算结果=" + o + "×("+b+"÷21.75)=" + Math.Round(o*(b/21.75), 2);

                        if (Math.Round(o * (b / 21.75), 2) > b)
                        {
                            Label_JieGuo.Text += "=" + b;
                            Label1.Visible = true;
                        }
                        else
                        {
                            Label1.Visible = false;
                        }
                    


                    this.Title = label_type.Text.ToString() + "明细";
                    labled.Text = label_type.Text.ToString() + "明细";
                }


            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}