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
                if (Request.Cookies["newstaffid"] == null || Request.Cookies["cqe"] == null)
                {
                    //LogTextHelper.Error("chongxinhuoqu");
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww4119ac66ab8de522&redirect_uri=https://ctewechat.mitsumi.com.cn/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status1#wechat_redirect");
                }
                else
                {
                    if (Request.Cookies["cqe"].Value.ToString().Trim() == "2")
                    {
                        Response.Redirect("~/Weixin/error/NoRight.aspx");
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


                        if (dd_yyyymmdd.Value.ToString().Trim() == "")
                        {
                            dd_yyyymmdd.Value = DateTime.Today.AddMonths(-1).ToString("yyyy-MM");
                        }

                        ImageButton1_Click(null, null);
                    }
                }
                //staffid.Text = "020004";
                //newstaffid.Text = "020004";
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
                //    dd_yyyymmdd.Value = "2021-03";
                //}

                //ImageButton1_Click(null, null);
            }
        }
        private void Initnianjia()
        {
            try
            {
                string sql = " SELECT * FROM cte_hrdb.salary_slip_need WHERE STAFFID ='" + newstaffid.Text.ToString().Trim() + "'";

                DataTable dt = MySqlService.GetTb(sql);

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
            string sql = "SELECT YearM,  DeptName, BranchName,staffID, StaffName,Level, Rank, JobTitle,stafftype, BankCard FROM cte_hrdb.salary_info_months   WHERE YearM='" + dd_yyyymmdd.Value.ToString().Trim() + "' AND staffID ='" + newstaffid.Text.ToString().Trim() + "'";


            DataTable dt = MySqlService.GetTb(sql);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lbl_staffid.Text = dr["staffID"].ToString().Trim();
                lbl_name.Text = dr["StaffName"].ToString().Trim();
                lbl_level.Text = dr["Level"].ToString().Trim();
                lbl_ge.Text = dr["Rank"].ToString().Trim();
                lbl_Post.Text = dr["JobTitle"].ToString().Trim();
                lbl_stafftype.Text = dr["stafftype"].ToString().Trim();
                lbl_bankcode.Text = dr["BankCard"].ToString().Trim();
                lbl_dept.Text = dr["DeptName"].ToString().Trim();
                lbl_BranchName.Text = dr["BranchName"].ToString().Trim();

                lbl_staffid.ForeColor = System.Drawing.Color.Black;
            }
            else
            {

                lbl_staffid.Text = "检索不到您(" + newstaffid.Text.ToString().Trim() + ")的" + dd_yyyymmdd.Value + "月工资基本数据";
                lbl_staffid.ForeColor = System.Drawing.Color.Red;

                lbl_name.Text = "";
                lbl_level.Text = "";
                lbl_ge.Text = "";
                lbl_Post.Text = "";
                lbl_stafftype.Text = "";
                lbl_bankcode.Text = "";
                lbl_dept.Text = "";
                lbl_BranchName.Text = "";


            }

        }
        private void Initgongzuo()
        {

            string sql = "SELECT  YearM, stafftype,  staffID, K_Attendance, K_Paidleave, K_SickLeave, K_Lackattendance, K_StayawayWork, K_Mfleave, K_Injury, K_MatemityLeave, K_Publicrelease, K_Externalconsultation, K_Late, K_Nightwork, K_Missmeal, K_Otearlyatt, K_Dayoffatt, K_Holidayatt, K_EduHour, K_HjStation, K_NgStation, K_Hjeducation, K_RewardandPenalty, K_PerAss, P_Attendance, " +
                "P_Paidleave, P_Lackattendance, P_SickLeave, P_MatemityLeave, P_Mfleave, P_Injury, P_Publicrelease, P_StayawayWork, P_Late, P_Bonus " +
                "FROM cte_hrdb.salary_info_months   WHERE YearM='" + dd_yyyymmdd.Value.ToString().Trim() + "'  AND staffID ='" + newstaffid.Text.ToString().Trim() + "' ";


            try
            {

                DataTable dt = MySqlService.GetTb(sql);

                if (dt.Rows.Count > 0)
                {
                    divdd.Visible = false;

                    lbl_K_Attendance.Visible = true;
                    lbl_K_Paidleave.Visible = true;
                    lbl_K_SickLeave.Visible = true;
                    lbl_K_Lackattendance.Visible = true;
                    lbl_K_StayawayWork.Visible = true;
                    lbl_K_Mfleave.Visible = true;
                    lbl_K_Injury.Visible = true;
                    lbl_K_MatemityLeave.Visible = true;
                    lbl_K_Publicrelease.Visible = true;
                    lbl_K_Externalconsultation.Visible = true;
                    lbl_K_Late.Visible = true;
                    lbl_K_Nightwork.Visible = true;
                    lbl_K_Missmeal.Visible = true;
                    lbl_K_Otearlyatt.Visible = true;
                    lbl_K_Dayoffatt.Visible = true;
                    lbl_K_Holidayatt.Visible = true;
                    lbl_K_EduHour.Visible = true;
                    lbl_K_HjStation.Visible = true;
                    lbl_K_NgStation.Visible = true;
                    lbl_K_Hjeducation.Visible = true;
                    lbl_K_RewardandPenalty.Visible = true;
                    lbl_K_PerAss.Visible = true;
                    lbl_P_Attendance.Visible = true;
                    lbl_P_Paidleave.Visible = true;
                    lbl_P_Lackattendance.Visible = true;
                    lbl_P_SickLeave.Visible = true;
                    lbl_P_MatemityLeave.Visible = true;
                    lbl_P_Mfleave.Visible = true;
                    lbl_P_Injury.Visible = true;
                    lbl_P_Publicrelease.Visible = true;
                    lbl_P_StayawayWork.Visible = true;
                    lbl_P_Late.Visible = true;
                    lbl_P_Bonus.Visible = true;

                    label_error.Text = "";
                    DataRow dr = dt.Rows[0];
                    label_yyyymm.Text = dr["YearM"].ToString().Trim();
                    label_staffid.Text = dr["staffID"].ToString().Trim();
                    lbl_K_Attendance.Text = dr["K_Attendance"].ToString().Trim() + "天";
                    lbl_K_Paidleave.Text = dr["K_Paidleave"].ToString().Trim() + "天";
                    lbl_K_SickLeave.Text = dr["K_SickLeave"].ToString().Trim() + "天";
                    lbl_K_Lackattendance.Text = dr["K_Lackattendance"].ToString().Trim() + "天";
                    lbl_K_StayawayWork.Text = dr["K_StayawayWork"].ToString().Trim() + "天";
                    lbl_K_Mfleave.Text = dr["K_Mfleave"].ToString().Trim() + "天";
                    lbl_K_Injury.Text = dr["K_Injury"].ToString().Trim() + "天";
                    lbl_K_MatemityLeave.Text = dr["K_MatemityLeave"].ToString().Trim() + "天";
                    lbl_K_Publicrelease.Text = dr["K_Publicrelease"].ToString().Trim() + "天";
                    lbl_K_Externalconsultation.Text = dr["K_Externalconsultation"].ToString().Trim() + "次";
                    lbl_K_Late.Text = dr["K_Late"].ToString().Trim() + "次";
                    lbl_K_Nightwork.Text = dr["K_Nightwork"].ToString().Trim() + "次";
                    lbl_K_Missmeal.Text = dr["K_Missmeal"].ToString().Trim() + "次"; ;
                    lbl_K_Otearlyatt.Text = dr["K_Otearlyatt"].ToString().Trim() + "H";
                    lbl_K_Dayoffatt.Text = dr["K_Dayoffatt"].ToString().Trim() + "H";
                    lbl_K_Holidayatt.Text = dr["K_Holidayatt"].ToString().Trim() + "H";
                    lbl_K_EduHour.Text = dr["K_EduHour"].ToString().Trim() + "H";
                    lbl_K_HjStation.Text = dr["K_HjStation"].ToString().Trim();
                    lbl_K_NgStation.Text = dr["K_NgStation"].ToString().Trim();
                    lbl_K_Hjeducation.Text = dr["K_Hjeducation"].ToString().Trim();
                    lbl_K_RewardandPenalty.Text = dr["K_RewardandPenalty"].ToString().Trim();
                    lbl_K_PerAss.Text = dr["K_PerAss"].ToString().Trim();
                    lbl_P_Attendance.Text = dr["P_Attendance"].ToString().Trim() + "天";
                    lbl_P_Paidleave.Text = dr["P_Paidleave"].ToString().Trim() + "天";
                    lbl_P_Lackattendance.Text = dr["P_Lackattendance"].ToString().Trim() + "天";
                    lbl_P_SickLeave.Text = dr["P_SickLeave"].ToString().Trim() + "天";
                    lbl_P_MatemityLeave.Text = dr["P_MatemityLeave"].ToString().Trim() + "天";
                    lbl_P_Mfleave.Text = dr["P_Mfleave"].ToString().Trim() + "天";
                    lbl_P_Injury.Text = dr["P_Injury"].ToString().Trim() + "天";
                    lbl_P_Publicrelease.Text = dr["P_Publicrelease"].ToString().Trim() + "天";
                    lbl_P_StayawayWork.Text = dr["P_StayawayWork"].ToString().Trim() + "天";
                    lbl_P_Late.Text = dr["P_Late"].ToString().Trim() + "次";
                    lbl_P_Bonus.Text = dr["P_Bonus"].ToString().Trim();

                    months_div.Visible = false;
                    string stafftype = dr["stafftype"].ToString().Trim();
                    if (stafftype == "正式员工" || stafftype == "农籍合同工" || stafftype == "市内派遣" || stafftype == "公司临时工")
                    {
                        if (label_yyyymm.Text.Substring(5, 2) == "07" || label_yyyymm.Text.Substring(5, 2) == "01")
                        {
                            months_div.Visible = true;
                        }
                        else
                        {
                            months_div.Visible = false;

                        }
                    }
                    if (stafftype == "农民工")
                    {
                        if (label_yyyymm.Text.Substring(5, 2) == "02" || label_yyyymm.Text.Substring(5, 2) == "08")
                        {
                            months_div.Visible = true;
                        }
                        else
                        {
                            months_div.Visible = false;

                        }
                    }


                }
                else
                {
                    lbl_K_Attendance.Visible = false;
                    lbl_K_Paidleave.Visible = false;
                    lbl_K_SickLeave.Visible = false;
                    lbl_K_Lackattendance.Visible = false;
                    lbl_K_StayawayWork.Visible = false;
                    lbl_K_Mfleave.Visible = false;
                    lbl_K_Injury.Visible = false;
                    lbl_K_MatemityLeave.Visible = false;
                    lbl_K_Publicrelease.Visible = false;
                    lbl_K_Externalconsultation.Visible = false;
                    lbl_K_Late.Visible = false;
                    lbl_K_Nightwork.Visible = false;
                    lbl_K_Missmeal.Visible = false;
                    lbl_K_Otearlyatt.Visible = false;
                    lbl_K_Dayoffatt.Visible = false;
                    lbl_K_Holidayatt.Visible = false;
                    lbl_K_EduHour.Visible = false;
                    lbl_K_HjStation.Visible = false;
                    lbl_K_NgStation.Visible = false;
                    lbl_K_Hjeducation.Visible = false;
                    lbl_K_RewardandPenalty.Visible = false;
                    lbl_K_PerAss.Visible = false;
                    lbl_P_Attendance.Visible = false;
                    lbl_P_Paidleave.Visible = false;
                    lbl_P_Lackattendance.Visible = false;
                    lbl_P_SickLeave.Visible = false;
                    lbl_P_MatemityLeave.Visible = false;
                    lbl_P_Mfleave.Visible = false;
                    lbl_P_Injury.Visible = false;
                    lbl_P_Publicrelease.Visible = false;
                    lbl_P_StayawayWork.Visible = false;
                    lbl_P_Late.Visible = false;
                    lbl_P_Bonus.Visible = false;
                    label_error.Text = "检索不到您(" + newstaffid.Text.ToString().Trim() + ")的" + dd_yyyymmdd.Value + "月工资考勤数据";
                    divdd.Visible = true;
                }



            }
            catch
            {
                lbl_K_Attendance.Visible = false;
                lbl_K_Paidleave.Visible = false;
                lbl_K_SickLeave.Visible = false;
                lbl_K_Lackattendance.Visible = false;
                lbl_K_StayawayWork.Visible = false;
                lbl_K_Mfleave.Visible = false;
                lbl_K_Injury.Visible = false;
                lbl_K_MatemityLeave.Visible = false;
                lbl_K_Publicrelease.Visible = false;
                lbl_K_Externalconsultation.Visible = false;
                lbl_K_Late.Visible = false;
                lbl_K_Nightwork.Visible = false;
                lbl_K_Missmeal.Visible = false;
                lbl_K_Otearlyatt.Visible = false;
                lbl_K_Dayoffatt.Visible = false;
                lbl_K_Holidayatt.Visible = false;
                lbl_K_EduHour.Visible = false;
                lbl_K_HjStation.Visible = false;
                lbl_K_NgStation.Visible = false;
                lbl_K_Hjeducation.Visible = false;
                lbl_K_RewardandPenalty.Visible = false;
                lbl_K_PerAss.Visible = false;
                lbl_P_Attendance.Visible = false;
                lbl_P_Paidleave.Visible = false;
                lbl_P_Lackattendance.Visible = false;
                lbl_P_SickLeave.Visible = false;
                lbl_P_MatemityLeave.Visible = false;
                lbl_P_Mfleave.Visible = false;
                lbl_P_Injury.Visible = false;
                lbl_P_Publicrelease.Visible = false;
                lbl_P_StayawayWork.Visible = false;
                lbl_P_Late.Visible = false;
                lbl_P_Bonus.Visible = false;
                label_error.Text = "网络错误，稍后重试";
                divdd.Visible = true;
            }
        }
        private void Initlianluo()
        {
            string sql = "SELECT  YearM, stafftype,  staffID,JZSalary, ZNsalary, PDSalary, YZallowance, ZGallowance, Sjallowance, Qqallowance, Jtallowance, " +
                "Qlallowance, Otsalary, Hjallowance, Yqallowance, Yyallowance, Qnallowance, Cjallowance, Fsallowance, Zqallowance, Gwallowance, Glallowance, " +
                "Bonusvarchar, Correct, deduct, TakehomePay, Ylinsurance, Syinsurance, Medicalinsurance, Medicalassinsurance, fund, indivtax, Uniondues, Cutpayment, pay,Ylinsurance+Syinsurance+Medicalinsurance+Medicalassinsurance+fund+indivtax+Uniondues+Cutpayment sumout  " +
                 "FROM cte_hrdb.salary_info_months   WHERE YearM='" + dd_yyyymmdd.Value.ToString().Trim() + "'  AND staffID ='" + newstaffid.Text.ToString().Trim() + "' ";


            try
            {

                DataTable dt = MySqlService.GetTb(sql);

                if (dt.Rows.Count > 0)
                {
                    divddd.Visible = false;
                    label_errs.Text = "";

                    lbl_JZSalary.Visible = true;
                    lbl_ZNsalary.Visible = true;
                    lbl_PDSalary.Visible = true;
                    lbl_YZallowance.Visible = true;
                    lbl_ZGallowance.Visible = true;
                    lbl_Sjallowance.Visible = true;
                    lbl_Qqallowance.Visible = true;
                    lbl_Jtallowance.Visible = true;
                    lbl_Qlallowance.Visible = true;
                    lbl_Otsalary.Visible = true;
                    lbl_Hjallowance.Visible = true;
                    lbl_Yqallowance.Visible = true;
                    lbl_Yyallowance.Visible = true;
                    lbl_Qnallowance.Visible = true;
                    lbl_Cjallowance.Visible = true;
                    lbl_Fsallowance.Visible = true;
                    lbl_Zqallowance.Visible = true;
                    lbl_Gwallowance.Visible = true;
                    lbl_Glallowance.Visible = true;
                    lbl_Bonusvarchar.Visible = true;
                    lbl_Correct.Visible = true;
                    lbl_deduct.Visible = true;
                    lbl_TakehomePay.Visible = true;
                    lbl_Ylinsurance.Visible = true;
                    lbl_Syinsurance.Visible = true;
                    lbl_Medicalinsurance.Visible = true;
                    lbl_Medicalassinsurance.Visible = true;
                    lbl_fund.Visible = true;
                    lbl_indivtax.Visible = true;
                    lbl_Uniondues.Visible = true;
                    lbl_Cutpayment.Visible = true;
                    lbl_pay.Visible = true;
                    lbl_sumout.Visible = true;


                    DataRow dr = dt.Rows[0];
                    lbl_JZSalary.Text = dr["JZSalary"].ToString().Trim();
                    lbl_ZNsalary.Text = dr["ZNsalary"].ToString().Trim();
                    lbl_PDSalary.Text = dr["PDSalary"].ToString().Trim();
                    lbl_YZallowance.Text = dr["YZallowance"].ToString().Trim();
                    lbl_ZGallowance.Text = dr["ZGallowance"].ToString().Trim();
                    lbl_Sjallowance.Text = dr["Sjallowance"].ToString().Trim();
                    lbl_Qqallowance.Text = dr["Qqallowance"].ToString().Trim();
                    lbl_Jtallowance.Text = dr["Jtallowance"].ToString().Trim();
                    lbl_Qlallowance.Text = dr["Qlallowance"].ToString().Trim();
                    lbl_Otsalary.Text = dr["Otsalary"].ToString().Trim();
                    lbl_Hjallowance.Text = dr["Hjallowance"].ToString().Trim();
                    lbl_Yqallowance.Text = dr["Yqallowance"].ToString().Trim();
                    lbl_Yyallowance.Text = dr["Yyallowance"].ToString().Trim();
                    lbl_Qnallowance.Text = dr["Qnallowance"].ToString().Trim();
                    lbl_Cjallowance.Text = dr["Cjallowance"].ToString().Trim();
                    lbl_Fsallowance.Text = dr["Fsallowance"].ToString().Trim();
                    lbl_Zqallowance.Text = dr["Zqallowance"].ToString().Trim();
                    lbl_Gwallowance.Text = dr["Gwallowance"].ToString().Trim();
                    lbl_Glallowance.Text = dr["Glallowance"].ToString().Trim();
                    lbl_Bonusvarchar.Text = dr["Bonusvarchar"].ToString().Trim();
                    lbl_Correct.Text = dr["Correct"].ToString().Trim();
                    lbl_deduct.Text = dr["deduct"].ToString().Trim();
                    lbl_TakehomePay.Text = dr["TakehomePay"].ToString().Trim();
                    lbl_Ylinsurance.Text = dr["Ylinsurance"].ToString().Trim();
                    lbl_Syinsurance.Text = dr["Syinsurance"].ToString().Trim();
                    lbl_Medicalinsurance.Text = dr["Medicalinsurance"].ToString().Trim();
                    lbl_Medicalassinsurance.Text = dr["Medicalassinsurance"].ToString().Trim();
                    lbl_fund.Text = dr["fund"].ToString().Trim();
                    lbl_indivtax.Text = dr["indivtax"].ToString().Trim();
                    lbl_Uniondues.Text = dr["Uniondues"].ToString().Trim();
                    lbl_Cutpayment.Text = dr["Cutpayment"].ToString().Trim();
                    lbl_pay.Text = dr["pay"].ToString().Trim();
                    lbl_sumout.Text = dr["sumout"].ToString().Trim();


                }
                else
                {
                    divddd.Visible = true;
                    label_errs.Text = "检索不到您(" + newstaffid.Text.ToString().Trim() + ")的" + dd_yyyymmdd.Value + "月工资数据";

                    lbl_JZSalary.Visible = false;
                    lbl_ZNsalary.Visible = false;
                    lbl_PDSalary.Visible = false;
                    lbl_YZallowance.Visible = false;
                    lbl_ZGallowance.Visible = false;
                    lbl_Sjallowance.Visible = false;
                    lbl_Qqallowance.Visible = false;
                    lbl_Jtallowance.Visible = false;
                    lbl_Qlallowance.Visible = false;
                    lbl_Otsalary.Visible = false;
                    lbl_Hjallowance.Visible = false;
                    lbl_Yqallowance.Visible = false;
                    lbl_Yyallowance.Visible = false;
                    lbl_Qnallowance.Visible = false;
                    lbl_Cjallowance.Visible = false;
                    lbl_Fsallowance.Visible = false;
                    lbl_Zqallowance.Visible = false;
                    lbl_Gwallowance.Visible = false;
                    lbl_Glallowance.Visible = false;
                    lbl_Bonusvarchar.Visible = false;
                    lbl_Correct.Visible = false;
                    lbl_deduct.Visible = false;
                    lbl_TakehomePay.Visible = false;
                    lbl_Ylinsurance.Visible = false;
                    lbl_Syinsurance.Visible = false;
                    lbl_Medicalinsurance.Visible = false;
                    lbl_Medicalassinsurance.Visible = false;
                    lbl_fund.Visible = false;
                    lbl_indivtax.Visible = false;
                    lbl_Uniondues.Visible = false;
                    lbl_Cutpayment.Visible = false;
                    lbl_pay.Visible = false;
                    lbl_sumout.Visible = false;


                }
            }
            catch
            {
                divddd.Visible = true;
                label_errs.Text = "网络错误，稍后重试";

                lbl_JZSalary.Visible = false;
                lbl_ZNsalary.Visible = false;
                lbl_PDSalary.Visible = false;
                lbl_YZallowance.Visible = false;
                lbl_ZGallowance.Visible = false;
                lbl_Sjallowance.Visible = false;
                lbl_Qqallowance.Visible = false;
                lbl_Jtallowance.Visible = false;
                lbl_Qlallowance.Visible = false;
                lbl_Otsalary.Visible = false;
                lbl_Hjallowance.Visible = false;
                lbl_Yqallowance.Visible = false;
                lbl_Yyallowance.Visible = false;
                lbl_Qnallowance.Visible = false;
                lbl_Cjallowance.Visible = false;
                lbl_Fsallowance.Visible = false;
                lbl_Zqallowance.Visible = false;
                lbl_Gwallowance.Visible = false;
                lbl_Glallowance.Visible = false;
                lbl_Bonusvarchar.Visible = false;
                lbl_Correct.Visible = false;
                lbl_deduct.Visible = false;
                lbl_TakehomePay.Visible = false;
                lbl_Ylinsurance.Visible = false;
                lbl_Syinsurance.Visible = false;
                lbl_Medicalinsurance.Visible = false;
                lbl_Medicalassinsurance.Visible = false;
                lbl_fund.Visible = false;
                lbl_indivtax.Visible = false;
                lbl_Uniondues.Visible = false;
                lbl_Cutpayment.Visible = false;
                lbl_pay.Visible = false;
                lbl_sumout.Visible = false;


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

        protected void Button4_Click(object sender, EventArgs e)
        {

            ImageButton1_Click(null, null);
        }
        protected void Button2_Click(object sender, ImageClickEventArgs e)
        {
            if (ii.Checked)
            {
                string sql = "INSERT INTO cte_hrdb.salary_slip_need (staffid) VALUES('" + newstaffid.Text.ToString().Trim() + "') ";
                MySqlService.ExecuteSql(sql);

                Label4.Text = "感谢您在环保和经费方面做出的努力";
            }
            else
            {
                string sql = "DELETE FROM cte_hrdb.salary_slip_need WHERE staffid ='" + newstaffid.Text.ToString().Trim() + "' ";
                MySqlService.ExecuteSql(sql);
                Label4.Text = "";
            }
        }


       


    }
}