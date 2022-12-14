using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_HBonusPay : System.Web.UI.Page
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
                    InitInfo();
                    this.Title = label_type.Text.ToString() + "明细";
                    labled.Text = label_type.Text.ToString() + "明细";

                }


            }

        }
        private void InitInfo()
        {
            try
            {
                string sql = "SELECT A.V_LATE1,A.V_LATE2, A.STAFFID,A.TYPE1,A.TYPE2,A.BASE_PAY_JS,A.EVALUATE,A.EVALUATE_FACTOR,A.V_BIG,A.BIG_PUNISHMENT,A.V_SMALL,A.SMALL_PUNISHMENT,A.ATTENDANCE_RATE,(A.ATTENDANCE_RATE*100)  AS ATTENDANCE_RATE_100 ,A.ATTENDANCE_FACTOR,A.V_ON_DUTY,A.V_SUM_DUTY,B.LATE1,B.LATE2,B.LATE3,A.LATE_OUT,A.LAST_BONUS_FACT,A.CURR_BONUS_FACT,A.BONUS_PAY FROM STAFF_SALARY_XL A  LEFT JOIN STAFF_KQ B  ON A.YYYYMM=B.YYYYMM AND A.STAFFID=B.STAFFID WHERE A.STAFFID ='" + label_newstaffid.Text + "'  AND A.YYYYMM='" + label_month.Text + "'";
                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_TYPE1.Text = dr["TYPE1"].ToString().Trim();
                    label_TYPE2.Text = dr["TYPE2"].ToString().Trim();
                    label_BASE_PAY_JS.Text = dr["BASE_PAY_JS"].ToString().Trim();
                    label_EVALUATE.Text = dr["EVALUATE"].ToString().Trim();
                    label_EVALUATE_FACTOR.Text = dr["EVALUATE_FACTOR"].ToString().Trim();
                    label_V_BIG.Text = dr["V_BIG"].ToString().Trim();
                    label_BIG_PUNISHMENT.Text = dr["BIG_PUNISHMENT"].ToString().Trim();
                    label_V_SMALL.Text = dr["V_SMALL"].ToString().Trim();
                    label_SMALL_PUNISHMENT.Text = dr["SMALL_PUNISHMENT"].ToString().Trim();
                    label_PUNISHMENT_OUT.Text = "0";
                    label_ATTENDANCE_RATE.Text = dr["ATTENDANCE_RATE"].ToString().Trim();
                    label_ATTENDANCE_RATE_100.Text = dr["ATTENDANCE_RATE_100"].ToString().Trim() + "%";
                    label_ATTENDANCE_FACTOR.Text = dr["ATTENDANCE_FACTOR"].ToString().Trim();
                    label_V_ON_DUTY.Text = dr["V_ON_DUTY"].ToString().Trim();
                    label_V_SUM_DUTY.Text = dr["V_SUM_DUTY"].ToString().Trim();
                    label_LATE1.Text = dr["LATE1"].ToString().Trim();
                    label_LATE2.Text = dr["LATE2"].ToString().Trim();
                    label_LATE3.Text = dr["LATE3"].ToString().Trim();
                    label_V_LATE1.Text = dr["V_LATE1"].ToString().Trim();
                    label_V_LATE2.Text = dr["V_LATE2"].ToString().Trim();
                    label_LATE_OUT.Text = dr["LATE_OUT"].ToString().Trim();
                    label_LAST_BONUS_FACT.Text = dr["LAST_BONUS_FACT"].ToString().Trim();
                    label_CURR_BONUS_FACT.Text = dr["CURR_BONUS_FACT"].ToString().Trim();
                    label_BONUS_PAY.Text = dr["BONUS_PAY"].ToString().Trim();
                    double on_duty = Convert.ToDouble(label_V_ON_DUTY.Text);
                    double sum_duty = Convert.ToDouble(label_V_SUM_DUTY.Text);
                    double v_big = Convert.ToDouble(label_V_BIG.Text);
                    double v_small = Convert.ToDouble(label_V_SMALL.Text);
                    double big = Convert.ToDouble(label_BIG_PUNISHMENT.Text);
                    double small = Convert.ToDouble(label_SMALL_PUNISHMENT.Text);
                    double punishmenout = v_big * big + v_small * small;
                    double late1 = Convert.ToDouble(label_LATE1.Text);
                    double late2 = Convert.ToDouble(label_LATE2.Text);
                    double late3 = Convert.ToDouble(label_LATE3.Text);
                    double v_late1 = Convert.ToDouble(label_V_LATE1.Text);
                    double v_late2 = Convert.ToDouble(label_V_LATE2.Text);
                    double js = Convert.ToDouble(label_BASE_PAY_JS.Text);
                    double late_out = Math.Round(late1 * v_late1 + late2 * v_late2 + late3 * js / 21.75 / 2, 2);
                    double last = Convert.ToDouble(label_LAST_BONUS_FACT.Text);
                    Label2.Text = "出勤率=广义出勤天数÷应出勤天数=" + on_duty + "÷" + sum_duty + "=" + Math.Round(on_duty / sum_duty, 2) + "=" + Math.Round(on_duty / sum_duty * 100) + "%";
                    Label4.Text = "记过扣除额=(大过标准×大过次数) +(小过标准×小过次数)=(" + v_big + "×" + big + ") +(" + v_small + "×" + small + ") =" + punishmenout;
                    label_PUNISHMENT_OUT.Text = punishmenout.ToString();
                    Label6.Text = "迟早额=(迟早一标准×迟早一次数)+(迟早二标准×迟早二次数)+(工资基数÷21.75÷2×迟早三次数)=(" + v_late1 + "×" + late1 + ")+(" + v_late2 + "×" + late2 + ")+(" + js + "÷21.75÷2×" + late3 + ")=" + late_out;
                    double cqxs = Convert.ToDouble(label_ATTENDANCE_FACTOR.Text);
                    double kkxs = Convert.ToDouble(label_EVALUATE_FACTOR.Text);
                    if (last < 0)
                    {
                        div5.Visible = true;
                        Label8.Text = "上个月实际奖金为负数，本月奖金补回来";
                        double curr = Math.Round((js / 11 * kkxs * cqxs - late_out - punishmenout + last), 2);
                        Label10.Text = "本月实际奖金=工资基数÷11×出勤率系数×考课系数-迟早额-记过扣除额 -(上月实际奖金×(-1))=" + js + "÷11×" + cqxs + "×" + kkxs + "-" + late_out + "-" + punishmenout + "-(" + last + "×(-1))=" + curr;

                        if (curr > 0)
                        {
                            Label13.Text = "本月实发奖金=本月实际奖金=" + curr;
                        }
                        else
                        {
                            Label13.Text = "本月实发奖金=0,下个月在奖金中扣除" + curr * -1;
                        }
                    }
                    else
                    {
                        double curr = Math.Round((js / 11 * kkxs * cqxs - late_out - punishmenout), 2);
                        Label10.Text = "本月实际奖金=工资基数÷11×出勤率系数×考课系数-迟早额-记过扣除额 =" + js + "÷11×" + cqxs + "×" + kkxs + "-" + late_out + "-" + punishmenout + "=" + curr;
                        div5.Visible = false;
                        if (curr > 0)
                        {
                            Label13.Text = "本月实发奖金=本月实际奖金=" + curr;
                        }
                        else
                        {
                            Label13.Text = "本月实发奖金=0,下个月在奖金中扣除" + curr * -1;
                        }
                    }

                    DataTable dt2 = OracleOperateHelp.getDataTable("SELECT EVALUATE,EVALUATE_FACTOR FROM EVALUATE_FACTOR_MONTH  WHERE YYYYMM='" + label_month.Text + "' ORDER BY ORDERID");
                    if (dt2.Rows.Count > 0)
                    {
                        GridView2.Caption = label_month.Text.ToString() + "月考课系数一览表";
                        GridView2.DataSource = dt2;
                        GridView2.DataBind();
                        GridView2.Visible = true;
                        div8.Visible = true;
                        for (int i = 0; i < GridView2.Rows.Count; i++)
                        {
                            string e = GridView2.Rows[i].Cells[0].Text;

                            if (e == label_EVALUATE.Text)
                            {

                                GridView2.Rows[i].BackColor = System.Drawing.Color.LightGreen;
                                break;
                            }
                        }
                        Label16.Text = "参照附表考课系数一览表,考课" + label_EVALUATE.Text + "对应考课系数为" + label_EVALUATE_FACTOR.Text;
                    }
                    else
                    {
                        div8.Visible = true;
                        Label16.Text = "参照考课系数一览表,考课" + label_EVALUATE.Text + "对应考课系数为" + label_EVALUATE_FACTOR.Text;

                    }

                    DataTable dt3 = OracleOperateHelp.getDataTable("SELECT ATTENDANCE_FACTOR,(ATTENDANCE_FROM*100||'%') AS ATTENDANCE_FROM,(CASE WHEN ATTENDANCE_FACTOR='1'   AND ATTENDANCE_FROM='1' THEN NULL ELSE  (ATTENDANCE_TO*100||'%') END) AS ATTENDANCE_TO FROM ATTENDANCE_FACTOR_MONTH  WHERE TYPE='合同' AND  YYYYMM='" + label_month.Text + "' ORDER BY ORDERID");
                    if (dt3.Rows.Count > 0)
                    {
                        GridView1.Caption = label_month.Text.ToString() + "月出勤率系数一览表";
                        GridView1.DataSource = dt3;
                        GridView1.DataBind();
                        GridView1.Visible = true;
                        div9.Visible = true;
                        for (int i = 0; i < GridView1.Rows.Count; i++)
                        {
                            string e = GridView1.Rows[i].Cells[2].Text;
                            string f = GridView1.Rows[i].Cells[0].Text;
                            if (e == label_ATTENDANCE_FACTOR.Text)
                            {
                                if (label_ATTENDANCE_RATE_100.Text == "100%")
                                {
                                    if (f == "100%")
                                    {
                                        GridView1.Rows[i].BackColor = System.Drawing.Color.LightGreen;
                                        break;
                                    }

                                }
                                else
                                {
                                    GridView1.Rows[i].BackColor = System.Drawing.Color.LightGreen;
                                    break;
                                }
                       
                            }
                        }
                        Label18.Text = "参照附表出勤率系数一览表,出勤率" + label_ATTENDANCE_RATE_100.Text + "对应出勤率系数为" + label_ATTENDANCE_FACTOR.Text;
                    }
                    else
                    {
                        div9.Visible = true;
                        Label18.Text = "参照出勤率系数一览表,考课" + label_ATTENDANCE_RATE_100.Text + "对应出勤率系数为" + label_ATTENDANCE_FACTOR.Text;

                    }
                }
                else
                {
                    label_TYPE1.Text = "网络错误,稍后重试";
                    label_TYPE1.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch
            {
                label_TYPE1.Text = "网络错误,稍后重试";
                label_TYPE1.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}