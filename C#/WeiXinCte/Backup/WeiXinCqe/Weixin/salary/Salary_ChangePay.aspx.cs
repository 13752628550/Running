using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe
{
    public partial class Salary_ChangePay : System.Web.UI.Page
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
                    label_MORNING.Text = Request["M"].ToString().Trim();
                    label_VMORNING.Text = Request["V_M"].ToString().Trim();
                    label_MIDDLE.Text = Request["D"].ToString().Trim();
                    label_VMIDDLE.Text = Request["V_D"].ToString().Trim();
                    label_NIGHT.Text = Request["N"].ToString().Trim();
                    label_VNIGHT.Text = Request["V_N"].ToString().Trim();
                    label_PAY43.Text = Request["P"].ToString().Trim();
                    label_VPAY43.Text = Request["V_P"].ToString().Trim();
                    label_V_SUM_DUTY.Text = Request["S"].ToString().Trim();
                    label_CHANGE_PAY.Text = Request["C"].ToString().Trim();
                    double m = Convert.ToDouble(label_MORNING.Text);
                    double vm = Convert.ToDouble(label_VMORNING.Text);
                    double d = Convert.ToDouble(label_MIDDLE.Text);
                    double vd = Convert.ToDouble(label_VMIDDLE.Text);
                    double n = Convert.ToDouble(label_NIGHT.Text);
                    double vn = Convert.ToDouble(label_VNIGHT.Text);
                    double p = Convert.ToDouble(label_PAY43.Text);
                    double vp = Convert.ToDouble(label_VPAY43.Text);
                    double t = Convert.ToDouble(label_V_SUM_DUTY.Text);
                    Label_GongShi.Text = "计算公式=(早班天数×早班补贴标准)+(中班天数×中班补贴标准)+(夜班天数×夜班补贴标准)+(4班3倒天数÷应出勤天数)×4班3倒补贴标准";
                    if (label_V_SUM_DUTY.Text.ToString().Trim() == "0")
                    {
                        Label_JieGuo.Text = "计算结果=("+m.ToString().Trim()+"×"+vm.ToString()+")+("+d.ToString().Trim()+"×"+vd.ToString().Trim()+")+("+n.ToString().Trim()+"×"+vn.ToString().Trim()+")+("+p.ToString()+"÷"+t.ToString().Trim()+")×"+vp+"=0";

                    }
                    else
                    {
                        Label_JieGuo.Text = "计算结果=(" + m.ToString().Trim() + "×" + vm.ToString() + ")+(" + d.ToString().Trim() + "×" + vd.ToString().Trim() + ")+(" + n.ToString().Trim() + "×" + vn.ToString().Trim() + ")+(" + p.ToString() + "÷" + t.ToString().Trim() + ")×" + vp + "="+(Math.Round((m*vm+d*vd+n*vn+(p/t)*vp),2));

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