using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_PerfectAttendancePay : System.Web.UI.Page
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
                    label_yyyy.Text = label_month.Text.Substring(0, 4);
                    init();
                    this.Title = label_type.Text.ToString() + "明细";
                    labled.Text = label_type.Text.ToString() + "明细";

                }


            }

        }
        private void init()
        {
            try
            {
                string sql = " SELECT A.TOPDEPTNAME,A.WORK_8,A.WORK_9,A.WORK_10,A.TYPE2,A.DATE_IN,A.PERFECT_ATTENDANCE_PAY_OLD,A.PERFECT_ATTENDANCE_PAY  FROM  STAFF_SALARY_XL A   WHERE A.STAFFID='" + label_newstaffid.Text + "' AND A.YYYYMM='" + label_month.Text + "'  ";


                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    label_TECH_PAY_OLD.Text = dt.Rows[0]["PERFECT_ATTENDANCE_PAY_OLD"].ToString();
                    label_TECH_PAY.Text = dt.Rows[0]["PERFECT_ATTENDANCE_PAY"].ToString();
                    label_TYPE2.Text = dt.Rows[0]["TYPE2"].ToString();
                    label_work_8.Text = dt.Rows[0]["WORK_8"].ToString();
                    label_work_9.Text = dt.Rows[0]["WORK_9"].ToString();
                    label_work_10.Text = dt.Rows[0]["WORK_10"].ToString();
                    label_topdeptname.Text = dt.Rows[0]["TOPDEPTNAME"].ToString();

                    if (label_TECH_PAY_OLD.Text == "0")
                    {
                        Label11.Text = "说明:您没有精勤";
                        div1.Visible = true;

                    }
                    else
                    {

                        if (label_TECH_PAY_OLD.Text != label_TECH_PAY.Text)
                        {//有试用期，实习期

                            div1.Visible = true;
                            double work8 = Convert.ToDouble(label_work_8.Text);
                            double work9 = Convert.ToDouble(label_work_9.Text);
                            double work10 = Convert.ToDouble(label_work_10.Text);
                            double js = Convert.ToDouble(label_TECH_PAY_OLD.Text.ToString().Trim());
                            Label11.Text = "说明:本月理论应出勤天数" + (work8 + work9 + work10) + "天中,";

                            Label11.Text += "试用期" + label_work_8.Text + "天, ";


                            Label11.Text += "实习期" + label_work_9.Text + "天 ,   ";

                            Label11.Text += "正式期" + label_work_10.Text + "天。";
                            Label11.Text += "试用期发放80%，实习期发放90%，正式期发放100% 。";
                            div2.Visible = true;
                            Label_GongShi.Text = "计算公式:实发精勤=(精勤标准×0.8×试用期天数÷理论应出勤天数)+(精勤标准×0.9×实习期天数÷理论应出勤天数)+(精勤标准×正式期天数÷理论应出勤天数)";
                            Label_GongShi.Text += "=(" + js + "×0.8×" + work8 + "÷" + (work8 + work9 + work10) + ")+(" + js + "×0.9×" + work9 + "÷" + (work8 + work9 + work10) + ")+(" + js + "×" + work10 + "÷" + (work8 + work9 + work10) + ")=" + Math.Round(((js * 0.8 * work8 / (work8 + work9 + work10)) + (js * 0.9 * work9 / (work8 + work9 + work10)) + (js * work10 / (work8 + work9 + work10))), 2);

                        }


                    }

                }
                else
                {

                    label_topdeptname.Text = "";
                    label_TECH_PAY_OLD.Text = "";
                    label_TECH_PAY.Text = "";
                    label_TYPE2.Text = "";
                    label_TECH_POST.Text = "";
                    label_work_8.Text = "";
                    label_work_9.Text = "";
                    label_work_10.Text = "";
                    Label_GongShi.Text = "";
                    Label_JieGuo.Text = "";
                    label_TYPE2.Text = "网络错误,稍后重试";
                    label_TYPE2.ForeColor = System.Drawing.Color.Red;

                }
            }
            catch
            {

                label_TECH_PAY_OLD.Text = "";
                label_TECH_PAY.Text = "";
                label_TYPE2.Text = "";
                label_TECH_POST.Text = "";
                label_work_8.Text = "";
                label_work_9.Text = "";
                label_work_10.Text = "";
                Label_GongShi.Text = "";
                Label_JieGuo.Text = "";
                label_TYPE2.Text = "网络错误,稍后重试";
                label_TYPE2.ForeColor = System.Drawing.Color.Red;
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}