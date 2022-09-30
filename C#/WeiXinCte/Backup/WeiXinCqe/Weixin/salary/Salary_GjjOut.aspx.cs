using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_GjjOut : System.Web.UI.Page
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
                    label_V_SUM_DUTY.Text = Request["S"].ToString().Trim();
                    label_V_ON_DUTY.Text = Request["O"].ToString().Trim();
                    label_stafftype.Text = Request["C"].ToString().Trim();
                    InitInfo();
                }


            }
        }
        private void InitInfo()
        {
            string sql = "  SELECT TO_CHAR(A.DATE_IN,'YYYY-MM-DD') AS DATE_IN,TO_CHAR(A.DATE_OUT,'YYYY-MM-DD') AS DATE_OUT,A.GJJ_INDEX,A.GJJ_SUM_C,A.GJJ_SUM_P,TO_CHAR(B.BEGIN_DATE,'YYYY-MM-DD') AS BEGIN_DATE,TO_CHAR(B.END_DATE,'YYYY-MM-DD') AS END_DATE  FROM STAFF_SALARY_XL  A LEFT JOIN SLR_INTERVAL B ON A.YYYYMM=B.YYYYMM WHERE      A.STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' AND A.YYYYMM='" + label_month.Text.ToString() + "'";
            try
            {
              

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_ADJUSTMENT_PAY1.Text = dr["GJJ_INDEX"].ToString().Trim();
                    label_ADJUSTMENT_PAY2.Text = dr["GJJ_SUM_P"].ToString().Trim();
                    label_ADJUSTMENT_PAY3.Text = dr["DATE_IN"].ToString().Trim();
                    label_ADJUSTMENT_PAY4.Text = dr["DATE_OUT"].ToString().Trim();
                    label_begin_date.Text = dr["BEGIN_DATE"].ToString().Trim();
                    label_end_date.Text = dr["END_DATE"].ToString().Trim(); 
                    labletitle.Visible = false;
                    label_error.Text = "";
                       H.Visible = false;
                            P.Visible = false;
                    if (label_stafftype.Text == "派遣" || label_stafftype.Text == "季节" || label_stafftype.Text == "返聘" || label_stafftype.Text == "实习" || label_stafftype.Text == "残疾")
                    {
                        H.Visible = true;
                        Label2.Text = "特别说明:" + label_stafftype.Text + "人员不交公积金";
                        P.Visible = false;
                   
                    }
                    else
                    {
                        DateTime dt_in = Convert.ToDateTime(label_ADJUSTMENT_PAY3.Text);
                        DateTime dt_begindate = Convert.ToDateTime(label_begin_date.Text);
                        DateTime dt_enddate = Convert.ToDateTime(label_end_date.Text);
                        if ((dt_in >= dt_begindate) && (dt_in <= dt_enddate))
                        {
                            H.Visible = false;
                            P.Visible = true;
                            Label1.Text = "特别说明:当月入社且出勤率不满50%的人员不交公积金";
                        }
                        else
                        {   
                        
                            if (label_ADJUSTMENT_PAY4.Text != "")
                            {
                                DateTime dt_out = Convert.ToDateTime(label_ADJUSTMENT_PAY4.Text);
                                if ((dt_out >= dt_begindate) && (dt_out <= dt_enddate))
                                {
                                    H.Visible = false;
                                    P.Visible = true;
                                    Label1.Text = "特别说明:当月离职且出勤率不满50%的人员不交公积金";
                                }
                            }
                            
                        }
                        if (P.Visible)
                        {
                            double o = Convert.ToDouble(label_V_ON_DUTY.Text);
                            double t = Convert.ToDouble(label_V_SUM_DUTY.Text);
                            Label_GongShi.Text = "出勤率计算公式=(广义出勤天数÷应出勤天数)";
                            if (label_V_SUM_DUTY.Text.ToString().Trim() == "0")
                            {
                                Label_JieGuo.Text = "出勤率计算结果=(" + o.ToString() + "÷" + t.ToString().Trim() + ")=0=0%";

                            }
                            else
                            {
                                Label_JieGuo.Text = "出勤率计算结果=(" + o.ToString() + "÷" + t.ToString().Trim() + ")=" + Math.Round(o / t, 4) + "=" + Math.Round(o / t, 4) * 100 + "%";
                                label_Rate.Text = Math.Round(o / t, 4) * 100 + "%";
                            }
                        }
                    
                    }
                }
                else
                {
                    label_ADJUSTMENT_PAY1.Text = "0";
                    label_ADJUSTMENT_PAY2.Text = "0";
                    label_ADJUSTMENT_PAY3.Text = "0";
                    label_ADJUSTMENT_PAY4.Text = "0";

                    Label2.Text = "";
                    labletitle.Visible = true;
                    label_error.Text = "网络错误，稍后重试";
                    H.Visible = false;
                    P.Visible = false;
                }



            }
            catch
            {
                Label2.Text = "";
                H.Visible = false;
                P.Visible = false;
                label_error.Text = "网络错误，稍后重试";
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}