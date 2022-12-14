using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_SeasonPay : System.Web.UI.Page
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
                    label_V_SUM_DUTY.Text = Request["S"].ToString().Trim();
                    label_V_ON_DUTY.Text = Request["O"].ToString().Trim();
                    label_Season_PAY.Text = Request["C"].ToString().Trim();
                    label_Rate.Text = "0%";
                    double o = Convert.ToDouble(label_V_ON_DUTY.Text);
                    double t = Convert.ToDouble(label_V_SUM_DUTY.Text);
                    Label_GongShi2.Text = "季节费计算公式=出勤率低于50%的没有季节费";
                    Label_GongShi.Text = "出勤率计算公式=(广义出勤天数÷应出勤天数)";
                    if (label_V_SUM_DUTY.Text.ToString().Trim() == "0")
                    {
                       Label_JieGuo.Text = "出勤率计算结果=(" + o.ToString() + "÷" + t.ToString().Trim() + ")=0=0%";

                    }
                    else
                    {
                        Label_JieGuo.Text = "出勤率计算结果=(" + o.ToString() + "÷" + t.ToString().Trim() + ")=" + Math.Round(o / t, 4) + "=" + Math.Round(o / t, 4)*100+"%";
                        label_Rate.Text = Math.Round(o / t, 4) * 100 + "%";
                    }

                    init();
                    this.Title = label_type.Text.ToString() + "明细";
                    labled.Text = label_type.Text.ToString() + "明细";
                    if (GridView2.Visible)
                    {
                        for (int i = 0; i < GridView2.Rows.Count; i++)
                        {
                            string month = GridView2.Rows[i].Cells[0].Text;
                            string season = GridView2.Rows[i].Cells[1].Text;
                            if (month == label_month.Text)
                            {
                                label_V_Season_Pay.Text = season;
                                GridView2.Rows[i].BackColor = System.Drawing.Color.LightGreen;
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
                string sql = "  SELECT YYYYMM,SEASON FROM SLR_SEASON  WHERE SUBSTR(YYYYMM,1,4)='"+label_yyyy.Text.ToString().Trim()+"' ORDER BY YYYYMM";


                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    GridView2.Caption = label_yyyy.Text.ToString()+"年季节费一览表";
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.Visible = true;                   
          
                }
                else
                {
                    GridView2.Visible = false;
                    label_V_SUM_DUTY.Text = "";
                    label_V_ON_DUTY.Text ="";
                    label_Season_PAY.Text ="";
                    label_Rate.Text = "";
                    Label_GongShi2.Text = "";
                    Label_GongShi.Text = "";
                    Label_JieGuo.Text = "";
                    label_V_Season_Pay.Text = "网络错误,稍后重试";
                    label_V_Season_Pay.ForeColor = System.Drawing.Color.Red;

                }
            }
            catch 
            {
                GridView2.Visible = false;
                label_V_SUM_DUTY.Text = "";
                label_V_ON_DUTY.Text = "";
                label_Season_PAY.Text = "";
                label_Rate.Text = "";
                Label_GongShi2.Text = "";
                Label_GongShi.Text = "";
                Label_JieGuo.Text = "";
                label_V_Season_Pay.Text = "网络错误,稍后重试";
                label_V_Season_Pay.ForeColor = System.Drawing.Color.Red;
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}