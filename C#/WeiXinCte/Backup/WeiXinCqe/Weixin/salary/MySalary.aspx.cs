using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
using WeiXinWebApp;

namespace WeiXinCqe
{
    public partial class MySalary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["newstaffid"] == null)
                {
                    //LogTextHelper.Error("chongxinhuoqu");
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status3#wechat_redirect");
                }
                else
                {
                    staffid.Text = Request.Cookies["staffid"].Value.ToString().Trim();
                    newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    Hidden1.Value = "基本信息";
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
                        dd_yyyymmdd.Value = DateTime.Today.AddMonths(-1).ToString("yyyy-MM");
                    }

                    ImageButton1_Click(null, null);
                }
                //staffid.Text = "092156";
                //newstaffid.Text = "D60001";
                //Hidden1.Value = "基本信息";
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
                //    dd_yyyymmdd.Value = DateTime.Today.AddMonths(-1).ToString("yyyy-MM");
                //}

                //ImageButton1_Click(null, null);
            }
        }
        private void Initnianjia()
        {
            try
            {
                string sql = " SELECT * FROM STAFF_SALARY_NOPRINT WHERE STAFFID ='" + newstaffid.Text.ToString().Trim() + "'";

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    ii.Checked = true;
                    Label4.Text = "感谢您在环保和经费方面做出的努力";

                }
                else
                {
                    ii.Checked = false;
                    Label4.Text = "";

                }



            }
            catch
            {
                ii.Checked = false;
                Label4.Text = "";

            }
        }
        private void Initgeren()
        {
            string sql = "SELECT YYYYMM,STAFFID,STAFFNAME,TO_CHAR(DATE_IN,'YYYY-MM-DD')  AS DATE_IN,TO_CHAR(DATE_OUT,'YYYY-MM-DD') AS DATE_OUT,HF,RANK,POST,TECH_POST,TOPDEPTNAME,DEPTNAME FROM STAFF_SALARY_XL WHERE YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "'";

            if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
            {
                sql += "    UNION ALL  SELECT YYYYMM,STAFFID,STAFFNAME,TO_CHAR(DATE_IN,'YYYY-MM-DD')  AS DATE_IN,TO_CHAR(DATE_OUT,'YYYY-MM-DD') AS DATE_OUT,HF,RANK,POST,TECH_POST,TOPDEPTNAME,DEPTNAME FROM STAFF_SALARY_XL WHERE YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + staffid.Text.ToString().Trim() + "'  AND  YYYYMM NOT IN (SELECT YYYYMM FROM STAFF_SALARY_XL WHERE YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "') ";
            }
            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Label_GongZuo_Id.Text = dr["STAFFID"].ToString().Trim();
                Label_GongZuo_Name.Text = dr["STAFFNAME"].ToString().Trim();
                Label_GongZuo_In.Text = dr["DATE_IN"].ToString().Trim();
                Label_GongZuo_Test.Text = dr["DATE_OUT"].ToString().Trim();
                Label_GongZuo_Rank.Text = dr["RANK"].ToString().Trim();
                Label_GongZuo_Hf.Text = dr["HF"].ToString().Trim();
                Label_GongZuo_Post.Text = dr["POST"].ToString().Trim();
                Label_GongZuo_TechPost.Text = dr["TECH_POST"].ToString().Trim();
                Label_GongZuo_TopDeptName.Text = dr["TOPDEPTNAME"].ToString().Trim();
                Label_GongZuo_DeptName.Text = dr["DEPTNAME"].ToString().Trim();

                Label_GongZuo_Id.ForeColor = System.Drawing.Color.Black;
            }
            else
            {

                Label_GongZuo_Id.Text = "检索不到您的" + dd_yyyymmdd.Value + "月工资基本数据";
                Label_GongZuo_Id.ForeColor = System.Drawing.Color.Red;
                Label_GongZuo_In.Text = "";
                Label_GongZuo_Name.Text = "";
                Label_GongZuo_Test.Text = "";
                Label_GongZuo_Rank.Text = "";
                Label_GongZuo_Hf.Text = "";
                Label_GongZuo_Post.Text = "";
                Label_GongZuo_TechPost.Text = "";
                Label_GongZuo_TopDeptName.Text = "";
                Label_GongZuo_DeptName.Text = "";


            }

        }
        private void Initgongzuo()
        {

            string sql = "SELECT A.YYYYMM,B.PAY_80,B.LATE1,B.LATE2,B.LATE3,B.STAFFID,B.STAFFNAME,B.ON_DUTY,B.OFF_DUTY,B.PUBLIC_LEAVE,B.BACK1,B.BACK4,B.CJ,(B.SICK_LEAVE+B.SICK_LEAVE_180) AS SICK_LEAVE,B.HOUSE_PAY_COUNT,(B.MORNING+B.OVERTIME_MORNING+B.OVERTIME_XL_MORNING) AS MORNING,(B.MIDDLE+B.OVERTIME_MIDDLE+B.OVERTIME_XL_MIDDLE) AS MIDDLE,(B.NIGHT+B.OVERTIME_NIGHT+B.OVERTIME_XL_NIGHT) AS NIGHT, (B.OVERTIME1+B.OVERTIME1_XL) AS OVERTIME1,(B.OVERTIME2+B.OVERTIME2_XL) AS OVERTIME2,(B.OVERTIME3+B.OVERTIME3_XL) AS OVERTIME3 FROM STAFF_SALARY_XL A LEFT JOIN STAFF_KQ B ON A.STAFFID=B.STAFFID  AND A.YYYYMM=B.YYYYMM  WHERE A.YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "'  AND A.STAFFID ='" + newstaffid.Text.ToString().Trim() + "' ";

            if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
            {
                sql = sql + "  UNION ALL   SELECT A.YYYYMM,B.PAY_80,B.LATE1,B.LATE2,B.LATE3,B.STAFFID,B.STAFFNAME,B.ON_DUTY,B.OFF_DUTY,B.PUBLIC_LEAVE,B.BACK1,B.BACK4,B.CJ,(B.SICK_LEAVE+B.SICK_LEAVE_180) AS SICK_LEAVE,B.HOUSE_PAY_COUNT,(B.MORNING+B.OVERTIME_MORNING+B.OVERTIME_XL_MORNING) AS MORNING,(B.MIDDLE+B.OVERTIME_MIDDLE+B.OVERTIME_XL_MIDDLE) AS MIDDLE,(B.NIGHT+B.OVERTIME_NIGHT+B.OVERTIME_XL_NIGHT) AS NIGHT, (B.OVERTIME1+B.OVERTIME1_XL) AS OVERTIME1,(B.OVERTIME2+B.OVERTIME2_XL) AS OVERTIME2,(B.OVERTIME3+B.OVERTIME3_XL) AS OVERTIME3 FROM STAFF_SALARY_XL A LEFT JOIN STAFF_KQ B ON A.STAFFID=B.STAFFID  AND A.YYYYMM=B.YYYYMM  WHERE A.YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "'  AND A.STAFFID ='" + staffid.Text.ToString().Trim() + "'  AND  A.YYYYMM NOT IN (SELECT YYYYMM FROM STAFF_SALARY_XL WHERE YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "') ";

            }
            try
            {

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    divdd.Visible = false;
                    label_error.Text = "";
                    DataRow dr = dt.Rows[0];
                    label_yyyymm.Text = dr["YYYYMM"].ToString().Trim();
                    label_staffid.Text = dr["STAFFID"].ToString().Trim();
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
                    label_overtime3.Text = dr["OVERTIME3"].ToString().Trim() + "小时";
                    label_late1.Text = dr["LATE1"].ToString().Trim() + "次";
                    label_late2.Text = dr["LATE2"].ToString().Trim() + "次";
                    label_late3.Text = dr["LATE3"].ToString().Trim() + "次";
                    label_pay80.Text = dr["PAY_80"].ToString().Trim() + "天";
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
                    if (Convert.ToDateTime(dd_yyyymmdd.Value + "-01") < Convert.ToDateTime("2016-06-01"))
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
                    label_error.Text = "检索不到您的" + dd_yyyymmdd.Value + "月工资考勤数据";
                    divdd.Visible = true;
                    divmemo.Visible = false;
                }



            }
            catch
            {
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
                divdd.Visible = true;
                divmemo.Visible = false;
            }
        }
        private void Initlianluo()
        {
            string sql = " SELECT A.V_LATE1,A.V_LATE2,A.V_BIG,A.V_SMALL,A.SMALL_PUNISHMENT,A.BIG_PUNISHMENT,B.LATE1,B.LATE2,B.LATE3, A.V_DAY_PAY,B.ON_DUTY,A.ZHAOLI_PAY,A.LATE_OUT,A.ISCHANXIU, A.V_OFF_DUTY,A.V_PERFECT_ATTENDANCE_PAY_DAY,A.TYPE1,A.TYPE2,A.TYPE3,A.V_ON_DUTY,A.V_MORNING_PAY,A.V_MIDDLE_PAY,A.V_NIGHT_PAY,A.V_PAY_43 ,(NVL(B.OVERTIME_MORNING,0)+NVL(B.OVERTIME_XL_MORNING,0)+NVL(B.MORNING,0)) AS MORNING,(NVL(B.OVERTIME_MIDDLE,0)+NVL(B.OVERTIME_XL_MIDDLE,0)+NVL(B.MIDDLE,0)) AS MIDDLE ,(NVL(B.OVERTIME_NIGHT,0)+NVL(B.OVERTIME_XL_NIGHT,0)+NVL(B.NIGHT,0)) AS NIGHT,B.PAY_80 ,A.V_HOUSE_PAY,A.V_SUM_DUTY,B.HOUSE_PAY_COUNT, (B.OVERTIME1+B.OVERTIME1_XL) AS OVERTIME1,(B.OVERTIME2+B.OVERTIME2_XL) AS OVERTIME2,(B.OVERTIME3+B.OVERTIME3_XL) AS OVERTIME3,A.YYYYMM,A.STAFFID,A.COMPETENCY_PAY,A.WELFARE_PAY,A.PERFECT_ATTENDANCE_PAY,A.POST_PAY,A.TECH_PAY,A.SPECIAL_PAY,A.BASE_PAY,A.BASE_PAY_JS,A.OVERTIME1_PAY,A.OVERTIME2_PAY,A.OVERTIME3_PAY,A.SEASON_PAY,A.CHANGE_PAY,A.ADJUSTMENT_PAY,A.BONUS_PAY,A.OTHER_PAY,A.HOUSE_PAY,A.SUM_PAY,A.SUM_OUT,A.OFF_DUTY_OUT,A.PERFECT_ATTENDANCE_OUT,A.SB_OUT,A.GJJ_OUT,A.TAX_OUT,DUE_OUT,A.MEDICAL_OUT,A.OTHER_OUT,A.MINUS_PAY,A.FACT_PAY  FROM STAFF_SALARY_XL A LEFT JOIN  STAFF_KQ B ON A.STAFFID=B.STAFFID AND  A.YYYYMM=B.YYYYMM WHERE A.YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "'  AND A.STAFFID ='" + newstaffid.Text.ToString().Trim() + "' ";

            sql += " UNION ALL SELECT  A.V_LATE1,A.V_LATE2,A.V_BIG,A.V_SMALL,A.SMALL_PUNISHMENT,A.BIG_PUNISHMENT,B.LATE1,B.LATE2,B.LATE3, A.V_DAY_PAY,B.ON_DUTY,A.ZHAOLI_PAY,A.LATE_OUT,A.ISCHANXIU, A.V_OFF_DUTY,A.V_PERFECT_ATTENDANCE_PAY_DAY,A.TYPE1,A.TYPE2,A.TYPE3,A.V_ON_DUTY,A.V_MORNING_PAY,A.V_MIDDLE_PAY,A.V_NIGHT_PAY,A.V_PAY_43 ,(NVL(B.OVERTIME_MORNING,0)+NVL(B.OVERTIME_XL_MORNING,0)+NVL(B.MORNING,0)) AS MORNING,(NVL(B.OVERTIME_MIDDLE,0)+NVL(B.OVERTIME_XL_MIDDLE,0)+NVL(B.MIDDLE,0)) AS MIDDLE ,(NVL(B.OVERTIME_NIGHT,0)+NVL(B.OVERTIME_XL_NIGHT,0)+NVL(B.NIGHT,0)) AS NIGHT,B.PAY_80 ,A.V_HOUSE_PAY,A.V_SUM_DUTY,B.HOUSE_PAY_COUNT, (B.OVERTIME1+B.OVERTIME1_XL) AS OVERTIME1,(B.OVERTIME2+B.OVERTIME2_XL) AS OVERTIME2,(B.OVERTIME3+B.OVERTIME3_XL) AS OVERTIME3,A.YYYYMM,A.STAFFID,A.COMPETENCY_PAY,A.WELFARE_PAY,A.PERFECT_ATTENDANCE_PAY,A.POST_PAY,A.TECH_PAY,A.SPECIAL_PAY,A.BASE_PAY,A.BASE_PAY_JS,A.OVERTIME1_PAY,A.OVERTIME2_PAY,A.OVERTIME3_PAY,A.SEASON_PAY,A.CHANGE_PAY,A.ADJUSTMENT_PAY,A.BONUS_PAY,A.OTHER_PAY,A.HOUSE_PAY,A.SUM_PAY,A.SUM_OUT,A.OFF_DUTY_OUT,A.PERFECT_ATTENDANCE_OUT,A.SB_OUT,A.GJJ_OUT,A.TAX_OUT,DUE_OUT,A.MEDICAL_OUT,A.OTHER_OUT,A.MINUS_PAY,A.FACT_PAY  FROM STAFF_SALARY_XL A LEFT JOIN  STAFF_KQ B ON A.STAFFID=B.STAFFID AND  A.YYYYMM=B.YYYYMM WHERE A.YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "'  AND A.STAFFID ='" + staffid.Text.ToString().Trim() + "'  AND A.YYYYMM NOT IN (SELECT  YYYYMM FROM STAFF_SALARY_XL WHERE YYYYMM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND STAFFID ='" + newstaffid.Text.ToString().Trim() + "') ";
            DateTime dddd = Convert.ToDateTime(dd_yyyymmdd.Value.ToString().Trim()+"-01");
            if (dddd < Convert.ToDateTime("2016-06-01"))
            {
                divlianluo.Visible = false;
                divlianluo1.Visible = true;
                if (dddd < Convert.ToDateTime("2014-05-01"))
                {
                    divzhaoli.Visible = true;
                }
                if (dddd <Convert.ToDateTime("2015-05-01"))
                {
                    divchizao.Visible = true;
                }
            }
            else
            {
                divlianluo.Visible = true;
                divlianluo1.Visible = false;
            }
            try
            {

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    divddd.Visible = false;
                    label_errs.Text = "";
                    DataRow dr = dt.Rows[0];
                    label_SYYYYMM.Text = dr["YYYYMM"].ToString().Trim();
                    label_SSTAFFID.Text = dr["STAFFID"].ToString().Trim();
                    label_SOVERTIME1.Text = dr["OVERTIME1"].ToString().Trim();
                    label_SOVERTIME2.Text = dr["OVERTIME2"].ToString().Trim();
                    label_SOVERTIME3.Text = dr["OVERTIME3"].ToString().Trim();
                    label_SV_HOUSE_PAY.Text = dr["V_HOUSE_PAY"].ToString().Trim();
                    label_SV_SUM_DUTY.Text = dr["V_SUM_DUTY"].ToString().Trim();
                    label_SV_ON_DUTY.Text = dr["V_ON_DUTY"].ToString().Trim();
                    label_SHOUSE_PAY_COUNT.Text = dr["HOUSE_PAY_COUNT"].ToString().Trim();
                    label_STYPE1.Text = dr["TYPE1"].ToString().Trim();
                    label_STYPE2.Text = dr["TYPE2"].ToString().Trim();
                    label_STYPE3.Text = dr["TYPE3"].ToString().Trim();
                    label_SMORNING.Text = dr["MORNING"].ToString().Trim();
                    label_SV_MORNING.Text = dr["V_MORNING_PAY"].ToString().Trim();
                    label_SMIDDLE.Text = dr["MIDDLE"].ToString().Trim();
                    label_SV_MIDDLE.Text = dr["V_MIDDLE_PAY"].ToString().Trim();
                    label_SNIGHT.Text = dr["NIGHT"].ToString().Trim();
                    label_SV_NIGHT.Text = dr["V_NIGHT_PAY"].ToString().Trim();
                    label_SPAY43.Text = dr["PAY_80"].ToString().Trim();
                    label_SV_PAY43.Text = dr["V_PAY_43"].ToString().Trim();
                    label_SISCHANXIU.Text = dr["ISCHANXIU"].ToString().Trim();
                    label_SV_OFF_DUTY.Text = dr["V_OFF_DUTY"].ToString().Trim();
                    label_SV_PERFECT_ATTENDANCE_PAY_DAY.Text = dr["V_PERFECT_ATTENDANCE_PAY_DAY"].ToString().Trim();


                    label_S_ON_DUTY.Text = dr["ON_DUTY"].ToString().Trim();
                    label_SV_DAY_PAY.Text = dr["V_DAY_PAY"].ToString().Trim();


                    label_S_LATE1.Text = dr["LATE1"].ToString().Trim();
                    label_S_LATE2.Text = dr["LATE2"].ToString().Trim();
                    label_S_LATE3.Text = dr["LATE3"].ToString().Trim();
                    label_S_V_LATE1.Text = dr["V_LATE1"].ToString().Trim();
                    label_S_V_LATE2.Text = dr["V_LATE2"].ToString().Trim();
                    label_S_V_BIG.Text = dr["V_BIG"].ToString().Trim();
                    label_S_V_SMALL.Text = dr["V_SMALL"].ToString().Trim();
                    label_S_BIG_PUNISHMENT.Text = dr["BIG_PUNISHMENT"].ToString().Trim();
                    label_S_SMALL_PUNISHMENT.Text = dr["SMALL_PUNISHMENT"].ToString().Trim();



                    Label_BASE_PAY_T.Text = "基本工资(A):  " + dr["BASE_PAY"].ToString().Trim() + "  =a+b+c";
                    label_BASE_PAY.Text = dr["BASE_PAY"].ToString().Trim();
                    label_COMPETENCY_PAY.Text = dr["COMPETENCY_PAY"].ToString().Trim();
                    label_PERFECT_ATTENDANCE_PAY.Text = dr["PERFECT_ATTENDANCE_PAY"].ToString().Trim();
                    label_WELFARE_PAY.Text = dr["WELFARE_PAY"].ToString().Trim();
                    label_TECH_PAY.Text = dr["TECH_PAY"].ToString().Trim();
                    label_SPECIAL_PAY.Text = dr["SPECIAL_PAY"].ToString().Trim();
                    label_POST_PAY.Text = dr["POST_PAY"].ToString().Trim();
                    Label_BASE_PAY_JS_T.Text = "工资基数(B):  " + dr["BASE_PAY_JS"].ToString().Trim() + "  =A+d+e+f";
                    label_BASE_PAY_JS.Text = dr["BASE_PAY_JS"].ToString().Trim();
                    Label_SUM_PAY_T.Text = "支给合计(C):  " + dr["SUM_PAY"].ToString().Trim() + "  =B+g+h+i+j+k+l+m+n+o";
                    label_SUM_PAY.Text = dr["SUM_PAY"].ToString().Trim();
                    label_OVERTIME1_PAY.Text = dr["OVERTIME1_PAY"].ToString().Trim();
                    label_OVERTIME2_PAY.Text = dr["OVERTIME2_PAY"].ToString().Trim();
                    label_OVERTIME3_PAY.Text = dr["OVERTIME3_PAY"].ToString().Trim();
                    label_BONUS_PAY.Text = dr["BONUS_PAY"].ToString().Trim();
                    label_SEASON_PAY.Text = dr["SEASON_PAY"].ToString().Trim();
                    label_ADJUSTMENT_PAY.Text = dr["ADJUSTMENT_PAY"].ToString().Trim();
                    label_OTHER_PAY.Text = dr["OTHER_PAY"].ToString().Trim();
                    label_HOUSE_PAY.Text = dr["HOUSE_PAY"].ToString().Trim();
                    label_CHANGE_PAY.Text = dr["CHANGE_PAY"].ToString().Trim();
                    Label_SUM_OUT_T.Text = "扣除合计(D):  " + dr["SUM_OUT"].ToString().Trim() + "  =p+q+r+s+t+u+v+w";
                    label_SUM_OUT.Text = dr["SUM_OUT"].ToString().Trim();
                    label_OFF_DUTY_OUT.Text = dr["OFF_DUTY_OUT"].ToString().Trim();
                    label_PERFECT_ATTENDANCE_OUT.Text = dr["PERFECT_ATTENDANCE_OUT"].ToString().Trim();
                    label_SB_OUT.Text = dr["SB_OUT"].ToString().Trim();
                    label_GJJ_OUT.Text = dr["GJJ_OUT"].ToString().Trim();
                    label_TAX_OUT.Text = dr["TAX_OUT"].ToString().Trim();
                    label_DUE_OUT.Text = dr["DUE_OUT"].ToString().Trim();
                    label_MEDICAL_OUT.Text = dr["MEDICAL_OUT"].ToString().Trim();
                    label_OTHER_OUT.Text = dr["OTHER_OUT"].ToString().Trim();
                    string s_minus = dr["MINUS_PAY"].ToString().Trim();
                    string s_fact = dr["FACT_PAY"].ToString().Trim();
                    if (s_minus == "0")
                    {
                        Label_MINUS_PAY_T.Text = "反付工资:  0";
                        Label_FACT_PAY_T.Text = "实发工资:  " + s_fact + "  =C-D";
                    }
                    else
                    {
                        Label_MINUS_PAY_T.Text = "反付工资:  " + s_minus + "  =D-C";
                        Label_FACT_PAY_T.Text = "实发工资:  0";

                    }

                    //2015-05之前的数据
                    div1.Visible = false;
                    Label21.Text = "实发工资:" + dr["FACT_PAY"].ToString().Trim();
                    Label23.Text = "反负工资:" + dr["MINUS_PAY"].ToString().Trim();
                    Label27.Text = "支给合计:" + dr["SUM_PAY"].ToString().Trim();
                    Label29.Text = "扣除合计:" + dr["SUM_OUT"].ToString().Trim();
                    Label32.Text = "职能给:" + dr["COMPETENCY_PAY"].ToString().Trim();
                    Label34.Text = "福利:" + dr["WELFARE_PAY"].ToString().Trim();
                    Label35.Text = "精勤:" + dr["PERFECT_ATTENDANCE_PAY"].ToString().Trim();
                    Label36.Text = "基本工资:" + dr["BASE_PAY"].ToString().Trim();
                    Label38.Text = "行政补贴:" + dr["POST_PAY"].ToString().Trim();
                    Label39.Text = "技术补贴:" + dr["TECH_PAY"].ToString().Trim();
                    Label41.Text = "特殊:" + dr["SPECIAL_PAY"].ToString().Trim();
                    Label43.Text = "住宅补助:" + dr["HOUSE_PAY"].ToString().Trim();
                    Label45.Text = "时间外:" + dr["OVERTIME1_PAY"].ToString().Trim();
                    Label47.Text = "休日:" + dr["OVERTIME2_PAY"].ToString().Trim();
                    Label49.Text = "祝日:" + dr["OVERTIME3_PAY"].ToString().Trim();
                    Label51.Text = "奖金:" + dr["BONUS_PAY"].ToString().Trim();
                    Label53.Text = "季节:" + dr["SEASON_PAY"].ToString().Trim();
                    Label55.Text = "交替:" + dr["CHANGE_PAY"].ToString().Trim();
                    Label57.Text = "调整:" + dr["ADJUSTMENT_PAY"].ToString().Trim();
                    Label59.Text = "其他给:" + dr["OTHER_PAY"].ToString().Trim();
                    Label60.Text = "欠勤额:" + dr["OFF_DUTY_OUT"].ToString().Trim();
                    Label62.Text = "精勤扣:" + dr["PERFECT_ATTENDANCE_OUT"].ToString().Trim();
                    Label64.Text = "迟早额:" + dr["LATE_OUT"].ToString().Trim();
                    Label66.Text = "保险扣:" + dr["SB_OUT"].ToString().Trim();
                    Label68.Text = "公积金:" + dr["GJJ_OUT"].ToString().Trim();
                    Label70.Text = "所得税:" + dr["TAX_OUT"].ToString().Trim();
                    Label72.Text = "会费:" + dr["DUE_OUT"].ToString().Trim();
                    Label74.Text = "药费扣:" + dr["MEDICAL_OUT"].ToString().Trim();
                    Label76.Text = "其他扣:" + dr["OTHER_OUT"].ToString().Trim();
                    Label78.Text = "朝礼:" + dr["ZHAOLI_PAY"].ToString().Trim(); 
                 

                }
                else
                {
                    divddd.Visible = true;
                    label_errs.Text = "检索不到您的" + dd_yyyymmdd.Value + "月工资数据";
                    //2015-05之前的数据
                    div1.Visible = true;
                    label17.Text = "检索不到您的" + dd_yyyymmdd.Value + "月工资数据";
                    label_SYYYYMM.Text = "";
                    label_SSTAFFID.Text = "";
                    label_SOVERTIME1.Text = "";
                    label_SOVERTIME2.Text = "";
                    label_SOVERTIME3.Text = "";
                    label_SV_HOUSE_PAY.Text = "";
                    label_SV_SUM_DUTY.Text = "";
                    label_SV_ON_DUTY.Text = "";
                    label_SHOUSE_PAY_COUNT.Text = "";
                    label_STYPE1.Text = "";
                    label_STYPE2.Text = "";
                    label_STYPE3.Text = "";
                    label_SMORNING.Text = "";
                    label_SV_MORNING.Text = "";
                    label_SMIDDLE.Text = "";
                    label_SV_MIDDLE.Text = "";
                    label_SNIGHT.Text = "";
                    label_SV_NIGHT.Text = "";
                    label_SPAY43.Text = "";
                    label_SV_PAY43.Text = "";
                    label_SISCHANXIU.Text = "";
                    label_SV_OFF_DUTY.Text = "";
                    label_SV_PERFECT_ATTENDANCE_PAY_DAY.Text = "";
                    label_SV_ON_DUTY.Text = "";
                    label_SV_DAY_PAY.Text = "";
                    label_S_LATE1.Text ="";
                    label_S_LATE2.Text = "";
                    label_S_LATE3.Text = "";
                    label_S_V_LATE1.Text = "";
                    label_S_V_LATE2.Text = "";
                    label_S_V_BIG.Text = "";
                    label_S_V_SMALL.Text = "";
                    label_S_BIG_PUNISHMENT.Text = "";
                    label_S_SMALL_PUNISHMENT.Text = "";

                    Label_BASE_PAY_T.Text = "基本工资(A):  " + "  =a+b+c";
                    label_BASE_PAY.Text = "";
                    label_COMPETENCY_PAY.Text = "";
                    label_PERFECT_ATTENDANCE_PAY.Text = "";
                    label_WELFARE_PAY.Text = "";
                    label_TECH_PAY.Text = "";
                    label_SPECIAL_PAY.Text = "";
                    label_POST_PAY.Text = "";
                    Label_BASE_PAY_JS_T.Text = "工资基数(B):  " +  "  =A+d+e+f";
                    label_BASE_PAY_JS.Text = "";
                    Label_SUM_PAY_T.Text = "支给合计(C):  " +  "  =B+g+h+i+j+k+l+m+n+o";
                    label_SUM_PAY.Text = "";
                    label_OVERTIME1_PAY.Text = "";
                    label_OVERTIME2_PAY.Text = "";
                    label_OVERTIME3_PAY.Text = "";
                    label_BONUS_PAY.Text = "";
                    label_SEASON_PAY.Text = "";
                    label_ADJUSTMENT_PAY.Text = "";
                    label_OTHER_PAY.Text = "";
                    label_HOUSE_PAY.Text = "";
                    label_CHANGE_PAY.Text = ""; 
                    Label_SUM_OUT_T.Text = "扣除合计(D):  " + "  =p+q+r+s+t+u+v+w";
                    label_SUM_OUT.Text = "";
                    label_OFF_DUTY_OUT.Text = "";
                    label_PERFECT_ATTENDANCE_OUT.Text = "";
                    label_SB_OUT.Text = "";
                    label_GJJ_OUT.Text = "";
                    label_TAX_OUT.Text = "";
                    label_DUE_OUT.Text = "";
                    label_MEDICAL_OUT.Text = "";
                    label_OTHER_OUT.Text = "";
                    Label_MINUS_PAY_T.Text = "反付工资:  0";
                    Label_FACT_PAY_T.Text = "实发工资:  " + "  =C-D";
                    Label21.Text = "实发工资:" ;
                    Label23.Text = "反负工资:" ;
                    Label27.Text = "支给合计:" ;
                    Label29.Text = "扣除合计:";
                    Label32.Text = "职能给:" ;
                    Label34.Text = "福利:" ;
                    Label35.Text = "精勤:" ;
                    Label36.Text = "基本工资:";
                    Label38.Text = "行政补贴:" ;
                    Label39.Text = "技术补贴:" ;
                    Label41.Text = "特殊:"  ;
                    Label43.Text = "住宅补助:";
                    Label45.Text = "时间外:" ;
                    Label47.Text = "休日:" ;
                    Label49.Text = "祝日:" ;
                    Label51.Text = "奖金:" ;
                    Label53.Text = "季节:" ;
                    Label55.Text = "交替:" ;
                    Label57.Text = "调整:" ;
                    Label59.Text = "其他给:" ;
                    Label60.Text = "欠勤额:" ;
                    Label62.Text = "精勤扣:" ;
                    Label64.Text = "迟早额:" ;
                    Label66.Text = "保险扣:" ;
                    Label68.Text = "公积金:";
                    Label70.Text = "所得税:";
                    Label72.Text = "会费:" ;
                    Label74.Text = "药费扣:" ;
                    Label76.Text = "其他扣:" ;
                    Label78.Text = "朝礼:" ; 

                }
            }
            catch
            {
                divddd.Visible = true;
                label_errs.Text = "网络错误，稍后重试";

                label_SYYYYMM.Text = "";
                label_SSTAFFID.Text = "";
                label_SOVERTIME1.Text = "";
                label_SOVERTIME2.Text = "";
                label_SOVERTIME3.Text = "";
                label_SV_HOUSE_PAY.Text = "";
                label_SV_SUM_DUTY.Text = "";
                label_SV_ON_DUTY.Text = "";
                label_SHOUSE_PAY_COUNT.Text = "";
                label_STYPE1.Text = "";
                label_STYPE2.Text = "";
                label_STYPE3.Text = "";
                label_SMORNING.Text = "";
                label_SV_MORNING.Text = "";
                label_SMIDDLE.Text = "";
                label_SV_MIDDLE.Text = "";
                label_SNIGHT.Text = "";
                label_SV_NIGHT.Text = "";
                label_SPAY43.Text = "";
                label_SV_PAY43.Text = "";
                label_SISCHANXIU.Text = "";
                label_SV_OFF_DUTY.Text = "";
                label_SV_PERFECT_ATTENDANCE_PAY_DAY.Text = "";

                Label_BASE_PAY_T.Text = "基本工资(A):  " + "  =a+b+c";
                label_BASE_PAY.Text = "";
                label_COMPETENCY_PAY.Text = "";
                label_PERFECT_ATTENDANCE_PAY.Text = "";
                label_WELFARE_PAY.Text = "";
                label_TECH_PAY.Text = "";
                label_SPECIAL_PAY.Text = "";
                label_POST_PAY.Text = "";
                Label_BASE_PAY_JS_T.Text = "工资基数(B):  " + "  =A+d+e+f";
                label_BASE_PAY_JS.Text = "";
                Label_SUM_PAY_T.Text = "支给合计(C):  " + "  =B+g+h+i+j+k+l+m+n+o";
                label_SUM_PAY.Text = "";
                label_OVERTIME1_PAY.Text = "";
                label_OVERTIME2_PAY.Text = "";
                label_OVERTIME3_PAY.Text = "";
                label_BONUS_PAY.Text = "";
                label_SEASON_PAY.Text = "";
                label_ADJUSTMENT_PAY.Text = "";
                label_OTHER_PAY.Text = "";
                label_HOUSE_PAY.Text = "";
                label_CHANGE_PAY.Text = "";
                Label_SUM_OUT_T.Text = "扣除合计(D):  " + "  =p+q+r+s+t+u+v+w";
                label_SUM_OUT.Text = "";
                label_OFF_DUTY_OUT.Text = "";
                label_PERFECT_ATTENDANCE_OUT.Text = "";
                label_SB_OUT.Text = "";
                label_GJJ_OUT.Text = "";
                label_TAX_OUT.Text = "";
                label_DUE_OUT.Text = "";
                label_MEDICAL_OUT.Text = "";
                label_OTHER_OUT.Text = "";
                Label_MINUS_PAY_T.Text = "反付工资:  0";
                Label_FACT_PAY_T.Text = "实发工资:  " + "  =C-D";
                Label21.Text = "实发工资:";
                Label23.Text = "反负工资:";
                Label27.Text = "支给合计:";
                Label29.Text = "扣除合计:";
                Label32.Text = "职能给:";
                Label34.Text = "福利:";
                Label35.Text = "精勤:";
                Label36.Text = "基本工资:";
                Label38.Text = "行政补贴:";
                Label39.Text = "技术补贴:";
                Label41.Text = "特殊:";
                Label43.Text = "住宅补助:";
                Label45.Text = "时间外:";
                Label47.Text = "休日:";
                Label49.Text = "祝日:";
                Label51.Text = "奖金:";
                Label53.Text = "季节:";
                Label55.Text = "交替:";
                Label57.Text = "调整:";
                Label59.Text = "其他给:";
                Label60.Text = "欠勤额:";
                Label62.Text = "精勤扣:";
                Label64.Text = "迟早额:";
                Label66.Text = "保险扣:";
                Label68.Text = "公积金:";
                Label70.Text = "所得税:";
                Label72.Text = "会费:";
                Label74.Text = "药费扣:";
                Label76.Text = "其他扣:";
                Label78.Text = "朝礼:"; 

            }
        }
        protected void Link_label_on_duty_Click(object sender, EventArgs e)
        {
            LinkButton send_btn = sender as LinkButton;
            string svalue = send_btn.ID.ToString().Replace("Link_label_", "").Trim();
            if (svalue.Contains("overtime"))
            {//分开好写后续的网页
                Response.Redirect("~/Weixin/salary/Salary_OvertimeInfo.aspx?oldmonth=" + Server.UrlEncode(label_yyyymm.Text.ToString().Trim()) + "&staffid=" + label_staffid.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode(svalue) + "");

            }

            else
            {
                if (label_staffid.Text.Contains("D"))
                {
                    Response.Redirect("~/Weixin/salary/Salary_D_OtherInfo.aspx?oldmonth=" + Server.UrlEncode(label_yyyymm.Text.ToString().Trim()) + "&staffid=" + label_staffid.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode(svalue) + "");

                }
                else
                {
                    Response.Redirect("~/Weixin/salary/Salary_OtherInfo.aspx?oldmonth=" + Server.UrlEncode(label_yyyymm.Text.ToString().Trim()) + "&staffid=" + label_staffid.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode(svalue) + "");

                }

         
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Hidden1.Value.ToString().Trim() == "个人设置")
            {
                Labeltitle.Text = "个人设置";
            }
            else if (Hidden1.Value.ToString().Trim() == "工资信息")
            {
                Labeltitle.Text = dd_yyyymmdd.Value.ToString().Trim() + "月" + Hidden1.Value.ToString().Trim();
            }
            else
            {
                Labeltitle.Text = dd_yyyymmdd.Value.ToString().Trim() + "月工资" + Hidden1.Value.ToString().Trim();


            }
            switch (Hidden1.Value.ToString().Trim())
            {
                case "基本信息":
                    divlabel1.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = true;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divlianluo1.Visible = false;
                    Initgeren();
                    break;
                case "考勤信息":
                    divlabel2.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = true;
                    divjiben.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divlianluo1.Visible = false;
                    Initgongzuo();
                    break;
                case "工资信息":
                    divlabel3.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divlianluo.Visible = true;
                    divnianji.Visible = false;
                    divlianluo1.Visible = false;
                    Initlianluo();
                    break;
                case "个人设置":
                    divlabel4.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = true;
                    divlianluo1.Visible = false;
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
                    divlianluo1.Visible = false;
                    Initgeren();
                    break;
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            ImageButton1_Click(null, null);
        }
        protected void Button2_Click(object sender, ImageClickEventArgs e)
        {
            if (ii.Checked)
            {
                using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                {
                    conn.Open();
                    OracleCommand cmd = conn.CreateCommand();
                    OracleTransaction tran = conn.BeginTransaction();
                    try
                    {
                        string sql = "INSERT INTO STAFF_SALARY_NOPRINT(STAFFID)VALUES('" + newstaffid.Text.ToString().Trim() + "') ";

                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();
                        Label4.Text = "感谢您在环保和经费方面做出的努力";
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        Label4.Text = "";
                        ii.Checked = false;

                    }
                }


            }
            else
            {

                using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                {
                    conn.Open();
                    OracleCommand cmd = conn.CreateCommand();
                    OracleTransaction tran = conn.BeginTransaction();
                    try
                    {
                        string sql = "DELETE FROM STAFF_SALARY_NOPRINT WHERE STAFFID ='" + newstaffid.Text.ToString().Trim() + "' ";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();
                        Label4.Text = "";
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        Label4.Text = "感谢您在环保和经费方面做出的努力";
                        ii.Checked = true;
                    }
                }
            }
        }

        protected void Link_label_Click(object sender, EventArgs e)
        {
            LinkButton send_btn = sender as LinkButton;
            string svalue = send_btn.ID.ToString().Replace("LinkButton_", "").Trim();
            string duanqin = label_STYPE2.Text.Trim(); ;
            if (duanqin == "短期")
            {//
                if (svalue.Contains("ADJUSTMENT_PAY"))
                {//短期工给
                    Response.Redirect("~/Weixin/salary/Salary_D_AdjustmentPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("调整") + "&O=" + label_S_ON_DUTY.Text.ToString().Trim() + "&C=" + label_STYPE2.Text.ToString().Trim() + "&S=" + label_SV_DAY_PAY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("OTHER_OUT"))
                {//短期工扣除
                    Response.Redirect("~/Weixin/salary/Salary_D_OtherOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("其他扣") + "&LATE1=" + label_S_LATE1.Text.ToString().Trim() + "&LATE2=" + label_S_LATE2.Text.ToString().Trim() + "&LATE3=" + label_S_LATE3.Text.ToString().Trim() + "&V_LATE1=" + label_S_V_LATE1.Text.ToString().Trim() + "&V_LATE2=" + label_S_V_LATE2.Text.ToString().Trim() + "&V_DAY_PAY=" + label_SV_DAY_PAY.Text.ToString().Trim() + "&BIG_PUNISHMENT=" + label_S_BIG_PUNISHMENT.Text.ToString().Trim() + "&SMALL_PUNISHMENT=" + label_S_SMALL_PUNISHMENT.Text.ToString().Trim() + "&V_BIG=" + label_S_V_BIG.Text.ToString().Trim() + "&V_SMALL=" + label_S_V_SMALL.Text.ToString().Trim());

                }
                else if (svalue.Contains("MEDICAL_OUT"))
                {//医疗
                    Response.Redirect("~/Weixin/salary/Salary_MedicalOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("药费") + "");

                }
                else if (svalue.Contains("HOUSE_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_D_HousePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("住房补助") + "&H_P=" + label_SV_HOUSE_PAY.Text.ToString().Trim() + "&H_S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "&H_C=" + label_SHOUSE_PAY_COUNT.Text.ToString().Trim() + "&H_PP=" + label_HOUSE_PAY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("TAX_OUT"))
                {
                    Response.Redirect("~/Weixin/salary/Salary_D_TaxOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("个人所得税") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_SEASON_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                }
                else
                {
                    Response.Redirect("~/Weixin/salary/Salary_D_NoShow.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("短期工没有此工资项") + "");

                }
            }
            else
            {
                if (svalue.Contains("OVERTIME1"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_OvertimePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("平日") + "&js=" + label_BASE_PAY_JS.Text + "&overtime=" + label_SOVERTIME1.Text + "&O_P=" + label_OVERTIME1_PAY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("OVERTIME2"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_OvertimePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("休日") + "&js=" + label_BASE_PAY_JS.Text + "&overtime=" + label_SOVERTIME2.Text + "&O_P=" + label_OVERTIME2_PAY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("OVERTIME3"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_OvertimePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("祝日") + "&js=" + label_BASE_PAY_JS.Text + "&overtime=" + label_SOVERTIME3.Text + "&O_P=" + label_OVERTIME3_PAY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("MEDICAL_OUT"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_MedicalOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("药费") + "");

                }
                else if (svalue.Contains("DUE_OUT"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_DueOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("会费") + "");

                }
                else if (svalue.Contains("OTHER_OUT"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_OtherOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("其他扣") + "");

                }
                else if (svalue.Contains("OTHER_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_OtherPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("其他给") + "");

                }
                else if (svalue.Contains("ADJUSTMENT_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_AdjustmentPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("调整") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_STYPE2.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("SB_OUT"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_SbOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("社保") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_STYPE2.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("GJJ_OUT"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_GjjOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("调整") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_STYPE2.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("PERFECT_ATTENDANCE_OUT"))
                {//分开好写后续的网页

                    string yyyymm = label_SYYYYMM.Text.Trim();
                    if (Convert.ToDateTime(yyyymm + "-01") > Convert.ToDateTime("2017-04-01"))
                    {//
                        Response.Redirect("~/Weixin/salary/Salary_PerfectAttendanceOut1705.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("精勤扣") + "&O=" + label_SV_OFF_DUTY.Text.ToString().Trim() + "&C=" + label_PERFECT_ATTENDANCE_OUT.Text.ToString().Trim() + "&S=" + label_SV_PERFECT_ATTENDANCE_PAY_DAY.Text.ToString().Trim() + "&P=" + label_PERFECT_ATTENDANCE_PAY.Text.ToString().Trim() + "");


                    }
                    else
                    {
                        Response.Redirect("~/Weixin/salary/Salary_PerfectAttendanceOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("精勤扣") + "&O=" + label_SV_OFF_DUTY.Text.ToString().Trim() + "&C=" + label_PERFECT_ATTENDANCE_OUT.Text.ToString().Trim() + "&S=" + label_SV_PERFECT_ATTENDANCE_PAY_DAY.Text.ToString().Trim() + "&P=" + label_PERFECT_ATTENDANCE_PAY.Text.ToString().Trim() + "");

                    }
                
                }
                else if (svalue.Contains("HOUSE_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_HousePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("住房补助") + "&H_P=" + label_SV_HOUSE_PAY.Text.ToString().Trim() + "&H_S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "&H_C=" + label_SHOUSE_PAY_COUNT.Text.ToString().Trim() + "&H_PP=" + label_HOUSE_PAY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("CHANGE_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_ChangePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("交替") + "&M=" + label_SMORNING.Text.ToString().Trim() + "&V_M=" + label_SV_MORNING.Text.ToString().Trim() + "&D=" + label_SMIDDLE.Text.ToString().Trim() + "&V_D=" + label_SV_MIDDLE.Text.ToString().Trim() + "&N=" + label_SNIGHT.Text.ToString().Trim() + "&V_N=" + label_SV_NIGHT.Text.ToString().Trim() + "&P=" + label_SPAY43.Text.ToString().Trim() + "&V_P=" + label_SV_PAY43.Text.ToString().Trim() + "&C=" + label_CHANGE_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("OFF_DUTY_OUT"))
                {//分开好写后续的网页
                        string yyyymm = label_SYYYYMM.Text.Trim();
                        if (Convert.ToDateTime(yyyymm + "-01") > Convert.ToDateTime("2017-04-01"))
                        {//
                            Response.Redirect("~/Weixin/salary/Salary_OffDutyOut1705.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("季节费") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_SEASON_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");
                   

                        }
                        else
                        {
                            Response.Redirect("~/Weixin/salary/Salary_OffDutyOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("季节费") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_SEASON_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");
                        }
                }
                else if (svalue.Contains("SEASON_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_SeasonPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("季节费") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_SEASON_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                }
                else if (svalue.Contains("TECH_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_TechPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("技术补贴"));

                }
                else if (svalue.Contains("POST_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_PostPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("行政补贴"));

                }
                else if (svalue.Contains("SPECIAL_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_SpecialPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("特殊补贴"));

                }
                else if (svalue.Contains("PERFECT_ATTENDANCE_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_PerfectAttendancePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("精勤"));

                }
                else if (svalue.Contains("WELFARE_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_WelfarePay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("福利"));

                }
                else if (svalue.Contains("COMPETENCY_PAY"))
                {//分开好写后续的网页
                    Response.Redirect("~/Weixin/salary/Salary_CompetencyPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("职能给"));

                }
                else if (svalue.Contains("TAX_OUT"))
                {//分开好写后续的网页
                    string type1 = label_STYPE1.Text.Trim();
                    string type2 = label_STYPE2.Text.Trim();
                    string yyyymm = label_SYYYYMM.Text.Trim();
                    if (yyyymm.Contains("-12"))
                    {
                        if ((type2 == "合同") || (type2 == "返聘") || (type2 == "残疾") || ((type2 == "实习") && (type1 != "工人")))
                        {
                            Response.Redirect("~/Weixin/salary/Salary_TaxOut12.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("个人所得税") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_SEASON_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                        }
                        else
                        {
                            Response.Redirect("~/Weixin/salary/Salary_TaxOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("个人所得税") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_SEASON_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                        }


                    }
                    else
                    {
                        Response.Redirect("~/Weixin/salary/Salary_TaxOut.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("个人所得税") + "&O=" + label_SV_ON_DUTY.Text.ToString().Trim() + "&C=" + label_SEASON_PAY.Text.ToString().Trim() + "&S=" + label_SV_SUM_DUTY.Text.ToString().Trim() + "");

                    }
                }
                else if (svalue.Contains("BONUS_PAY"))
                {//分开好写后续的网页
                    string type1 = label_STYPE1.Text.Trim();
                    string type2 = label_STYPE2.Text.Trim();
                    string yyyymm = label_SYYYYMM.Text.Trim();
                    if (type2 == "残疾")
                    {//没有奖金

                        Response.Redirect("~/Weixin/salary/Salary_NoBonusPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("绩效奖金") + "");
                    }
                    else if ((type2 == "季节") || (type2 == "派遣") || ((type2 == "实习") && (type1 == "工人")))
                    {//季节 派遣 和工人实习生 单独的计算公式
                        Response.Redirect("~/Weixin/salary/Salary_PBonusPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("绩效奖金") + "");

                    }
                    else
                    {// 合同工分12月份 和其他月份
                        if (yyyymm.Contains("-12"))
                        {
                            string ischanxiu = label_SISCHANXIU.Text;
                            if (ischanxiu == "1")
                            {
                                Response.Redirect("~/Weixin/salary/Salary_HBonusPay12ChanXiu.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("年终奖") + "");

                            }
                            else
                            {

                                Response.Redirect("~/Weixin/salary/Salary_HBonusPay12.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("年终奖") + "");

                            }

                        }
                        else
                        {
                            Response.Redirect("~/Weixin/salary/Salary_HBonusPay.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode("绩效奖金") + "");

                        }
                    }

                }
                else
                {
                    Response.Redirect("~/Weixin/salary/Salary_OtherInfo.aspx?oldmonth=" + Server.UrlEncode(label_SYYYYMM.Text.ToString().Trim()) + "&staffid=" + label_SSTAFFID.Text.ToString().Trim() + "&oldtype=" + Server.UrlEncode(svalue) + "");

                }
            }
        }


    }
}