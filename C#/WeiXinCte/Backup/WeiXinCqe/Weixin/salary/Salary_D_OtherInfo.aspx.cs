using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe.Weixin.salary
{
    public partial class Salary_D_OtherInfo : System.Web.UI.Page
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
            string sql = "";

            switch (label_type.Text)
            {
                case "on_duty":
                    labelti.Text = "出勤明细";
                    this.Title = "出勤明细";
                    label_unit.Text = "天";
                 sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN  FROM STAFF_KQ_DETAIL_BAK  WHERE  YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'   AND  (CLASSWORKMAKER !='R' OR (CLASSWORKMAKER ='R' AND ((OVERTIMELEN+OVERTIMELEN_XL)>0)))  AND (  DUTYMAKER IS NULL   OR DUTYMAKER ='HD' OR DUTYMAKER  ='CQJC' )  ORDER BY  RECORDDATE";
             GridView2.Columns[2].Visible = false;
                    break;
                case "off_duty":
                    labelti.Text = "欠勤明细";
                    this.Title = "欠勤明细";
                    label_unit.Text = "天";
                    GridView2.Columns[2].HeaderText = "欠勤类别";
                    label_MEMO.Text = "旷工，初次小产假、事假、辞职 统计为欠勤，当月入社，入社之前的日期按常白班算欠勤 ";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'   AND  CLASSWORKMAKER  !='R'  AND  DUTYMAKER IN('XCJ1','KG','SHJ','CZ' ) ORDER BY  RECORDDATE";
                    break;
                case "public_leave":
                    labelti.Text = "公假明细";
                    this.Title = "公假明细";
                    label_unit.Text = "天";
                    GridView2.Columns[1].HeaderText = "应出勤状况";
                    GridView2.Columns[2].HeaderText = "公假类别";
                    label_MEMO.Text = " 陪护假、丧假、再次小产假、节育假、婚假、带薪年假 统计为公假";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'   AND  CLASSWORKMAKER  !='R'  AND DUTYMAKER IN('SJ','NJ','PHJ','XCJ2','JYJ','HJ') ORDER BY  RECORDDATE";
                    break;
                case "cj":
                    labelti.Text = "产假明细";
                    this.Title = "产假明细";
                    GridView2.Columns[1].HeaderText = "应出勤状况";
                    GridView2.Columns[2].Visible = false;
                    label_unit.Text = "天";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'   AND CLASSWORKMAKER  !='R'  AND  DUTYMAKER='CJ' ORDER BY  RECORDDATE";
                    break;
                case "back4":
                    labelti.Text = "工伤假明细";
                    this.Title = "工伤假明细";
                    GridView2.Columns[1].HeaderText = "应出勤状况";
                    GridView2.Columns[2].Visible = false;
                    label_unit.Text = "天";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'     AND CLASSWORKMAKER  !='R'  AND  DUTYMAKER='GSJ'   ORDER BY  RECORDDATE";
                    break;
                case "sick_leave":
                    labelti.Text = "病假明细";
                    this.Title = "病假明细";
                    GridView2.Columns[1].HeaderText = "应出勤状况";
                    label_unit.Text = "天";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,SICK_180_FLAG,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'     AND  CLASSWORKMAKER  !='R' AND DUTYMAKER IN('CBJ','BJ')   ORDER BY  RECORDDATE";
                    break;
                case "back1":
                    labelti.Text = "一时归休明细";
                    this.Title = "一时归休明细";
                    GridView2.Columns[1].HeaderText = "应出勤状况";
                    GridView2.Columns[2].Visible = false;
                    label_unit.Text = "天";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='2015-12' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'     AND CLASSWORKMAKER  !='R' AND DUTYMAKER='YG'   ORDER BY  RECORDDATE";
                    break;
                case "house_count":
                    labelti.Text = "住宅补助天数明细";
                    this.Title = "住宅补助天数明细";
                    label_unit.Text = "天";
                    GridView2.Columns[2].HeaderText = "欠勤类别";
                    label_MEMO.Text = " ";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN  FROM STAFF_KQ_DETAIL_BAK  WHERE  YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'   AND  (CLASSWORKMAKER !='R' OR (CLASSWORKMAKER ='R' AND ((OVERTIMELEN+OVERTIMELEN_XL)>0)))  AND (  DUTYMAKER IS NULL   OR DUTYMAKER ='HD' OR DUTYMAKER  ='CQJC' ) AND  COMMUTE_TYPE ='住宅补助' ORDER BY  RECORDDATE";
             break;
                case "late1":
                    labelti.Text = "迟早一明细";
                    this.Title = "迟早一明细";
                    label_unit.Text = "次";
                    GridView2.Columns[2].Visible = false;
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID= '" + label_newstaffid.Text.ToString().Trim() + "'   AND  C1='1'  ORDER BY  RECORDDATE";
                    break;
                case "late2":
                    labelti.Text = "迟早二明细";
                    this.Title = "迟早二明细";
                    label_unit.Text = "次";
                    GridView2.Columns[2].Visible = false;
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID= '" + label_newstaffid.Text.ToString().Trim() + "'   AND  C2='1'  ORDER BY  RECORDDATE";
                    break;
                case "late3":
                    labelti.Text = "迟早三明细";
                    this.Title = "迟早三明细";
                    label_unit.Text = "次";
                    GridView2.Columns[2].Visible = false;
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID= '" + label_newstaffid.Text.ToString().Trim() + "'   AND  C3='1'  ORDER BY  RECORDDATE";
                    break;
                case "pay80":
                    labelti.Text = "4班3倒明细";
                    this.Title = "4班3倒明细";
                    label_unit.Text = "天";
                    GridView2.Columns[2].Visible = false;
                    label_MEMO.Text = "统计正常出勤的4班3倒(不含休日加班) ";
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID= '" + label_newstaffid.Text.ToString().Trim() + "'   AND INSTR(CLASSWORKMAKER,'5')>0 AND  ((DUTYMAKER IS NULL) OR (DUTYMAKER='CQJC' AND C1='0' AND C2='0' AND C3='0') OR (DUTYMAKER='HD' AND C1='0' AND C2='0' AND C3='0'))  ORDER BY  RECORDDATE";
                    break;
                case "morning":
                    labelti.Text = "早班明细";
                    this.Title = "早班明细";
                    label_unit.Text = "天";
                    GridView2.Columns[2].Visible = false;
                    GridView2.Columns[3].Visible = true;
                    label_MEMO.Text = "统计正常出勤、休日加班超过4小时 ";
                    sql = "SELECT TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN   FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID= '" + label_newstaffid.Text.ToString().Trim() + "'  AND (OVERTIMECHANGE ='早班' OR OVERTIMECHANGE_XL ='早班') UNION ALL SELECT TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'  AND INSTR(CLASSWORKMAKER,'Z')>0 AND  ((DUTYMAKER IS NULL) OR (DUTYMAKER='CQJC' AND C1='0' AND C2='0' AND C3='0') OR (DUTYMAKER='HD' AND C1='0' AND C2='0' AND C3='0')) ORDER BY  RECORDDATE";
                    break;
                case "middle":
                    labelti.Text = "中班明细";
                    this.Title = "中班明细";
                    label_unit.Text = "天";
                    GridView2.Columns[2].Visible = false;
                    GridView2.Columns[3].Visible = true;
                    label_MEMO.Text = "统计正常出勤、休日加班超过4小时 ";
                    sql = "SELECT TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN   FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID= '" + label_newstaffid.Text.ToString().Trim() + "'  AND (OVERTIMECHANGE ='中班' OR OVERTIMECHANGE_XL ='中班') UNION ALL SELECT TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'  AND INSTR(CLASSWORKMAKER,'M')>0 AND  ((DUTYMAKER IS NULL) OR (DUTYMAKER='CQJC' AND C1='0' AND C2='0' AND C3='0') OR (DUTYMAKER='HD' AND C1='0' AND C2='0' AND C3='0')) ORDER BY  RECORDDATE";
                    break;
                case "night":
                    labelti.Text = "夜班明细";
                    this.Title = "夜班明细";
                    label_unit.Text = "天";
                    GridView2.Columns[2].Visible = false;
                    GridView2.Columns[3].Visible = true;
                    label_MEMO.Text = "统计正常出勤、休日加班超过4小时 ";
                    sql = "SELECT TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN   FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID= '" + label_newstaffid.Text.ToString().Trim() + "'  AND (OVERTIMECHANGE ='夜班' OR OVERTIMECHANGE_XL ='夜班') UNION ALL SELECT TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN FROM STAFF_KQ_DETAIL_BAK  WHERE YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND  STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'  AND INSTR(CLASSWORKMAKER,'Y')>0 AND  ((DUTYMAKER IS NULL) OR (DUTYMAKER='CQJC' AND C1='0' AND C2='0' AND C3='0') OR (DUTYMAKER='HD' AND C1='0' AND C2='0' AND C3='0')) ORDER BY  RECORDDATE";
                    break;
                case "default":
                    labelti.Text = "出勤明细";
                    this.Title = "出勤明细";
                    label_unit.Text = "天";
                    GridView2.Columns[2].Visible = false;
                    sql = "SELECT   TO_CHAR(RECORDDATE,'YYYY-MM-DD') AS RECORDDATE,STAFFID,STAFFNAME,((CASE CLASSWORKMAKER WHEN N'R' THEN '休息' ELSE '出勤' END)||'('||CLASSWORKTYPE||')') AS CLASSWORKTYPE,DUTYSTATUS,(NVL(OVERTIMELEN,0)+NVL(OVERTIMELEN_XL,0)) AS OVERTIMELEN  FROM STAFF_KQ_DETAIL_BAK  WHERE  YYYYMM ='" + label_month.Text.ToString().Trim() + "' AND STAFFID = '" + label_newstaffid.Text.ToString().Trim() + "'   AND  (CLASSWORKMAKER !='R' OR (CLASSWORKMAKER ='R' AND ((OVERTIMELEN+OVERTIMELEN_XL)>0)))  AND (  DUTYMAKER IS NULL   OR DUTYMAKER ='HD' OR DUTYMAKER  ='CQJC' )  ORDER BY  RECORDDATE";
                    break;
            }

            this.Title = labelti.Text;
            labled.Text = label_month.Text.ToString().Trim() + "月" + labelti.Text;
            try
            {
                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {

                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    labletitle.Visible = false;
                    label_error.Text = "";
                }
                else
                {
                    GridView2.Visible = false;
                    labletitle.Visible = true;
                    label_error.Text = "网络错误，稍后重试";


                }


                if (label_type.Text == "off_duty")
                {
                    int count = getDateInOff();
                    if (count == 0)
                    {
                        label_off_duty.Text = "";

                    }
                    else
                    {
                        label_error.Text = "";
                        label_off_duty.Text = "入社之前按常白班记欠勤" + count.ToString() + "天";
                    }
                }
            }
            catch
            {
                GridView2.Visible = false;
                labletitle.Visible = true;
                label_error.Text = "网络错误，稍后重试";
            }

        }
        private double sum = 0;//
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || //如果设置gridview不显示Header，就不写这个（否则报错）

    e.Row.RowType == DataControlRowType.DataRow ||

    e.Row.RowType == DataControlRowType.Footer)    //如果设置gridview不显示Footer，就不写这个（否则报错）
            {


            }
            if (e.Row.RowIndex >= 0)
            {

                sum++;

            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "合计：" + sum.ToString().Trim() + label_unit.Text;

                e.Row.Cells[0].ColumnSpan = 4;
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
                e.Row.Cells[3].Visible = false;
            }
        }
        private int getDateInOff()
        {
            int count = 0;
            string sql = "SELECT COUNT(*) AS OFFCOUNT FROM BASE_CALENDAR A LEFT JOIN SLR_INTERVAL  B ON A.YYYYMMDD BETWEEN B.BEGIN_DATE AND B.END_DATE WHERE B.YYYYMM='" + label_month.Text.ToString().Trim() + "' AND A.WORKTYPE='1B' AND A.YYYYMMDD<(SELECT DATE_IN FROM V_STAFF_INFO_ALL WHERE ID ='" + label_newstaffid.Text.ToString().Trim() + "')";
            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                count = Convert.ToInt32(dt.Rows[0]["OFFCOUNT"].ToString().Trim());
            }
            return count;

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("考勤信息"));

        }
    }
}