using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_TaxOut12 : System.Web.UI.Page
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
                            string level = GridView2.Rows[i].Cells[0].Text;

                            if (level == label_vlevel.Text)
                            {

                                GridView2.Rows[i].BackColor = System.Drawing.Color.LightGreen;
                            }
                            if (level == label_bonus_vlevel.Text)
                            {

                                GridView2.Rows[i].BackColor = System.Drawing.Color.LightCyan;
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
                string sql = "  SELECT A.BONUS_PAY,A.V_BONUS_TAX_BLEVEL,A.V_BONUS_TAX_RATE,A.V_BONUS_TAX_SUBTRACT,A.V_BONUS_TAX_CFROM,A.V_BONUS_TAX_CTO,A.TAX_OUT AS TAX_OUT_SUM,A.V_BONUS_TAX AS BONUS_TAX_OUT,(A.TAX_OUT-A.V_BONUS_TAX) AS TAX_OUT,A.PAY_TAX,(A.SUM_PAY- A.SB_OUT- A.GJJ_OUT- A.OFF_DUTY_OUT- A.PERFECT_ATTENDANCE_OUT-A.BONUS_PAY) AS S_PAY_TAX,A.V_GJJ_TAX,A.GJJ_OUT,B.UPPON,A.V_TAX_BLEVEL,A.V_TAX_RATE,A.V_TAX_SUBTRACT,A.V_TAX_CFROM,A.V_TAX_CTO,B.BLEVEL,(B.RATE||'%') AS RATE,B.SUBTRACT,B.CFROM,B.CTO FROM STAFF_SALARY_XL A LEFT JOIN SLR_IRPEF_MONTH B ON A.YYYYMM=B.YYYYMM WHERE A.STAFFID='" + label_newstaffid.Text + "' AND A.YYYYMM='" + label_month.Text + "'  ORDER BY B.BLEVEL";


                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    label_V_Season_Pay.Text = dt.Rows[0]["PAY_TAX"].ToString();
                    label_V_ON_DUTY.Text = dt.Rows[0]["S_PAY_TAX"].ToString();
                    label_V_SUM_DUTY.Text = dt.Rows[0]["V_GJJ_TAX"].ToString();
                    label_Rate.Text = dt.Rows[0]["GJJ_OUT"].ToString();
                    label_Season_PAY.Text = dt.Rows[0]["UPPON"].ToString();
                    label6.Text = dt.Rows[0]["TAX_OUT"].ToString();
                    label2.Text = dt.Rows[0]["BONUS_PAY"].ToString();
                    label19.Text = dt.Rows[0]["BONUS_TAX_OUT"].ToString();
                    label21.Text = dt.Rows[0]["TAX_OUT_SUM"].ToString();
                    label_vlevel.Text = dt.Rows[0]["V_TAX_BLEVEL"].ToString();
                    label_vrate.Text = dt.Rows[0]["V_TAX_RATE"].ToString();
                    label_vsub.Text = dt.Rows[0]["V_TAX_SUBTRACT"].ToString();
                    label_vfrom.Text = dt.Rows[0]["V_TAX_CFROM"].ToString();
                    label_vto.Text = dt.Rows[0]["V_TAX_CTO"].ToString();
                    label_bonus_vlevel.Text = dt.Rows[0]["V_BONUS_TAX_BLEVEL"].ToString();
                    label_bonus_vrate.Text = dt.Rows[0]["V_BONUS_TAX_RATE"].ToString();
                    label_bonus_vsub.Text = dt.Rows[0]["V_BONUS_TAX_SUBTRACT"].ToString();
                    label_bonus_vfrom.Text = dt.Rows[0]["V_BONUS_TAX_CFROM"].ToString();
                    label_bonus_vto.Text = dt.Rows[0]["V_BONUS_TAX_CTO"].ToString();
                    Label11.Text = "工资应税额=支付合计(C)-公积金(s)-保险扣(r)-欠勤额(p)-精勤扣(q)-奖金(n)=" + dt.Rows[0]["S_PAY_TAX"].ToString();
                    double gjj = Convert.ToDouble(label_Rate.Text);
                    double v_gjj = Convert.ToDouble(label_V_SUM_DUTY.Text);
                    if (gjj > v_gjj)
                    {
                        Label12.Text = "公积金应税额=(公积金-公积金交税线)×2=(" + gjj.ToString() + "-" + v_gjj.ToString() + ")×2=" + (gjj - v_gjj) * 2;
                        label10.Text = ((gjj - v_gjj) * 2).ToString();
                    }
                    else
                    {
                        Label12.Text = "公积金低于公积金交税线，所以公积金应税额为=0";
                        label10.Text = "0";
                    }
                    Label13.Text = "工资应税总额=工资应税额+公积金应税额=" + label_V_ON_DUTY.Text + "+" + label10.Text + "=" + label_V_Season_Pay.Text;

                    double zong = Convert.ToDouble(label_V_Season_Pay.Text);
                    double up = Convert.ToDouble(label_Season_PAY.Text);
                    double vs = Convert.ToDouble(label_V_ON_DUTY.Text);
                    double b = Convert.ToDouble(label2.Text);
                    if (zong < up)
                    {
                     
                        Label17.Text = "工资应税总额低于个税免征额，所以工资应税所得=0";
                        label16.Text = "0";
                        Label_GongShi.Text = "工资应税所得为0，故工资所得税为0";
                        Label_JieGuo.Text = "";
                        labeljiegudiv.Visible = false;
                        Label24.Text = "工资应税总额低于个人免征额，所以奖金应税所得=奖金+工资应税总额-个人免征额=" + b.ToString()+"+"+zong.ToString()+"-"+up.ToString()+"="+(b+zong-up);
                        label23.Text = (b + zong - up).ToString();
                        b = Convert.ToDouble(label23.Text);
                        if (b > 0)
                        {
                            Label25.Text = "奖金应税所得÷12=" + b.ToString().Trim() + "÷12=" + Math.Round(b / 12, 2) + "，介于" + label_bonus_vfrom.Text + "和" + label_bonus_vto.Text + "之间，故适用于级数为" + label_bonus_vlevel.Text + ",税率为" + label_bonus_vrate.Text + "%的交税标准";

                            double b_shuilv = Convert.ToDouble(label_bonus_vrate.Text);
                            double b_sub = Convert.ToDouble(label_bonus_vsub.Text);

                            Label26.Text = "奖金所得税=(奖金应税所得×税率)-速扣数=(" + b.ToString() + "×" + b_shuilv.ToString() + "%) - " + b_sub.ToString() + "=" + Math.Round((b * b_shuilv / 100 - b_sub) , 2);
                            Label27.Text = "个人所得税=工资所得税+奖金所得税=" + label6.Text + "+" + label19.Text + "=" + (Convert.ToDouble(label6.Text) + Convert.ToDouble(label19.Text));
                        }
                        else
                        {
                            Label25.Text = "奖金应税所得小于0，故奖金所得税为=0";
                            Label26.Text = "个人所得税=工资所得税+奖金所得税=" + label6.Text + "+" + label19.Text + "=" + (Convert.ToDouble(label6.Text) + Convert.ToDouble(label19.Text));
                            if (zong < 0)
                            {
                                Label27.Text = "工资应税总额小于0，记为0 。";
                                label_V_ON_DUTY.Text = "0";
                                label_V_Season_Pay.Text = "0";
                            }
                            if (b < 0)
                            {
                                Label27.Text   += "    奖金应税所得小于0，记为0 。";
                                label23.Text = "0";
                            }

                            if (Label27.Text == "")
                            {
                                label27div.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        Label17.Text = "工资你应税所得=工资应税总额-个税免征额=" + zong.ToString() + "-" + up.ToString() + "=" + (zong - up).ToString();
                        label16.Text = (zong - up).ToString();
                        Label_GongShi.Text = "工资应税所得为" + label16.Text + "，介于" + label_vfrom.Text + "和" + label_vto.Text + "之间，故适用于级数为" + label_vlevel.Text + ",税率为" + label_vrate.Text + "%的交税标准";
                        double yishui = Convert.ToDouble(label16.Text);
                        double shuilv = Convert.ToDouble(label_vrate.Text);
                        double sub = Convert.ToDouble(label_vsub.Text);
                        Label_JieGuo.Text = "工资所得税=(工资应税所得×税率)-速扣数=(" + yishui.ToString() + "×" + shuilv.ToString() + "%) - " + sub.ToString() + "=" + Math.Round(yishui * shuilv / 100 - sub, 2);
                        Label24.Text = "工资应税总额大于个人免征额，所以奖金应税所得=奖金="+b.ToString();
                        label23.Text = b.ToString().Trim();
                        Label25.Text = "奖金应税所得÷12=" + b.ToString().Trim() + "÷12=" +Math.Round(b/12,2) + "，介于" + label_bonus_vfrom.Text + "和" + label_bonus_vto.Text + "之间，故适用于级数为" + label_bonus_vlevel.Text + ",税率为" + label_bonus_vrate.Text + "%的交税标准";
              
                        double b_shuilv = Convert.ToDouble(label_bonus_vrate.Text);
                        double b_sub = Convert.ToDouble(label_bonus_vsub.Text);

                        Label26.Text = "奖金所得税=(奖金应税所得×税率)-速扣数=(" + b.ToString() + "×" + b_shuilv.ToString() + "%) - " + b_sub.ToString() + "=" + Math.Round((b  * b_shuilv / 100 - b_sub), 2);
                        Label27.Text = "个人所得税=工资所得税+奖金所得税=" + label6.Text + "+" + label19.Text + "=" + (Convert.ToDouble(label6.Text) + Convert.ToDouble(label19.Text));
                    }

             
                    GridView2.Caption = "个税税率表";
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.Visible = true;

                }
                else
                {
                    GridView2.Visible = false;
                    label_V_ON_DUTY.Text = "";
                    label_V_SUM_DUTY.Text = "";
                    label_Rate.Text = "";
                    label_Season_PAY.Text = "";
                    label6.Text = "";
                    label_vlevel.Text = "";
                    label_vrate.Text = "";
                    label_vsub.Text = "";
                    label_vfrom.Text = "";
                    label_vto.Text = "";
                    label10.Text = "";
                    label16.Text = "";
                    Label11.Text = "";
                    Label12.Text = "";
                    Label13.Text = "";
                    Label17.Text = "";
                    label2.Text = "";
                    label19.Text = "";
                    label21.Text = "";
                    Label24.Text = "";
                    Label25.Text = "";
                    Label26.Text = "";
                    Label27.Text = "";
                    Label_GongShi.Text = "";
                    Label_JieGuo.Text = "";
                    label_V_Season_Pay.Text = "网络错误,稍后重试";
                    label_V_Season_Pay.ForeColor = System.Drawing.Color.Red;

                }
            }
            catch
            {
                GridView2.Visible = false;
                label_V_ON_DUTY.Text = "";
                label_V_SUM_DUTY.Text = "";
                label_Rate.Text = "";
                label_Season_PAY.Text = "";
                label6.Text = "";
                label_vlevel.Text = "";
                label_vrate.Text = "";
                label_vsub.Text = "";
                label_vfrom.Text = "";
                label_vto.Text = "";
                label10.Text = "";
                label16.Text = "";
                Label11.Text = "";
                Label12.Text = "";
                Label13.Text = "";
                Label17.Text = "";
                label2.Text = "";
                label19.Text = "";
                label21.Text = "";
                Label24.Text = "";
                Label25.Text = "";
                Label26.Text = "";
                Label27.Text = "";
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