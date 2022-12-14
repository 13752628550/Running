using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe.Weixin.salary
{
    public partial class Salary_D_OtherOut : System.Web.UI.Page
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
                    label_LATE1.Text = Request["LATE1"].ToString().Trim();
                    label_LATE2.Text = Request["LATE2"].ToString().Trim();
                    label_LATE3.Text = Request["LATE3"].ToString().Trim();
                    label_BIG_PUNISHMENT.Text = Request["BIG_PUNISHMENT"].ToString().Trim();
                    label_SMALL_PUNISHMENT.Text = Request["SMALL_PUNISHMENT"].ToString().Trim();
                    label_V_LATE1.Text = Request["V_LATE1"].ToString().Trim();
                    label_V_LATE2.Text = Request["V_LATE2"].ToString().Trim();
                    label_V_DAY_PAY.Text = Request["V_DAY_PAY"].ToString().Trim();
                    label_V_BIG.Text = Request["V_BIG"].ToString().Trim();
                    label_V_SMALL.Text = Request["V_SMALL"].ToString().Trim();
                    InitInfo();
                }


            }
        }
        private void InitInfo()
        {
            string sql1 = "SELECT NVL(NEWNAME,OLDNAME)||':' AS NEWNAME  FROM BASE_ADJUSTMENT_BAK  WHERE YYYYMM='" + label_month.Text.ToString().Trim() + "' AND TYPE='其他扣' ORDER BY ORDERID";
            string sql = "  SELECT OTHER_OUT1,OTHER_OUT2,OTHER_OUT3,OTHER_OUT4,OTHER_OUT5,OTHER_OUT6,OTHER_OUT7,OTHER_OUT8,OTHER_OUT9,OTHER_OUT10,OTHER_OUT  FROM STAFF_SALARY_XL    WHERE STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' AND YYYYMM='" + label_month.Text.ToString() + "'";
            try
            {
                DataTable dt1 = OracleOperateHelp.getDataTable(sql1);
                if (dt1.Rows.Count > 0)
                {
                    labelOTHER_OUT1.Text = dt1.Rows[0]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT2.Text = dt1.Rows[1]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT3.Text = dt1.Rows[2]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT4.Text = dt1.Rows[3]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT5.Text = dt1.Rows[4]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT6.Text = dt1.Rows[5]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT7.Text = dt1.Rows[6]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT8.Text = dt1.Rows[7]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT9.Text = dt1.Rows[8]["NEWNAME"].ToString().Trim();
                    labelOTHER_OUT10.Text = dt1.Rows[9]["NEWNAME"].ToString().Trim();
                }

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_OTHER_OUT1.Text = dr["OTHER_OUT1"].ToString().Trim();
                    label_OTHER_OUT2.Text = dr["OTHER_OUT2"].ToString().Trim();
                    label_OTHER_OUT3.Text = dr["OTHER_OUT3"].ToString().Trim();
                    label_OTHER_OUT4.Text = dr["OTHER_OUT4"].ToString().Trim();
                    label_OTHER_OUT5.Text = dr["OTHER_OUT5"].ToString().Trim();
                    label_OTHER_OUT6.Text = dr["OTHER_OUT6"].ToString().Trim();
                    label_OTHER_OUT7.Text = dr["OTHER_OUT7"].ToString().Trim();
                    label_OTHER_OUT8.Text = dr["OTHER_OUT8"].ToString().Trim();
                    label_OTHER_OUT9.Text = dr["OTHER_OUT9"].ToString().Trim();
                    label_OTHER_OUT10.Text = dr["OTHER_OUT10"].ToString().Trim();
                    label_OTHER_OUT.Text = dr["OTHER_OUT"].ToString().Trim();
                    labletitle.Visible = false;
                    label_error.Text = "";
                    P.Visible = true;
                    double late1 = Convert.ToDouble(label_LATE1.Text);
                    double late2 = Convert.ToDouble(label_LATE2.Text);
                    double late3 = Convert.ToDouble(label_LATE3.Text);
                    double big = Convert.ToDouble(label_BIG_PUNISHMENT.Text);
                    double small = Convert.ToDouble(label_SMALL_PUNISHMENT.Text);
                    double v_big = Convert.ToDouble(label_V_BIG.Text);
                    double v_small = Convert.ToDouble(label_V_SMALL.Text);
                    double v_late1 = Convert.ToDouble(label_V_LATE1.Text);
                    double v_late2 = Convert.ToDouble(label_V_LATE2.Text);
                    double v_day_pay = Convert.ToDouble(label_V_DAY_PAY.Text);
                    Label_GongShi.Text = "短期扣除=迟早一×迟早一额度+迟早二×迟早二额度+迟早三×每天工资额÷2+大过×大过额度+小过×小过额度";
                    Label_JieGuo.Text = "短期扣除金额=迟早一×迟早一额度+迟早二×迟早二额度+迟早三×每天工资额÷2+大过×大过额度+小过×小过额度="+late1+"×"+v_late1+"+"+late2+"×"+v_late2+"+"+late3+"×"+v_day_pay+"÷2+"+big+"×"+v_big+"+"+small+"×"+v_small+"=" + Math.Round(late1*v_late1+late2*v_late2+late3*v_day_pay/2+big*v_big+small*v_small, 2);
                           
                }
                else
                {
                    label_OTHER_OUT1.Text = "0";
                    label_OTHER_OUT2.Text = "0";
                    label_OTHER_OUT3.Text = "0";
                    label_OTHER_OUT4.Text = "0";
                    label_OTHER_OUT5.Text = "0";
                    label_OTHER_OUT6.Text = "0";
                    label_OTHER_OUT7.Text = "0";
                    label_OTHER_OUT8.Text = "0";
                    label_OTHER_OUT9.Text = "0";
                    label_OTHER_OUT10.Text = "0";
                    label_OTHER_OUT.Text = "0";
                    Label1.Text = "";
                    labletitle.Visible = true;
                    label_error.Text = "网络错误，稍后重试";

                }



            }
            catch
            {
                Label1.Text = "";

                label_error.Text = "网络错误，稍后重试";
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}