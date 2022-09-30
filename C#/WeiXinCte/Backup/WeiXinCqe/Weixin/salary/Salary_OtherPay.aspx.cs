using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_OtherPay : System.Web.UI.Page
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
            string sql = "  SELECT A.BASE_PAY_JS,A.BACK4_JS,A.V_LOW_SLR,A.OTHER_PAY1,A.OTHER_PAY2,A.OTHER_PAY3,A.OTHER_PAY4,A.OTHER_PAY5,A.OTHER_PAY,B.BACK1,B.BACK4,(B.SICK_LEAVE+B.SICK_LEAVE_180) AS SICK,B.SICK_LEAVE  FROM STAFF_SALARY_XL A LEFT JOIN STAFF_KQ B ON A.STAFFID=B.STAFFID AND A.YYYYMM=B.YYYYMM   WHERE A.STAFFID='" + label_newstaffid.Text.ToString().Trim() + "' AND A.YYYYMM='" + label_month.Text.ToString() + "'";
            try
            {

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    label_BASE_PAY_JS.Text = dr["BASE_PAY_JS"].ToString().Trim();
                    label_BACK4_JS.Text = dr["BACK4_JS"].ToString().Trim();
                    label_V_LOW_SLR.Text = dr["V_LOW_SLR"].ToString().Trim();
                    label_BACK1.Text = dr["BACK1"].ToString().Trim();
                    label_BACK4.Text = dr["BACK4"].ToString().Trim();
                    label_SICK.Text = dr["SICK"].ToString().Trim();
                    label_SICK_LEAVE.Text = dr["SICK_LEAVE"].ToString().Trim();
                    label_OTHER_PAY1.Text = dr["OTHER_PAY1"].ToString().Trim();
                    label_OTHER_PAY4.Text = dr["OTHER_PAY4"].ToString().Trim();
                    label_OTHER_PAY5.Text = dr["OTHER_PAY5"].ToString().Trim();
                    label_OTHER_PAY.Text = dr["OTHER_PAY"].ToString().Trim();
                    double back1 = Convert.ToDouble(label_BACK1.Text);
                    double js = Convert.ToDouble(label_BASE_PAY_JS.Text);
                    double back4 = Convert.ToDouble(label_BACK4.Text);
                    double backjs = Convert.ToDouble(label_BACK4_JS.Text);
                    double sick = Convert.ToDouble(label_SICK.Text);
                    double sick_l = Convert.ToDouble(label_SICK_LEAVE.Text);
                    double low_slr = Convert.ToDouble(label_V_LOW_SLR.Text);
                    if (back1 == 0)
                    {
                        Label1.Text = "一时归休天数为0，故一时归休给位0";
                        div1.Visible = true;
                    }
                    else
                    {
                        Label1.Text = "一时归休给=(工资基数÷21.75×80%) × 一时归休天数=(" + js + "÷21.75×80%) × " + back1 + "=" + Math.Round(js / 21.75 * 0.8 * back1,2);
                        div1.Visible = true;
                    }
                    if (back4 == 0)
                    {
                        Label2.Text = "工伤天数为0，故工伤给为0";
                        div2.Visible = true;
                        divback4.Visible = false;
                    }
                    else
                    {
                        Label2.Text = "工伤给=(工伤基数÷21.75) × 工伤天数=(" + backjs + "÷21.75) × " + back4 + "=" + Math.Round(backjs / 21.75 * back4,2);
                        Label3.Text = "注:工伤基数为本人前12个月应发工资的平均值";
                        div2.Visible = true;
                        div3.Visible = true;
                        divback4.Visible = true;
                    }
                    if (sick == 0)
                    {
                        divsick_leavel.Visible = false;
                        divsick2.Visible = false;
                        divsick.Visible = false;
                        Label4.Text = "病假天数为0，故病假给为0";
                        div4.Visible = true;
                    }
                    else
                    {
                        divsick.Visible = true;
                        double js1 = js * 0.7;
                        double js2 = js * 0.6;
                        double js3 = low_slr * 0.8;
                        if (js1 > js3)
                        {
                            labelsick_js.Text = js1.ToString();
                            Label4.Text = "因为工资基数的70% 大于等于青岛市最低工资的80%，所以病假基数为工资基数的70%";
                            div4.Visible = true;
                        }
                        else
                        {
                            labelsick_js.Text = js3.ToString();
                            Label4.Text = "因为工资基数的70% 小于青岛市最低工资的80%，所以病假基数为青岛市最低工资的80%";
                            div4.Visible = true;
                        }
                        if (js2 > js3)
                        {
                            labelsick_js2.Text = js1.ToString();
                            Label5.Text = "因为工资基数的60% 大于等于青岛市最低工资的80%，所以病假基数2为工资基数的60%";
                            div5.Visible = true;
                        }
                        else
                        {
                            labelsick_js2.Text = js3.ToString();
                            Label5.Text = "因为工资基数的60% 小于青岛市最低工资的80%，所以病假基数2为青岛市最低工资的80%";
                            div5.Visible = true;
                        }
                        double bjjs = Convert.ToDouble(labelsick_js.Text);
                        double bjjs2 = Convert.ToDouble(labelsick_js2.Text);
                        if (sick_l == 0)
                        {
                            divsick_leavel.Visible = false;
                            divsick2.Visible = false;
                            Label5.Text = "病假给=(病假基数÷21.75) × 病假天数=(" + bjjs + "÷21.75) × " + sick + "=" + Math.Round(bjjs / 21.75 * sick,2);
                            div5.Visible = true;
                        }
                        else
                        {
                            divsick_leavel.Visible = true;
                            divsick2.Visible = true;
                            Label6.Text = "病假给1=(病假基数÷21.75) × (病假天数-超过6个月的长病假天数)=(" + bjjs + "÷21.75) ×( " + sick+"-"+sick_l + ")=" + Math.Round(bjjs / 21.75 * (sick-sick_l),2);
                            Label7.Text = "病假给2=(病假基数2÷21.75) × 超过6个月的长病假天数=(" + bjjs2 + "÷21.75) × " + sick_l + "=" + Math.Round(bjjs2 / 21.75 * sick_l,2);
                            Label8.Text = "病假给= 病假给1+病假给2=" + Math.Round(bjjs / 21.75 * (sick - sick_l),2) + "+" + Math.Round(bjjs2 / 21.75 * sick_l, 2) + "=" + (Math.Round(bjjs / 21.75 * (sick - sick_l), 2) + Math.Round(bjjs2 / 21.75 * sick_l, 2));
                            div6.Visible = true;
                            div7.Visible = true;
                            div8.Visible = true;
                        }
                    }

                    Label9.Text = "其他给合计 = 一时归休给+工伤给+病假给="+label_OTHER_PAY1.Text+"+"+label_OTHER_PAY5.Text+"+"+label_OTHER_PAY4.Text+"="+label_OTHER_PAY.Text;
                    div9.Visible = true;
                    labletitle.Visible = false;
                    label_error.Text = "";
                }
                else
                {
                    label_BASE_PAY_JS.Text = "";
                    label_BACK4_JS.Text = "";
                    label_V_LOW_SLR.Text = "";
                    label_BACK1.Text = "";
                    label_BACK4.Text = "";
                    label_SICK.Text = "";
                    label_SICK_LEAVE.Text = "";
                    label_OTHER_PAY1.Text = "";
                    label_OTHER_PAY4.Text = "";
                    label_OTHER_PAY5.Text = "";
                    label_OTHER_PAY.Text = "";
                    Label2.Text = "";
                    labletitle.Visible = true;
                    label_error.Text = "网络错误，稍后重试";

                }



            }
            catch
            {
                label_BASE_PAY_JS.Text = "";
                label_BACK4_JS.Text = "";
                label_V_LOW_SLR.Text = "";
                label_BACK1.Text = "";
                label_BACK4.Text = "";
                label_SICK.Text = "";
                label_SICK_LEAVE.Text = "";
                label_OTHER_PAY1.Text = "";
                label_OTHER_PAY4.Text = "";
                label_OTHER_PAY5.Text = "";
                label_OTHER_PAY.Text = "";
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