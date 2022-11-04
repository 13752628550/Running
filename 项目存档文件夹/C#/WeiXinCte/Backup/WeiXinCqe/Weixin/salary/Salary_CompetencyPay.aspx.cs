using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_CompetencyPay : System.Web.UI.Page
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
                string sql = " SELECT  A.V_LOW_SLR,A.WELFARE_PAY,A.PERFECT_ATTENDANCE_PAY,A.RANK,A.HF,A.STAFFID,A.TOPDEPTNAME,A.WORK_8,A.WORK_9,A.WORK_10,A.TYPE2,A.DATE_IN,A.BASE_GIVE,A.COMPETENCY_PAY,B.HF_LEVEL,B.HF_BASE,B.HF_RATE FROM STAFF_SALARY_XL A LEFT JOIN SLR_HF_MONTH B ON A.YYYYMM=B.YYYYMM   WHERE A.STAFFID='" + label_newstaffid.Text + "' AND A.YYYYMM='" + label_month.Text + "'  ORDER BY B.HF_LEVEL";


                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    label_TECH_PAY_OLD.Text = dt.Rows[0]["BASE_GIVE"].ToString();
                    label_TECH_PAY.Text = dt.Rows[0]["COMPETENCY_PAY"].ToString();
                    label_TYPE2.Text = dt.Rows[0]["TYPE2"].ToString();
                    label_TECH_POST.Text = dt.Rows[0]["RANK"].ToString();
                    label3.Text = dt.Rows[0]["HF"].ToString();
                    label_work_8.Text = dt.Rows[0]["WORK_8"].ToString();
                    label_work_9.Text = dt.Rows[0]["WORK_9"].ToString();
                    label_work_10.Text = dt.Rows[0]["WORK_10"].ToString();
                    label6.Text = dt.Rows[0]["V_LOW_SLR"].ToString();
                    label9.Text = dt.Rows[0]["WELFARE_PAY"].ToString();
                    label10.Text = dt.Rows[0]["PERFECT_ATTENDANCE_PAY"].ToString();
                    label11.Text = dt.Rows[0]["BASE_GIVE"].ToString();
                    label_topdeptname.Text = dt.Rows[0]["TOPDEPTNAME"].ToString();
                    GridView2.Caption = "等级号俸表";
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    for (int i = 0; i < GridView2.Rows.Count; i++)
                    {
                        string type = GridView2.Rows[i].Cells[0].Text;
                        if (type == label_TECH_POST.Text)
                        {
                            label_rank.Text = GridView2.Rows[i].Cells[1].Text;
                            label_hf.Text = GridView2.Rows[i].Cells[2].Text;
                            GridView2.Rows[i].BackColor = System.Drawing.Color.LightGreen;
                            break;
                        }
                    }
                    if (label_TECH_POST.Text == "")
                    {
                        Label111.Text = "说明:个人固定值";
                        div1.Visible = true;
                        GridView2.Visible = false;
                        divhf.Visible = false;
                        divrank.Visible = false;
                        if ((label_TYPE2.Text == "季节") || (label_TYPE2.Text == "派遣"))
                        {
                            div1.Visible = true;
                     
                                Label111.Text = "说明:" + label_TYPE2.Text + "人员为个人固定值";
                            
                        }
                    }
                    else
                    {
                        div3.Visible = true;
                        double hf = Convert.ToDouble(label3.Text);
                        double rankbase = Convert.ToDouble(label_rank.Text);
                        double hfbase = Convert.ToDouble(label_hf.Text);
                        if (hf == 0)
                        {
                            Label_JieGuo.Text = "因为号俸为0，故职能给标准=对应职级基数=" + rankbase + "";
                        }
                        else
                        {
                            Label_JieGuo.Text = "职能给标准=对应职级基数+(号俸-1)×对应号俸系数=" + rankbase + "+(" + hf + "-1)×"+hfbase+"="+Math.Round((rankbase+(hf-1)*hfbase),2);
                        }
                      
                        
                            if (label_TECH_PAY_OLD.Text != label_TECH_PAY.Text)
                            {//有试用期，实习期

                                div1.Visible = true;
                                double work8 = Convert.ToDouble(label_work_8.Text);
                                double work9 = Convert.ToDouble(label_work_9.Text);
                                double work10 = Convert.ToDouble(label_work_10.Text);
                                double js = Convert.ToDouble(label_TECH_PAY_OLD.Text.ToString().Trim());
                                Label111.Text = "说明:本月理论应出勤天数" + (work8 + work9 + work10) + "天中,";

                                Label111.Text += "试用期" + label_work_8.Text + "天, ";


                                Label111.Text += "实习期" + label_work_9.Text + "天 ,   ";

                                Label111.Text += "正式期" + label_work_10.Text + "天。";
                                Label111.Text += "试用期发放80%，实习期发放90%，正式期发放100% 。";
                                div2.Visible = true;
                                Label_GongShi.Text = "计算公式:实发职能给=(职能给标准×0.8×试用期天数÷理论应出勤天数)+(职能给标准×0.9×实习期天数÷理论应出勤天数)+(职能给标准×正式期天数÷理论应出勤天数)";
                                Label_GongShi.Text += "=(" + js + "×0.8×" + work8 + "÷" + (work8 + work9 + work10) + ")+(" + js + "×0.9×" + work9 + "÷" + (work8 + work9 + work10) + ")+(" + js + "×" + work10 + "÷" + (work8 + work9 + work10) + ")=" + Math.Round(((js * 0.8 * work8 / (work8 + work9 + work10)) + (js * 0.9 * work9 / (work8 + work9 + work10)) + (js * work10 / (work8 + work9 + work10))), 2);
                                label11.Text = Math.Round(((js * 0.8 * work8 / (work8 + work9 + work10)) + (js * 0.9 * work9 / (work8 + work9 + work10)) + (js * work10 / (work8 + work9 + work10))), 2).ToString();
                            }
                        

                    }

                    double v_low = Convert.ToDouble(label6.Text);
                    double w = Convert.ToDouble(label9.Text);
                    double p = Convert.ToDouble(label10.Text);
                    double now = Convert.ToDouble(label11.Text);
                    if (now + p + w < v_low)
                    {
                        div4.Visible = true;
                        Label5.Text = "特别处理:职能给(" + now + ")+福利(" + w + ")+精勤(" + p + ") 小于青岛市最低工资标准(" + v_low + ")，所以 职能给强制修改为青岛市最低工资标准-精勤-福利="+v_low+"-"+p+"-"+w+"="+(v_low-p-w);
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
                    label3.Text = "";
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