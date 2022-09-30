using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace WeiXinCqe
{
    public partial class Attendance : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["newstaffid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status6#wechat_redirect");
                }
                else
                {
                    staffid.Text = Request.Cookies["staffid"].Value.ToString().Trim();
                    newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    deviceid.Text = "微信客户端:" + Request.Cookies["deviceid"].Value.ToString().Trim();
                    staffname.Text = Server.UrlDecode(Request.Cookies["staffname"].Value.ToString().Trim());

                    nowstaffid.Text = newstaffid.Text;//本来想判断来着
                    Hidden1.Value = "个人日历";
                    if (Request["oldvalue"] != null)
                    {
                        Hidden1.Value = Server.UrlDecode(Request["oldvalue"].ToString().Trim());
                    }

                    if (Request["oldmonth"] != null)
                    {
                        dd_yyyymmdd.Value = Server.UrlDecode(Request["oldmonth"].ToString().Trim());
                    }
                    if (dd_yyyymmdd.Value.ToString().Trim() == "")
                    {
                        dd_yyyymmdd.Value = DateTime.Today.ToString("yyyy-MM");
                    }
                    dd1_yyyymmdd.Value = DateTime.Today.ToString("yyyy-MM");
                    if (Request["old1month"] != null)
                    {
                        dd2_yyyymmdd.Value = Server.UrlDecode(Request["old1month"].ToString().Trim());
                    }
                    if (dd2_yyyymmdd.Value.ToString().Trim() == "")
                    {
                        dd2_yyyymmdd.Value = DateTime.Today.AddMonths(-1).ToString("yyyy-MM");

                    }
                    ImageButton1_Click(null, null);
                }
                //staffid.Text = "961879";
                //newstaffid.Text = "932001";
                //Hidden1.Value = "个人日历";
                //if (Request["oldvalue"] != null)
                //{
                //    Hidden1.Value = Server.UrlDecode(Request["oldvalue"].ToString().Trim());
                //}
           
                //if (Request["oldmonth"] != null)
                //{
                //    dd_yyyymmdd.Value = Server.UrlDecode(Request["oldmonth"].ToString().Trim());
                //}
                //if (dd_yyyymmdd.Value.ToString().Trim() == "")
                //{
                //    dd_yyyymmdd.Value = DateTime.Today.ToString("yyyy-MM");
                //}
                //dd1_yyyymmdd.Value = DateTime.Today.ToString("yyyy-MM");
                // if (Request["old1month"] != null)
                //{
                //    dd2_yyyymmdd.Value = Server.UrlDecode(Request["old1month"].ToString().Trim());
                //}
                //if (dd2_yyyymmdd.Value.ToString().Trim() == "")
                //{
                //    dd2_yyyymmdd.Value = DateTime.Today.AddMonths(-1).ToString("yyyy-MM");
             
                //}
                //ImageButton1_Click(null, null);
            }

        }

        private void Initgeren()
        {
            try
            {
                string sql = "SELECT STAFFID,TO_CHAR(YYYYMMDD,'YYYY-MM-DD') AS YYYYMMDD,CLASSTYPE,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE ,OVERTIME_PLAN FROM EVERYDAY_STAFF_CHECK_INFO WHERE YYYYMM='" + dd_yyyymmdd .Value.ToString().Trim()+ "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "' ";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = sql + "  UNION ALL  SELECT STAFFID,TO_CHAR(YYYYMMDD,'YYYY-MM-DD') AS YYYYMMDD,CLASSTYPE,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE ,OVERTIME_PLAN FROM EVERYDAY_STAFF_CHECK_INFO WHERE YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + staffid.Text.ToString().Trim() + "' AND YYYYMMDD NOT IN (SELECT   YYYYMMDD FROM EVERYDAY_STAFF_CHECK_INFO WHERE YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "' )  ";

                }
                sql = sql + "    ORDER BY YYYYMMDD ";
                DataTable dt = OracleOperateHelp.getDataTable(sql);
                GridView1.Caption =  dd_yyyymmdd.Value.ToString()+"月个人出勤日历表";
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (Convert.ToDateTime(dd_yyyymmdd.Value.ToString() + "-01").Month > DateTime.Today.Month)
                    {
                        label17.Visible = true;
                    }
                    else
                    {
                        label17.Visible = false;
                    }
                }
                else
                {
                    GridView1.EmptyDataText = dd_yyyymmdd.Value.ToString()+"没有检索到您的日历记录";
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }



            }
            catch
            {
                GridView1.EmptyDataText = "网络错误，稍后重试";
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }
        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || //如果设置gridview不显示Header，就不写这个（否则报错）

 e.Row.RowType == DataControlRowType.DataRow ||

 e.Row.RowType == DataControlRowType.Footer)    //如果设置gridview不显示Footer，就不写这个（否则报错）
            {

                e.Row.Cells[0].Visible = false;

            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string svalue = e.Row.Cells[3].Text.ToString();
            
                if (svalue.Contains("早班"))
                {
                    e.Row.Cells[3].BackColor = Color.LemonChiffon;
                }
                else if (svalue.Contains("中班"))
                {
                    e.Row.Cells[3].BackColor = Color.LightGray;
                }
                else if (svalue.Contains("夜班"))
                {
                    e.Row.Cells[3].BackColor =Color.Gray;
                    e.Row.Cells[3].ForeColor = Color.WhiteSmoke;
                }
                if (svalue.Contains("休息"))
                {
                    e.Row.Cells[3].ForeColor = Color.Green;
                    e.Row.Cells[3].BackColor = Color.Snow;
                }
            }
        }
        private void Initgongzuo()
        {

            try
            {
                string sql = "SELECT STAFFID,TO_CHAR(YYYYMMDD,'YYYY-MM-DD') AS YYYYMMDD,OVERTIME_TYPE,(NVL(OVERTIME_FACT,0)+NVL(OVERTIME_FACT_XL,0)) AS OVERTIME FROM EVERYDAY_STAFF_CHECK_INFO WHERE (NVL(OVERTIME_FACT,0)+NVL(OVERTIME_FACT_XL,0)) >0  AND YYYYMM='" + dd1_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "' ";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = sql + "  UNION ALL  SELECT STAFFID,TO_CHAR(YYYYMMDD,'YYYY-MM-DD') AS YYYYMMDD,OVERTIME_TYPE,(NVL(OVERTIME_FACT,0)+NVL(OVERTIME_FACT_XL,0)) AS OVERTIME FROM EVERYDAY_STAFF_CHECK_INFO WHERE  (NVL(OVERTIME_FACT,0)+NVL(OVERTIME_FACT_XL,0)) >0  AND  YYYYMM='" + dd1_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + staffid.Text.ToString().Trim() + "' AND YYYYMMDD NOT IN (SELECT   YYYYMMDD FROM EVERYDAY_STAFF_CHECK_INFO WHERE YYYYMM='" + dd1_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "' )  ";

                }
                sql = sql + "    ORDER BY YYYYMMDD ";
                DataTable dt = OracleOperateHelp.getDataTable(sql);
                GridView2.Caption = dd1_yyyymmdd.Value.ToString() + "月个人加班实绩";
                if (dt.Rows.Count > 0)
                {
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }
                else
                {
                    GridView2.EmptyDataText = dd1_yyyymmdd.Value.ToString().Trim()+"没有加班实绩";
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }



            }
            catch
            {
                GridView2.EmptyDataText = "网络错误，稍后重试";
                GridView2.DataSource = null;
                GridView2.DataBind();
            }

        }
        private double sum = 0;//
        private double sum1 = 0;//
        private double sum2= 0;//
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || //如果设置gridview不显示Header，就不写这个（否则报错）

    e.Row.RowType == DataControlRowType.DataRow ||

    e.Row.RowType == DataControlRowType.Footer)    //如果设置gridview不显示Footer，就不写这个（否则报错）
            {


            }
            if (e.Row.RowIndex >= 0)
            {
                string stype = e.Row.Cells[1].Text;
                double dlin=Convert.ToDouble(e.Row.Cells[2].Text);
                switch (stype)
                {
                    case "平日": sum += dlin; break;
                    case "休日": sum1 += dlin; break;
                    case "祝日": sum2 += dlin; break;
                   default: sum += dlin; break;
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "平日：" + sum.ToString().Trim() + "H" + "    休日：" + sum1.ToString().Trim() + "H" + "    祝日：" + sum2.ToString().Trim() + "H";
               // e.Row.Cells[1].Text = "休日：" + sum1.ToString().Trim() + "H";
               // e.Row.Cells[2].Text = "祝日：" + sum2.ToString().Trim() + "H";
                e.Row.Cells[0].ColumnSpan = 3;
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
            }
        }

        private void Initlianluo()
        {
            try
            {
                string sql = " SELECT ID,TIMEOFF_TYPE,TO_CHAR(BEGIN_DATE,'YYYY-MM-DD') AS BEGIN_DATE,TO_CHAR(END_DATE,'YYYY-MM-DD') AS END_DATE FROM STAFF_TIMEOFF WHERE STATUS>='0'  AND STAFFID IN ('" + newstaffid.Text.ToString().Trim() + "')  ORDER BY BEGIN_DATE DESC, END_DATE DESC";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = " SELECT ID,TIMEOFF_TYPE,TO_CHAR(BEGIN_DATE,'YYYY-MM-DD') AS BEGIN_DATE,TO_CHAR(END_DATE,'YYYY-MM-DD') AS END_DATE FROM STAFF_TIMEOFF WHERE STATUS>='0'  AND STAFFID IN ('" + newstaffid.Text.ToString().Trim() + "','" + staffid.Text.ToString().Trim() + "')  ORDER BY BEGIN_DATE DESC, END_DATE DESC";

                }
                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    GridView3.DataSource = dt;
                    GridView3.DataBind();
                }
                else
                {
                    GridView3.EmptyDataText = "没有检索到欠勤记录";
                    GridView3.DataSource = dt;
                    GridView3.DataBind();
                }



            }
            catch
            {
                GridView3.EmptyDataText = "网络错误，稍后重试";
                GridView3.DataSource = null;
                GridView3.DataBind();
            }
        }
        private void Initnianjia()
        {

            string sql = "SELECT YYYYMM,PAY_80,LATE1,LATE2,LATE3,STAFFID,STAFFNAME,ON_DUTY,OFF_DUTY,PUBLIC_LEAVE,BACK1,BACK4,CJ,(SICK_LEAVE+SICK_LEAVE_180) AS SICK_LEAVE,HOUSE_PAY_COUNT,(MORNING+OVERTIME_MORNING+OVERTIME_XL_MORNING) AS MORNING,(MIDDLE+OVERTIME_MIDDLE+OVERTIME_XL_MIDDLE) AS MIDDLE,(NIGHT+OVERTIME_NIGHT+OVERTIME_XL_NIGHT) AS NIGHT, (OVERTIME1+OVERTIME1_XL) AS OVERTIME1,(OVERTIME2+OVERTIME2_XL) AS OVERTIME2,(OVERTIME3+OVERTIME3_XL) AS OVERTIME3 FROM STAFF_KQ WHERE YYYYMM='" + dd2_yyyymmdd.Value.ToString().Trim() + "'  AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "' ";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = sql + "  UNION ALL  SELECT  YYYYMM,PAY_80,LATE1,LATE2,LATE3,STAFFID,STAFFNAME,ON_DUTY,OFF_DUTY,PUBLIC_LEAVE,BACK1,BACK4,CJ,(SICK_LEAVE+SICK_LEAVE_180) AS SICK_LEAVE,HOUSE_PAY_COUNT,(MORNING+OVERTIME_MORNING+OVERTIME_XL_MORNING) AS MORNING,(MIDDLE+OVERTIME_MIDDLE+OVERTIME_XL_MIDDLE) AS MIDDLE,(NIGHT+OVERTIME_NIGHT+OVERTIME_XL_NIGHT) AS NIGHT, (OVERTIME1+OVERTIME1_XL) AS OVERTIME1,(OVERTIME2+OVERTIME2_XL) AS OVERTIME2,(OVERTIME3+OVERTIME3_XL) AS OVERTIME3 FROM STAFF_KQ WHERE YYYYMM='" + dd2_yyyymmdd.Value.ToString().Trim() + "'  AND STAFFID ='" + staffid.Text.ToString().Trim() + "'  AND YYYYMM NOT IN (SELECT YYYYMM FROM STAFF_KQ WHERE YYYYMM='" + dd2_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "') ";

                }
                try
                {
                   
                    DataTable dt = OracleOperateHelp.getDataTable(sql);

                    if (dt.Rows.Count > 0)
                    {
                        label_error.Text = "";
                        labelc.Text = "" + dd2_yyyymmdd.Value + "月的考勤汇总数据";
                        DataRow dr = dt.Rows[0];
                                   
              label_yyyymm.Text=dr["YYYYMM"].ToString().Trim();
                        label_staffid.Text = dr["STAFFID"].ToString().Trim();
                        label_staffname.Text = dr["STAFFNAME"].ToString().Trim() ; 
                        label_on_duty.Text = dr["ON_DUTY"].ToString().Trim() + "天"; 
                        label_off_duty.Text = dr["OFF_DUTY"].ToString().Trim() + "天"; 
                        label_public_leave.Text = dr["PUBLIC_LEAVE"].ToString().Trim() + "天"; 
                        label_back1.Text = dr["BACK1"].ToString().Trim() + "天"; 
                        label_back4.Text = dr["BACK4"].ToString().Trim() + "天"; 
                        label_cj.Text = dr["CJ"].ToString().Trim() + "天"; 
                        label_sick_leave.Text = dr["SICK_LEAVE"].ToString().Trim() + "天"; 
                        label_house_count.Text = dr["HOUSE_PAY_COUNT"].ToString().Trim() + "天"; 
                        label_morning.Text = dr["MORNING"].ToString().Trim() + "天"; 
                        label_middle.Text = dr["MIDDLE"].ToString().Trim() + "天"; 
                        label_night.Text = dr["NIGHT"].ToString().Trim() + "天"; 
                        label_overtime1.Text = dr["OVERTIME1"].ToString().Trim() + "小时"; 
                        label_overtime2.Text = dr["OVERTIME2"].ToString().Trim() + "小时"; 
                        label_overtime3.Text = dr["OVERTIME3"].ToString().Trim()+"小时";
                        label_late1.Text = dr["LATE1"].ToString().Trim() + "次";
                        label_late2.Text = dr["LATE2"].ToString().Trim() + "次";
                        label_late3.Text = dr["LATE3"].ToString().Trim() + "次";
                        label_pay80.Text = dr["PAY_80"].ToString().Trim() + "天";
                        label_staffid.Visible = true;
                        label_staffname.Visible = true;
                        if (label_on_duty.Text == "0天")
                        {
                            Link_label_on_duty.Visible = false;
                        }
                        else
                        {
                            Link_label_on_duty.Visible = true;
                        }
                        label_on_duty.Visible = true;
                        if (label_off_duty.Text == "0天")
                        {
                            Link_label_off_duty.Visible = false;
                        }
                        else
                        {
                            Link_label_off_duty.Visible = true;
                        }
                        label_off_duty.Visible = true;
                        if (label_public_leave.Text == "0天")
                        {
                            Link_label_public_leave.Visible = false;
                        }
                        else
                        {
                            Link_label_public_leave.Visible = true;
                        }
                        label_public_leave.Visible = true;
                        if (label_back1.Text == "0天")
                        {
                            Link_label_back1.Visible = false;
                        }
                        else
                        {
                            Link_label_back1.Visible = true;
                        }
                        label_back1.Visible = true;
                        if (label_back4.Text == "0天")
                        {
                            Link_label_back4.Visible = false;
                        }
                        else
                        {
                            Link_label_back4.Visible = true;
                        }
                        label_back4.Visible = true;
                        if (label_cj.Text == "0天")
                        {
                            Link_label_cj.Visible = false;
                        }
                        else
                        {
                            Link_label_cj.Visible = true;
                        }
                        label_cj.Visible = true;
                        if (label_sick_leave.Text == "0天")
                        {
                            Link_label_sick_leave.Visible = false;
                        }
                        else
                        {
                            Link_label_sick_leave.Visible = true;
                        }
                        label_sick_leave.Visible = true;
                        if (label_house_count.Text == "0天")
                        {
                            Link_label_house_count.Visible = false;
                        }
                        else
                        {
                            Link_label_house_count.Visible = true;
                        }
                        label_house_count.Visible = true;
                        if (label_morning.Text == "0天")
                        {
                            Link_label_morning.Visible = false;
                        }
                        else
                        {
                            Link_label_morning.Visible = true;
                        }
                        label_morning.Visible = true;
                        if (label_middle.Text == "0天")
                        {
                            Link_label_middle.Visible = false;
                        }
                        else
                        {
                            Link_label_middle.Visible = true;
                        }
                        label_middle.Visible = true;
                        if (label_night.Text == "0天")
                        {
                            Link_label_night.Visible = false;
                        }
                        else
                        {
                            Link_label_night.Visible = true;
                        }
                        label_night.Visible = true;
                        if (label_pay80.Text == "0天")
                        {
                            Link_label_pay80.Visible = false;
                        }
                        else
                        {
                            Link_label_pay80.Visible = true;
                        }
                        label_pay80.Visible = true;
                        if (label_overtime1.Text == "0小时")
                        {
                            Link_label_overtime1.Visible = false;
                        }
                        else
                        {
                            Link_label_overtime1.Visible = true;
                        }
                        label_overtime1.Visible = true;
                        if (label_overtime2.Text == "0小时")
                        {
                            Link_label_overtime2.Visible = false;
                        }
                        else
                        {
                            Link_label_overtime2.Visible = true;
                        }
                        label_overtime2.Visible = true;
                        if (label_overtime3.Text == "0小时")
                        {
                            Link_label_overtime3.Visible = false;
                        }
                        else
                        {
                            Link_label_overtime3.Visible = true;
                        }
                        label_overtime3.Visible = true;
                        if (label_late1.Text == "0次")
                        {
                            Link_label_late1.Visible = false;
                        }
                        else
                        {
                            Link_label_late1.Visible = true;
                        }
                        label_late1.Visible = true;
                        if (label_late2.Text == "0次")
                        {
                            Link_label_late2.Visible = false;
                        }
                        else
                        {
                            Link_label_late2.Visible = true;
                        }
                        label_late2.Visible = true;
                        if (label_late3.Text == "0次")
                        {
                            Link_label_late3.Visible = false;
                        }
                        else
                        {
                            Link_label_late3.Visible = true;
                        }
                        label_late3.Visible = true;
                        if (Convert.ToDateTime(dd2_yyyymmdd.Value + "-01") < Convert.ToDateTime("2016-06-01"))
                        {//2016-06之前不提供详情查询
                            Link_label_on_duty.Visible = false;
                            Link_label_off_duty.Visible = false;
                            Link_label_public_leave.Visible = false;
                            Link_label_back1.Visible = false;
                            Link_label_back4.Visible = false;
                            Link_label_sick_leave.Visible = false;
                            Link_label_cj.Visible = false;
                            Link_label_house_count.Visible = false;
                            Link_label_morning.Visible = false;
                            Link_label_middle.Visible = false;
                            Link_label_night.Visible = false;
                            Link_label_pay80.Visible = false;
                            Link_label_overtime1.Visible = false;
                            Link_label_overtime2.Visible = false;
                            Link_label_overtime3.Visible = false;
                            Link_label_late1.Visible = false;
                            Link_label_late2.Visible = false;
                            Link_label_late3.Visible = false;
                            divcj.Visible = false;
                            divgsj.Visible = false;
                            divmemo.Visible = true;
                        }
                        else
                        {
                            divcj.Visible = true;
                            divgsj.Visible = true;
                            divmemo.Visible = false;
                        }
                    }
                    else
                    {
                        label_staffid.Visible = false;
                        label_staffname.Visible = false;
                        label_on_duty.Visible = false;
                        label_off_duty.Visible = false;
                        label_public_leave.Visible = false;
                        label_back1.Visible = false;
                        label_back4.Visible = false;
                        label_sick_leave.Visible = false;
                        label_cj.Visible = false;
                        label_house_count.Visible = false;
                        label_morning.Visible = false;
                        label_middle.Visible = false;
                        label_night.Visible = false;
                        label_overtime1.Visible = false;
                        label_overtime2.Visible = false;
                        label_overtime3.Visible = false;
                        Link_label_on_duty.Visible = false;
                        Link_label_off_duty.Visible = false;
                        Link_label_public_leave.Visible = false;
                        Link_label_back1.Visible = false;
                        Link_label_back4.Visible = false;
                        Link_label_sick_leave.Visible = false;
                        Link_label_cj.Visible = false;
                        Link_label_house_count.Visible = false;
                        Link_label_morning.Visible = false;
                        Link_label_middle.Visible = false;
                        Link_label_night.Visible = false;
                        Link_label_overtime1.Visible = false;
                        Link_label_overtime2.Visible = false;
                        Link_label_overtime3.Visible = false;
                        Link_label_late1.Visible = false;
                        Link_label_late2.Visible = false;
                        Link_label_late3.Visible = false;
                        label_late1.Visible = false;
                        label_late2.Visible = false;
                        label_late3.Visible = false;
                        label_pay80.Visible = false;
                        Link_label_pay80.Visible = false;
                        label_error.Text = "检索不到您的"+dd2_yyyymmdd.Value+"月的考勤汇总数据";
                        labelc.Text = "";
                        divmemo.Visible = false;
                    }



                }
                catch
                {
                    label_staffid.Visible = false;
                    label_staffname.Visible = false;
                    label_on_duty.Visible = false;
                    label_off_duty.Visible = false;
                    label_public_leave.Visible = false;
                    label_back1.Visible = false;
                    label_back4.Visible = false;
                    label_sick_leave.Visible = false;
                    label_cj.Visible = false;
                    label_house_count.Visible = false;
                    label_morning.Visible = false;
                    label_middle.Visible = false;
                    label_night.Visible = false;
                    label_overtime1.Visible = false;
                    label_overtime2.Visible = false;
                    label_overtime3.Visible = false;
                    Link_label_on_duty.Visible = false;
                    Link_label_off_duty.Visible = false;
                    Link_label_public_leave.Visible = false;
                    Link_label_back1.Visible = false;
                    Link_label_back4.Visible = false;
                    Link_label_sick_leave.Visible = false;
                    Link_label_cj.Visible = false;
                    Link_label_house_count.Visible = false;
                    Link_label_morning.Visible = false;
                    Link_label_middle.Visible = false;
                    Link_label_night.Visible = false;
                    Link_label_overtime1.Visible = false;
                    Link_label_overtime2.Visible = false;
                    Link_label_overtime3.Visible = false;
                    Link_label_late1.Visible = false;
                    Link_label_late2.Visible = false;
                    Link_label_late3.Visible = false;
                    label_late1.Visible = false;
                    label_late2.Visible = false;
                    label_late3.Visible = false;
                    label_pay80.Visible = false;
                    Link_label_pay80.Visible = false;
                   label_error.Text = "网络错误，稍后重试";
                   labelc.Text = "";
                   divmemo.Visible = false;
                }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Labeltitle.Text = Hidden1.Value.ToString().Trim();
            switch (Labeltitle.Text)
            {
                case "个人日历":
                    divlabel1.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = true;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    Initgeren();
                    break;
                case "加班实绩":
                    divlabel2.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = true;
                    divjiben.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    Initgongzuo();
                    break;
                case "欠勤记录":
                    divlabel3.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divlianluo.Visible = true;
                    divnianji.Visible = false;
                    Initlianluo();
                    break;
                case "历史汇总":
                    divlabel4.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divlianluo.Visible =false ;
                    divnianji.Visible = true;
                    Initnianjia();
                    break;      
                   default:
                    divlabel1.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = true;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    Initgeren();
                    break;
            }

        }
        public void chang()
        {
            Labeltitle.Text = Hidden1.Value.ToString().Trim();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Initgeren();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Initgongzuo();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Initnianjia();
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            LinkButton send_btn = sender as LinkButton;
            GridViewRow row = (GridViewRow)send_btn.NamingContainer;
            string staffid = row.Cells[0].Text.ToString().Trim();
            string  yyyymmdd= row.Cells[1].Text.ToString().Trim();
            Response.Redirect("~/Weixin/attendance/Attendance_CalendayInfo.aspx?oldmonth=" + Server.UrlEncode(dd_yyyymmdd.Value.ToString().Trim()) + "&staffid=" + staffid + "&olddate=" + Server.UrlEncode(yyyymmdd)+"");

        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton send_btn = sender as LinkButton;
            GridViewRow row = (GridViewRow)send_btn.NamingContainer;
            string staffid = row.Cells[0].Text.ToString().Trim();
            string yyyymmdd = row.Cells[1].Text.ToString().Trim();
            Response.Redirect("~/Weixin/attendance/Attendance_TimeoffInfo.aspx?id=" + staffid   + "");

        }

        protected void Link_label_on_duty_Click(object sender, EventArgs e)
        {
            LinkButton send_btn = sender as LinkButton;
            string svalue = send_btn.ID.ToString().Replace("Link_label_", "").Trim();
            if (svalue.Contains("overtime"))
            {//分开好写后续的网页
                Response.Redirect("~/Weixin/attendance/Attendance_OvertimeInfo.aspx?oldmonth=" + Server.UrlEncode(label_yyyymm.Text.ToString().Trim()) + "&staffid=" + label_staffid.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode(svalue) + "");

            }
           
            else
            {
                Response.Redirect("~/Weixin/attendance/Attendance_OtherInfo.aspx?oldmonth=" + Server.UrlEncode(label_yyyymm.Text.ToString().Trim()) + "&staffid=" + label_staffid.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode(svalue) + "");

            }
        }

    }
}