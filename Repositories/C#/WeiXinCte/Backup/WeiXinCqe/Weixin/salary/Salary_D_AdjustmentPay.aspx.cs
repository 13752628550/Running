using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe.Weixin.salary
{
    public partial class Salary_D_AdjustmentPay : System.Web.UI.Page
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
            string sql1 = "SELECT NVL(NEWNAME,OLDNAME)||':' AS NEWNAME  FROM BASE_ADJUSTMENT_BAK  WHERE YYYYMM='" + label_month.Text.ToString().Trim() + "' AND TYPE='调整' ORDER BY ORDERID";
            string sql = "  SELECT ADJUSTMENT_PAY1,ADJUSTMENT_PAY2,ADJUSTMENT_PAY3,ADJUSTMENT_PAY4,ADJUSTMENT_PAY5,ADJUSTMENT_PAY6,ADJUSTMENT_PAY7,ADJUSTMENT_PAY8,ADJUSTMENT_PAY9,ADJUSTMENT_PAY10,ADJUSTMENT_PAY  FROM STAFF_SALARY_XL    WHERE STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' AND YYYYMM='" + label_month.Text.ToString() + "'";
            try
            {
                DataTable dt1 = OracleOperateHelp.getDataTable(sql1);
                if (dt1.Rows.Count > 0)
                {
                    labelADJUSTMENT_PAY1.Text = dt1.Rows[0]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY2.Text = dt1.Rows[1]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY3.Text = dt1.Rows[2]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY4.Text = dt1.Rows[3]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY5.Text = dt1.Rows[4]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY6.Text = dt1.Rows[5]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY7.Text = dt1.Rows[6]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY8.Text = dt1.Rows[7]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY9.Text = dt1.Rows[8]["NEWNAME"].ToString().Trim();
                    labelADJUSTMENT_PAY10.Text = dt1.Rows[9]["NEWNAME"].ToString().Trim();
                }

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_ADJUSTMENT_PAY1.Text = dr["ADJUSTMENT_PAY1"].ToString().Trim();
                    label_ADJUSTMENT_PAY2.Text = dr["ADJUSTMENT_PAY2"].ToString().Trim();
                    label_ADJUSTMENT_PAY3.Text = dr["ADJUSTMENT_PAY3"].ToString().Trim();
                    label_ADJUSTMENT_PAY4.Text = dr["ADJUSTMENT_PAY4"].ToString().Trim();
                    label_ADJUSTMENT_PAY5.Text = dr["ADJUSTMENT_PAY5"].ToString().Trim();
                    label_ADJUSTMENT_PAY6.Text = dr["ADJUSTMENT_PAY6"].ToString().Trim();
                    label_ADJUSTMENT_PAY7.Text = dr["ADJUSTMENT_PAY7"].ToString().Trim();
                    label_ADJUSTMENT_PAY8.Text = dr["ADJUSTMENT_PAY8"].ToString().Trim();
                    label_ADJUSTMENT_PAY9.Text = dr["ADJUSTMENT_PAY9"].ToString().Trim();
                    label_ADJUSTMENT_PAY10.Text = dr["ADJUSTMENT_PAY10"].ToString().Trim();
                    label_ADJUSTMENT_PAY.Text = dr["ADJUSTMENT_PAY"].ToString().Trim();
                    labletitle.Visible = false;
                    label_error.Text = "";        
          
                        P.Visible = true;
                        double o = Convert.ToDouble(label_V_ON_DUTY.Text);
                        double t = Convert.ToDouble(label_V_SUM_DUTY.Text);
                        Label_GongShi.Text = "短期支付=出勤天数×每天工资额";
                        Label_JieGuo.Text = "短期支付金额=出勤天数×每天工资额=" + o.ToString() + "×" + t.ToString().Trim() + "=" + Math.Round(o * t, 2);
                            
                       
                 
                }
                else
                {
                    label_ADJUSTMENT_PAY1.Text = "0";
                    label_ADJUSTMENT_PAY2.Text = "0";
                    label_ADJUSTMENT_PAY3.Text = "0";
                    label_ADJUSTMENT_PAY4.Text = "0";
                    label_ADJUSTMENT_PAY5.Text = "0";
                    label_ADJUSTMENT_PAY6.Text = "0";
                    label_ADJUSTMENT_PAY7.Text = "0";
                    label_ADJUSTMENT_PAY8.Text = "0";
                    label_ADJUSTMENT_PAY9.Text = "0";
                    label_ADJUSTMENT_PAY10.Text = "0";
                    label_ADJUSTMENT_PAY.Text = "0";
               
                    labletitle.Visible = true;
                    label_error.Text = "网络错误，稍后重试";
             
                    P.Visible = false;
                }



            }
            catch
            {
    
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