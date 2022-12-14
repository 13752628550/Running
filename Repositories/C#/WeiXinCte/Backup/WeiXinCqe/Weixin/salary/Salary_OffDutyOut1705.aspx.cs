using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe.Weixin.salary
{
    public partial class Salary_OffDutyOut1706 : System.Web.UI.Page
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
            string sql = " SELECT   A.YYYYMM,A.STAFFID,RANK,TO_CHAR(DATE_IN,'YYYY-MM-DD') AS DATE_IN,TO_CHAR(ADD_MONTHS(DATE_IN,2)-1,'YYYY-MM-DD') AS DATE_TEST,TO_CHAR(DATE_OUT,'YYYY-MM-DD') AS DATE_OUT,(BASE_PAY_JS-PERFECT_ATTENDANCE_PAY) AS BASE_PAY_JS,(BACK1 +BACK4+ V_OFF_DUTY) AS SUMOUT,(ON_DUTY + PUBLIC_LEAVE) AS SUMIN,OFF_DUTY_OUT,TO_CHAR(C.BEGIN_DATE,'YYYY-MM-DD') AS BEGIN_DATE,TO_CHAR(C.END_DATE,'YYYY-MM-DD') AS END_DATE,NVL(B.STAFFID,'') AS NOSTAFF  FROM STAFF_SALARY_XL A LEFT JOIN STAFF_NO_PROBATION_PERIOD B ON A.STAFFID =B.STAFFID  LEFT JOIN SLR_INTERVAL C ON A.YYYYMM=C.YYYYMM  WHERE      A.STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' AND A.YYYYMM='" + label_month.Text.ToString() + "'";
            try
            {


                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_RANK.Text = dr["RANK"].ToString().Trim();
                    label_OFF_DUTY_OUT.Text = dr["OFF_DUTY_OUT"].ToString().Trim();
                    label_DATE_IN.Text = dr["DATE_IN"].ToString().Trim();
                    label_DATE_TEST.Text = dr["DATE_TEST"].ToString().Trim();
                    label_DATE_OUT.Text = dr["DATE_OUT"].ToString().Trim();
                    label_BASE_PAY_JS.Text = dr["BASE_PAY_JS"].ToString().Trim();
                    label_SUMOUT.Text = dr["SUMOUT"].ToString().Trim();
                    label_SUMIN.Text = dr["SUMIN"].ToString().Trim();
                    label_begin_date.Text = dr["BEGIN_DATE"].ToString().Trim();
                    label_end_date.Text = dr["END_DATE"].ToString().Trim();
                    label_noP.Text = dr["NOSTAFF"].ToString().Trim();
                    labletitle.Visible = false;
                    label_error.Text = "";
                    if (label_noP.Text != "")
                    {
                        test.Visible = false;
                    }

                    DateTime dt_in = Convert.ToDateTime(label_DATE_IN.Text);
                    DateTime dt_begindate = Convert.ToDateTime(label_begin_date.Text);
                    DateTime dt_enddate = Convert.ToDateTime(label_end_date.Text);
                    double allin = Convert.ToDouble(label_SUMIN.Text);
                    double allout = Convert.ToDouble(label_SUMOUT.Text);
                    double js = Convert.ToDouble(label_BASE_PAY_JS.Text);
                    if ((dt_in >= dt_begindate) && (dt_in <= dt_enddate))
                    {//
                        if (allin <= 21.75)
                        {
                            Label3.Text = "计算说明:入社月份，出勤天数小于等于21.75的，按出勤算";
                            Label16.Text = "欠勤额=计算基数-(计算基数÷21.75×出勤天数)";
                            Label17.Text = "欠勤额=" + js + "-(" + js + "÷21.75×" + allin + ")=" + Math.Round(js - js / 21.75 * allin, 2);
                        }
                        else
                        {
                            Label3.Text = "计算说明:入社月份，出勤天数大于21.75的，按缺勤算";
                            Label16.Text = "欠勤额=计算基数÷21.75×缺勤天数";
                            Label17.Text = "欠勤额=" + js.ToString() + "÷21.75×" + allout.ToString() + "=" + Math.Round(js / 21.75 * allout, 2);
                        }
                    }
                    else
                    {// 不是入社月份
                        bool noout = true;
                        if (label_DATE_OUT.Text != "")
                        {//离职月份不为空
                            DateTime dt_out = Convert.ToDateTime(label_DATE_OUT.Text);
                            if ((dt_out >= dt_begindate) && (dt_out <= dt_enddate))
                            {
                                noout = false;
                                if (allin <= 21.75)
                                {
                                    Label3.Text = "计算说明:离职月份，出勤天数小于等于21.75的，按出勤算";
                                    Label16.Text = "欠勤额=计算基数-(计算基数÷21.75×出勤天数)";
                                    Label17.Text = "欠勤额=" + js + "-(" + js + "÷21.75×" + allin + ")=" + Math.Round(js - js / 21.75 * allin, 2);
                                }
                                else
                                {
                                    Label3.Text = "计算说明:离职月份，出勤天数大于21.75的，按缺勤算";
                                    Label16.Text = "欠勤额=计算基数÷21.75×缺勤天数";
                                    Label17.Text = "欠勤额=" + js.ToString() + "÷21.75×" + allout.ToString() + "=" + Math.Round(js / 21.75 * allout, 2);
                                }
                            }


                        }
                        if (noout)
                        {//既不是入社也不是离职月份
                            if ((label_RANK.Text == "8A") || (label_RANK.Text == "8B") || (label_RANK.Text == "8C") || (label_RANK.Text == "9A") || (label_RANK.Text == "9B") || (label_RANK.Text == "TB"))
                            {//8A及以上人员
                                bool notest = true;

                                if (test.Visible)
                                {//有试用期
                                    DateTime dttest = Convert.ToDateTime(label_DATE_TEST.Text);
                                    if (dt_enddate < dttest)
                                    {
                                        //且全在试用期内
                                        notest = false;
                                    }
                                }

                                if (notest)
                                {//不在试用期内

                                    if (allout > 5)
                                    {//
                                        if (allout <= 21.75)
                                        {
                                            Label3.Text = "计算说明:8A以上的缺勤天数大于5天且小于等于21.75的，按缺勤算";
                                            Label16.Text = "欠勤额=计算基数÷21.75×缺勤天数";
                                            Label17.Text = "欠勤额=" + js.ToString() + "÷21.75×" + allout.ToString() + "=" + Math.Round(js / 21.75 * allout, 2);

                                        }
                                        else
                                        {
                                            Label3.Text = "计算说明:8A以上的缺勤天数大于21.75的，按出勤算";
                                            Label16.Text = "欠勤额=计算基数-(计算基数÷21.75×出勤天数)";
                                            Label17.Text = "欠勤额=" + js + "-(" + js + "÷21.75×" + allin + ")=" + Math.Round(js - js / 21.75 * allin, 2);

                                        }
                                    }
                                    else
                                    {
                                        Label3.Text = "计算说明:8A以上的欠勤5天以内不扣欠勤额";
                                        Label16.Text = "欠勤额=0";
                                        Label17.Text = "";

                                    }
                                }
                                else
                                {// 是全在试用期内

                                    if (allout <= 21.75)
                                    {
                                        Label3.Text = "计算说明:全在试用期内的8A人员，缺勤天数小于等于21.75的，按缺勤算";
                                        Label16.Text = "欠勤额=计算基数÷21.75×缺勤天数";
                                        Label17.Text = "欠勤额=" + js.ToString() + "÷21.75×" + allout.ToString() + "=" + Math.Round(js / 21.75 * allout, 2);

                                    }
                                    else
                                    {
                                        Label3.Text = "计算说明:全在试用期内的8A人员，缺勤天数大于21.75的，按出勤算";
                                        Label16.Text = "欠勤额=计算基数-(计算基数÷21.75×出勤天数)";
                                        Label17.Text = "欠勤额=" + js + "-(" + js + "÷21.75×" + allin + ")=" + Math.Round(js - js / 21.75 * allin, 2);

                                    }

                                }

                            }
                            else
                            {//
                                if (allout <= 21.75)
                                {
                                    Label3.Text = "计算说明:缺勤天数小于等于21.75的，按缺勤算";
                                    Label16.Text = "欠勤额=计算基数÷21.75×缺勤天数";
                                    Label17.Text = "欠勤额=" + js.ToString() + "÷21.75×" + allout.ToString() + "=" + Math.Round(js / 21.75 * allout, 2);

                                }
                                else
                                {
                                    Label3.Text = "计算说明:缺勤天数大于21.75的，按出勤算";
                                    Label16.Text = "欠勤额=计算基数-(计算基数÷21.75×出勤天数)";
                                    Label17.Text = "欠勤额=" + js + "-(" + js + "÷21.75×" + allin + ")=" + Math.Round(js - js / 21.75 * allin, 2);

                                }
                            }
                        }

                    }


                }
                else
                {
                    label_RANK.Text = "";
                    label_OFF_DUTY_OUT.Text = "";
                    label_DATE_IN.Text = "";
                    label_DATE_TEST.Text = "";
                    label_DATE_OUT.Text = "";
                    label_BASE_PAY_JS.Text = "";
                    label_SUMOUT.Text = "";
                    label_SUMIN.Text = "";

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