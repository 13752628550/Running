using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_PostPay : System.Web.UI.Page
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
                    if (GridView2.Visible)
                    {
                        for (int i = 0; i < GridView2.Rows.Count; i++)
                        {
                            string type = GridView2.Rows[i].Cells[0].Text;
                            if (type == label_TECH_POST.Text)
                            {
                                label_TECH_PAY_OLD.Text = GridView2.Rows[i].Cells[1].Text;
                                GridView2.Rows[i].BackColor = System.Drawing.Color.LightGreen;
                                break;
                            }
                        }
                    }
                }


            }

        }
        private void init()
        {
            try
            {
                string sql = " SELECT A.TOPDEPTNAME,A.WORK_8,A.WORK_9,A.WORK_10,A.TYPE2,A.DATE_IN,A.POST,A.POST_PAY_OLD,A.POST_PAY,B.POST AS BPOST,B.P_PAY AS BPAY FROM  STAFF_SALARY_XL A LEFT JOIN SLR_POST_MONTH B ON A.YYYYMM=B.YYYYMM   WHERE A.STAFFID='" + label_newstaffid.Text + "' AND A.YYYYMM='" + label_month.Text + "'  ORDER BY B.ORDERID";


                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    label_TECH_PAY_OLD.Text = dt.Rows[0]["POST_PAY_OLD"].ToString();
                    label_TECH_PAY.Text = dt.Rows[0]["POST_PAY"].ToString();
                    label_TYPE2.Text = dt.Rows[0]["TYPE2"].ToString();
                    label_TECH_POST.Text = dt.Rows[0]["POST"].ToString();
                    label_work_8.Text = dt.Rows[0]["WORK_8"].ToString();
                    label_work_9.Text = dt.Rows[0]["WORK_9"].ToString();
                    label_work_10.Text = dt.Rows[0]["WORK_10"].ToString();
                    label_topdeptname.Text = dt.Rows[0]["TOPDEPTNAME"].ToString();
                    GridView2.Caption = "行政补贴表";
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    if (label_TECH_POST.Text == "")
                    {
                        Label11.Text = "说明:没有行政职务，所以行政补贴为0";
                        div1.Visible = true;
                        GridView2.Visible = false;
                    }
                    else
                    {
                        if ((label_topdeptname.Text == "人事付") || (label_TYPE2.Text == "季节") || (label_TYPE2.Text == "派遣"))
                        {
                            div1.Visible = true;
                            if (label_topdeptname.Text == "人事付")
                            {
                                Label11.Text = "说明:人事付人员没有行政补贴";
                            }
                            else
                            {
                                Label11.Text = "说明:" + label_TYPE2.Text + "人员没有行政补贴";
                            }
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
                                Label_GongShi.Text = "计算公式:实发行政补贴=(行政补贴标准×0.8×试用期天数÷理论应出勤天数)+(行政补贴标准×0.9×实习期天数÷理论应出勤天数)+(行政补贴标准×正式期天数÷理论应出勤天数)";
                                Label_GongShi.Text += "=(" + js + "×0.8×" + work8 + "÷" + (work8 + work9 + work10) + ")+(" + js + "×0.9×" + work9 + "÷" + (work8 + work9 + work10) + ")+(" + js + "×" + work10 + "÷" + (work8 + work9 + work10) + ")=" + Math.Round(((js * 0.8 * work8 / (work8 + work9 + work10)) + (js * 0.9 * work9 / (work8 + work9 + work10)) + (js * work10 / (work8 + work9 + work10))), 2);

                            }
                        }

                    }

                }
                else
                {
                    GridView2.Visible = false;

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
                GridView2.Visible = false;



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