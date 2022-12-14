using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

namespace WeiXinCqe
{
    public partial class MyNewBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request.Cookies["newstaffid"] == null)
                //{
                //    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status2#wechat_redirect");
                //}
                //else
                //{
                //    staffid.Text = Request.Cookies["staffid"].Value.ToString().Trim();
                //    newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                //    staffname.Text = Server.UrlDecode(Request.Cookies["staffname"].Value.ToString().Trim());
                //    TextBox1.Text = DateTime.Today.ToString("yyyy-MM-dd"); 
                //    nowstaffid.Text = newstaffid.Text;//本来想判断来着
                //    set(nowstaffid.Text, TextBox1.Text);
                //}
                staffid.Text = "092156";
                newstaffid.Text = "092156";
                staffname.Text = "宋峥强";
                TextBox1.Text = DateTime.Today.ToString("yyyy-MM-dd");
                nowstaffid.Text = newstaffid.Text;//本来想判断来着
                set(nowstaffid.Text, TextBox1.Text);
            }
        }
        private void setNew()
        {
            wucan_d.Checked = false;
            wancan_d.Checked = false;
            zaocan_d.Checked = false;
            wancan_x.Checked = false;
            zaocan_x.Checked = false;
            wucan_d.Disabled = false;
            wancan_d.Disabled = false;
            zaocan_d.Disabled = false;
            wancan_x.Disabled = false;
            zaocan_x.Disabled = false;
            label_WanCan_Error.Text = "";
            label_WuCan_Error.Text = "";
            label_ZaoCan_Error.Text = "";
            label_memo.Text = "";
            chaoqi.Text = "0";
            Button1.Visible = true;
        }

        private void setfalse()
        {
            if (chaoqi.Text == "1")
            {
                label_memo.Text = "不可预约15天以后的就餐";

                label_WanCan_Error.Text = "";
                label_WuCan_Error.Text = "";
                label_ZaoCan_Error.Text = "";
                wucan_d.Disabled = true;
                wancan_d.Disabled = true;
                zaocan_d.Disabled = true;
                wancan_x.Disabled = true;
                zaocan_x.Disabled = true;
            }
            else
            {
                if (timeoff_type.Text.ToString().Trim().Contains("辞职") || timeoff_type.Text.ToString().Trim().Contains("带薪休假") || timeoff_type.Text.ToString().Trim().Contains("长病假") || timeoff_type.Text.ToString().Trim().Contains("丧假") || timeoff_type.Text.ToString().Trim().Contains("事假") || timeoff_type.Text.ToString().Trim().Contains("病假") || timeoff_type.Text.ToString().Trim().Contains("旷工") || timeoff_type.Text.ToString().Trim().Contains("一时归休") || timeoff_type.Text.ToString().Trim().Contains("工伤假") || timeoff_type.Text.ToString().Trim().Contains("初次小产假") || timeoff_type.Text.ToString().Trim().Contains("再次小产假") || timeoff_type.Text.ToString().Trim().Contains("产假") || timeoff_type.Text.ToString().Trim().Contains("陪护假") || timeoff_type.Text.ToString().Trim().Contains("节育假") || timeoff_type.Text.ToString().Trim().Contains("产前假") || timeoff_type.Text.ToString().Trim().Contains("出差") || timeoff_type.Text.ToString().Trim().Contains("研修") || timeoff_type.Text.ToString().Trim().Contains("振替休假") || timeoff_type.Text.ToString().Trim().Contains("婚假"))
                {
                    label_memo.Text = " 全天不在,不应有工作餐,如果已经预约，请在我的预约中删除";

                    label_WanCan_Error.Text = "";
                    label_WuCan_Error.Text = "";
                    label_ZaoCan_Error.Text = "";
                    wucan_d.Disabled = true;
                    wancan_d.Disabled = true;
                    zaocan_d.Disabled = true;
                    wancan_x.Disabled = true;
                    zaocan_x.Disabled = true;
                }
                else
                {
                    if (classworkmaker.Text == "休息")
                    {
                        if ((overtime_plan.Text == "0") && (!timeoff_type.Text.ToString().Trim().Contains("振替出勤")))
                        {
                            label_memo.Text = " 休日没有加班计划,不应有工作餐，如果已经预约，请在我的预约中删除";

                            label_WanCan_Error.Text = "";
                            label_WuCan_Error.Text = "";
                            label_ZaoCan_Error.Text = "";
                            wucan_d.Disabled = true;
                            wancan_d.Disabled = true;
                            zaocan_d.Disabled = true;
                            wancan_x.Disabled = true;
                            zaocan_x.Disabled = true;
                        }
                    }
                }
            }
            
            Button1.Visible=!(zaocan_d.Disabled&&wucan_d.Disabled&&wancan_d.Disabled);
        }
        private void set(string staffid, string yyyymmdd)
        {
            yyyymmdd_t.Text = yyyymmdd;
            setNew();
            string sql = "SELECT B.OUT_REASON,A.YYYYMM,A.CLASSWORKTYPE,(CASE WHEN A.CLASSWORKMAKER='R'  OR  A.CLASSWORKMAKER IS NULL THEN '休息' ELSE '出勤' END ) AS  CLASSWORKMAKER,TO_CHAR( A.LILUN_IN_DATE,'YYYY-MM-DD HH24:MI') AS LILUN_IN_DATE,TO_CHAR((A.LILUN_OUT_DATE+OVERTIME_PLAN/24),'YYYY-MM-DD HH24:MI') AS LILUN_OUT_DATE,A.OVERTIME_PLAN,A.TIMEOFF_TYPE,TO_CHAR(SYSDATE,'YYYY-MM-DD') AS SDAY,TO_CHAR(SYSDATE,'HH24:MI:SS') AS STIME,C.MORNING,C.MIDDLE,C.EVENING,C.NIGHT,D.WORK_DATE,B.DATE_OUT,TO_NUMBER(TO_CHAR(TO_DATE('" + yyyymmdd + "','YYYY-MM-DD'),'D'))  AS DAYNUMBER,E.LOCKTIME FROM V_EVERYDAY_STAFF_CHECK_OFF  A LEFT JOIN BASE_STAFF B ON A.STAFFID =B.ID  LEFT JOIN CS_DINNER_LIMIT C  ON 1=1  LEFT JOIN  STAFF_TIMEOFF D ON A.STAFFID=D.STAFFID  AND TO_CHAR(A.YYYYMMDD,'YYYY-MM-DD') =  TO_CHAR(D.WORK_DATE,'YYYY-MM-DD')  AND D.STATUS >='0' AND D.TIMEOFF_TYPE='振替休假' LEFT JOIN V_NEW_RDINNER_LOCKTIME E ON TO_DATE(E.YYYYMMDD,'YYYY-MM-DD')= TO_DATE('" + yyyymmdd + "','YYYY-MM-DD') WHERE A.STAFFID ='" + staffid + "' AND TO_CHAR(A.YYYYMMDD,'YYYY-MM-DD')='" + yyyymmdd + "'";

             DataTable dt = OracleOperateHelp.getDataTable(sql);
             if (dt.Rows.Count > 0)
             {
                 DataRow dr = dt.Rows[0];

                 classworktype.Text = dr["CLASSWORKTYPE"].ToString().Trim();
                 classworkmaker.Text = dr["CLASSWORKMAKER"].ToString().Trim();
                 overtime_plan.Text = dr["OVERTIME_PLAN"].ToString().Trim();
                 timeoff_type.Text = dr["TIMEOFF_TYPE"].ToString().Trim();
                 string date_out = dr["DATE_OUT"].ToString().Trim();
                 string zhenti = dr["WORK_DATE"].ToString().Trim();
                 classworkmaker_B.Text = dr["DAYNUMBER"].ToString().Trim();
                 string reason = dr["OUT_REASON"].ToString().Trim();
                 if (dr["LOCKTIME"].ToString().Trim() == "")
                 {
                     classworkmaker_B_S.Text = yyyymmdd;
                 }
                 else
                 {
                     classworkmaker_B_S.Text = Convert.ToDateTime(dr["LOCKTIME"].ToString().Trim()).ToString("yyyy-MM-dd");
                 }
                 if (date_out != "")
                 {
                     if (Convert.ToDateTime(date_out) <= Convert.ToDateTime(yyyymmdd))
                     {
                         if (reason == "派遣转合同")
                         {//派遣转合同不限制
                             //if (Convert.ToDateTime(date_out) < Convert.ToDateTime(yyyymmdd))
                             //{
                             //    if (timeoff_type.Text != "")
                             //    {
                             //        timeoff_type.Text = timeoff_type.Text + ";辞职";
                             //    }
                             //    else
                             //    {
                             //        timeoff_type.Text = "辞职";
                             //    }
                             //}

                         }
                         else
                         {
                             if (timeoff_type.Text != "")
                             {
                                 timeoff_type.Text = timeoff_type.Text + ";辞职";
                             }
                             else
                             {
                                 timeoff_type.Text = "辞职";
                             }
                         }

                     }
                 }
                 if (zhenti != "")
                 {
                     if (timeoff_type.Text != "")
                     {
                         timeoff_type.Text = timeoff_type.Text + ";振替出勤";
                     }
                     else
                     {
                         timeoff_type.Text = "振替出勤";
                     }

                 }
                 if (classworktype.Text.ToString().Trim() == "夜班")
                 {
                     label_zao.Text = "晚餐";
                     label_wu.Text = "夜餐";
                     label_wan.Text = "早餐";
                     wandai.Visible = false;
                     zaodai.Visible = true;
                 }
                 else
                 {
                     label_zao.Text = "早餐";
                     label_wu.Text = "午餐";
                     label_wan.Text = "晚餐";
                     wandai.Visible = true;
                     zaodai.Visible = false;
                 }



                 string sday = dr["SDAY"].ToString().Trim();
                 string stime = dr["STIME"].ToString().Trim();

                 if (Convert.ToDateTime(yyyymmdd) > Convert.ToDateTime(sday).AddDays(15))
                 {//
                     chaoqi.Text = "1";
                 }
                 if (classworktype.Text.ToString().Trim() == "夜班")
                 {

                     if (Convert.ToDateTime(sday + " " + stime) > Convert.ToDateTime(classworkmaker_B_S.Text.ToString().Trim() + " " + "2:00").AddDays(1))
                     {//预约时,为长白班上一个工作日+1天的2点
                         wancan_d.Disabled = true;
                         wancan_x.Disabled = true;
                         label_WanCan_Error.Text = "超时,不可预约/删除";

                         wucan_d.Disabled = true;
                         label_WuCan_Error.Text = "超时,不可预约/删除";

                         zaocan_d.Disabled = true;
                         zaocan_x.Disabled = true;
                         label_ZaoCan_Error.Text = "超时,不可预约/删除";
                     }



                 }
                 else
                 {

                     if (Convert.ToDateTime(sday + " " + stime) > Convert.ToDateTime(classworkmaker_B_S.Text.ToString().Trim() + " " + "14:00"))
                     {//预约时,为长白班上一个工作日下午2点
                         wancan_d.Disabled = true;
                         wancan_x.Disabled = true;
                         label_WanCan_Error.Text = "超时,不可预约/删除";

                         wucan_d.Disabled = true;
                         label_WuCan_Error.Text = "超时,不可预约/删除";

                         zaocan_d.Disabled = true;
                         zaocan_x.Disabled = true;
                         label_ZaoCan_Error.Text = "超时,不可预约/删除";
                     }
                     // }

                 }


             }
             else
             {//未取得数据
                 label_memo.Text = "您当天的数据没有取得";
                 classworktype.Text ="未取到";
                 classworkmaker.Text = "未取到";
                 overtime_plan.Text ="0";
                 timeoff_type.Text = "未取到";
                 label_WanCan_Error.Text = "";
                 label_WuCan_Error.Text = "";
                 label_ZaoCan_Error.Text = "";
                 wucan_d.Disabled = true;
                 wancan_d.Disabled = true;
                 zaocan_d.Disabled = true;
                 wancan_x.Disabled = true;
                 zaocan_x.Disabled = true;
             }


            initdinner(staffid,yyyymmdd);
            setfalse();
        }
        private void initdinner(string staffid,string yyyymmdd)
        {
            DataTable dt = OracleOperateHelp.getDataTable("  SELECT STAFFID,DINNER_TYPE,DINNER_SMALL_TYPE,FLAG,ISLOCK FROM CS_STAFF_DINNER_NEW_NEW  WHERE FLAG IN ('0','1') AND STAFFID ='" + staffid + "'  AND WORK_DAY=TO_DATE('" + yyyymmdd+ "','YYYY-MM-DD')");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string dinner_type = dr["DINNER_TYPE"].ToString().Trim();
                    string dinner_small_type = dr["DINNER_SMALL_TYPE"].ToString().Trim();
                    string flag = dr["FLAG"].ToString().Trim();
                    string islock = dr["ISLOCK"].ToString().Trim();
                    if (dinner_type == "1")
                    {
                        if (label_zao.Text.ToString().Trim() == "晚餐")
                        {//
                            if (dinner_small_type == "就餐")
                            {
                                wancan_d.Checked = true;
                            }
                            else
                            {
                                wancan_x.Checked = true;
                            }
                            if (flag == "1")
                            {
                                label_WanCan_Error.Text = "已就餐,不可预约/删除";
                                wancan_x.Disabled = true;
                                wancan_d.Disabled = true;
                            }
                            else
                            {
                                if (islock == "1")
                                {
                                    label_WanCan_Error.Text = "已超时锁定,不可预约/删除";
                                    wancan_x.Disabled = true;
                                    wancan_d.Disabled = true;
                                }


                            }
                        }
                        else
                        {
                            if (dinner_small_type == "就餐")
                            {
                                zaocan_d.Checked = true;
                            }
                            else
                            {
                                zaocan_x.Checked = true;
                            }
                            if (flag == "1")
                            {
                                label_ZaoCan_Error.Text = "已就餐,不可预约/删除";
                                zaocan_x.Disabled = true;
                                zaocan_d.Disabled = true;
                            }
                            else
                            {
                                if (islock == "1")
                                {
                                    label_ZaoCan_Error.Text = "已超时锁定,不可预约/删除";
                                    zaocan_x.Disabled = true;
                                    zaocan_d.Disabled = true;
                                }


                            }
                        }

                    }
                    else if (dinner_type == "2")
                    {
                        if (dinner_small_type == "就餐")
                        {
                            wucan_d.Checked = true;
                        }
                       
                        if (flag == "1")
                        {
                            label_WuCan_Error.Text = "已就餐,不可预约/删除";

                            wucan_d.Disabled = true;
                        }
                        else
                        {
                            if (islock == "1")
                            {
                                label_WuCan_Error.Text = "已超时锁定,不可预约/删除";

                                wucan_d.Disabled = true;
                            }


                        }
                    }
                    else if (dinner_type == "3")
                    {
                        if (label_zao.Text.ToString().Trim() == "晚餐")
                        {//
                            if (dinner_small_type == "就餐")
                            {
                                zaocan_d.Checked = true;
                            }
                            else
                            {
                                zaocan_x.Checked = true;
                            }
                            if (flag == "1")
                            {
                                label_ZaoCan_Error.Text = "已就餐,不可预约/删除";
                                zaocan_x.Disabled = true;
                                zaocan_d.Disabled = true;
                            }
                            else
                            {
                                if (islock == "1")
                                {
                                    label_ZaoCan_Error.Text = "已超时锁定,不可预约/删除";
                                    zaocan_x.Disabled = true;
                                    zaocan_d.Disabled = true;
                                }


                            }
                        }
                        else
                        {
                            if (dinner_small_type == "就餐")
                            {
                                wancan_d.Checked = true;
                            }
                            else
                            {
                                wancan_x.Checked = true;
                            }
                            if (flag == "1")
                            {
                                label_WanCan_Error.Text = "已就餐,不可预约/删除";
                                wancan_x.Disabled = true;
                                wancan_d.Disabled = true;
                            }
                            else
                            {
                                if (islock == "1")
                                {
                                    label_WanCan_Error.Text = "已超时锁定,不可预约/删除";
                                    wancan_x.Disabled = true;
                                    wancan_d.Disabled = true;
                                }


                            }
                        }
                    }

                }
            }

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                TextBox1.Text = Convert.ToDateTime(TextBox1.Text.ToString().Trim()).ToString("yyyy-MM-dd");

                nowstaffid.Text = newstaffid.Text;

                set(nowstaffid.Text, TextBox1.Text);
            }
            catch
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('日期格式不对') ;</script>");

            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                TextBox1.Text = Convert.ToDateTime(TextBox1.Text.ToString().Trim()).ToString("yyyy-MM-dd");
              
                 nowstaffid.Text = newstaffid.Text;
                
                set(nowstaffid.Text, TextBox1.Text);
            }
            catch
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('日期格式不对') ;</script>");

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
            {
                conn.Open();
                OracleCommand cmd = conn.CreateCommand();
                OracleTransaction tran = conn.BeginTransaction();
                try
                {
                    string sql = "";
                    cmd.Transaction = tran;
                    cmd.CommandType = CommandType.Text;
                    string type1 = "";
                    string type2 = "";
                    if (zaocan_d.Disabled==false)
                    {
                        type1 = label_zao.Text.ToString().Trim();
                        if (zaocan_d.Checked)
                        {
                            type2 ="就餐";
                        }
                        if (zaocan_x.Checked)
                        {
                            type2 ="外带";
                        }
                        if (type1 == "早餐")
                        {
                            if (type2 == "")
                            {
                                sql = " UPDATE CS_STAFF_DINNER_NEW_NEW SET FLAG='-1',DINNER_SIGN=SYSDATE,DINNER_TERMINAL='网页'  WHERE FLAG <'1' AND ISLOCK='0' AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='1'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')";
                            }
                            else
                            {
                                sql = "MERGE INTO CS_STAFF_DINNER_NEW_NEW A  USING (SELECT COUNT(*) CO FROM CS_STAFF_DINNER_NEW_NEW WHERE FLAG IN ('0','1') AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='1'   AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD') ) B ON (B.CO<>0 )  WHEN MATCHED THEN UPDATE SET A.DINNER_SMALL_TYPE='" + type2 + "' ,A.DINNER_TERMINAL='网页'   WHERE A.FLAG  IN ('0','1') AND A.STAFFID='" + nowstaffid.Text.ToString().Trim() + "'  AND A.DINNER_TYPE='1'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')  WHEN NOT MATCHED THEN INSERT   (WORK_DAY,STAFFID,DATE_BOOKING,BOOK_TERMINAL,DINNER_TYPE,DINNER_SMALL_TYPE,FLAG,ISLOCK) VALUES (TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD'),'" + nowstaffid.Text.ToString().Trim() + "',SYSDATE,'网页','1','" + type2 + "','0','0')";

                            }

                        }
                        else
                        {
                            if (type2 == "")
                            {
                                sql = " UPDATE CS_STAFF_DINNER_NEW_NEW SET FLAG='-1',DINNER_SIGN=SYSDATE,DINNER_TERMINAL='网页'  WHERE FLAG <'1'  AND ISLOCK='0'  AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='3' AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')";
                            }
                            else
                            {
                                sql = "MERGE INTO CS_STAFF_DINNER_NEW_NEW A  USING (SELECT COUNT(*) CO FROM CS_STAFF_DINNER_NEW_NEW WHERE FLAG IN ('0','1') AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='3'   AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD') ) B ON (B.CO<>0 )  WHEN MATCHED THEN UPDATE SET A.DINNER_SMALL_TYPE='" + type2 + "' ,A.DINNER_TERMINAL='网页'   WHERE A.FLAG  IN ('0','1') AND A.STAFFID='" + nowstaffid.Text.ToString().Trim() + "'  AND A.DINNER_TYPE='3'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')  WHEN NOT MATCHED THEN INSERT   (WORK_DAY,STAFFID,DATE_BOOKING,BOOK_TERMINAL,DINNER_TYPE,DINNER_SMALL_TYPE,FLAG,ISLOCK) VALUES (TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD'),'" + nowstaffid.Text.ToString().Trim() + "',SYSDATE,'网页','3','" + type2 + "','0','0')";

                            }
                        }
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                    }
                    //**********************************************************************************//
                    if (wucan_d.Disabled == false)
                    {
                        type1 = label_wu.Text.ToString().Trim();
                        type2 = "";
                        if (wucan_d.Checked)
                        {
                            type2 ="就餐";
                        }


                        if (type2 == "")
                        {
                            sql = " UPDATE CS_STAFF_DINNER_NEW_NEW SET FLAG='-1',DINNER_SIGN=SYSDATE,DINNER_TERMINAL='网页'  WHERE FLAG <'1'  AND ISLOCK='0' AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='2'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')";
                        }
                        else
                        {
                            sql = "MERGE INTO CS_STAFF_DINNER_NEW_NEW A  USING (SELECT COUNT(*) CO FROM CS_STAFF_DINNER_NEW_NEW WHERE FLAG IN ('0','1') AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='2'   AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD') ) B ON (B.CO<>0 )  WHEN MATCHED THEN UPDATE SET A.DINNER_SMALL_TYPE='" + type2 + "' ,A.DINNER_TERMINAL='网页'   WHERE A.FLAG  IN ('0','1') AND A.STAFFID='" + nowstaffid.Text.ToString().Trim() + "'  AND A.DINNER_TYPE='2'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')  WHEN NOT MATCHED THEN INSERT   (WORK_DAY,STAFFID,DATE_BOOKING,BOOK_TERMINAL,DINNER_TYPE,DINNER_SMALL_TYPE,FLAG,ISLOCK) VALUES (TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD'),'" + nowstaffid.Text.ToString().Trim() + "',SYSDATE,'网页','2','" + type2 + "','0','0')";

                        }



                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                    }

                    //#############################################################################//
                    if (wancan_d.Disabled == false)
                    {
                        type1 = label_wan.Text.ToString().Trim();
                        type2 = "";
                        if (wancan_d.Checked)
                        {
                            type2 ="就餐";
                        }
                        if (wancan_x.Checked)
                        {
                            type2 ="外带";
                        }
                        if (type1 == "早餐")
                        {
                            if (type2 == "")
                            {
                                sql = " UPDATE CS_STAFF_DINNER_NEW_NEW SET FLAG='-1',DINNER_SIGN=SYSDATE,DINNER_TERMINAL='网页'  WHERE FLAG <'1'   AND ISLOCK='0' AND  STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='1'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')";
                            }
                            else
                            {
                                sql = "MERGE INTO CS_STAFF_DINNER_NEW_NEW A  USING (SELECT COUNT(*) CO FROM CS_STAFF_DINNER_NEW_NEW WHERE FLAG IN ('0','1') AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='1'   AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD') ) B ON (B.CO<>0 )  WHEN MATCHED THEN UPDATE SET A.DINNER_SMALL_TYPE='" + type2 + "' ,A.BOOK_TERMINAL='网页'   WHERE A.FLAG  IN ('0','1') AND A.STAFFID='" + nowstaffid.Text.ToString().Trim() + "'  AND A.DINNER_TYPE='1'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')  WHEN NOT MATCHED THEN INSERT   (WORK_DAY,STAFFID,DATE_BOOKING,BOOK_TERMINAL,DINNER_TYPE,DINNER_SMALL_TYPE,FLAG,ISLOCK) VALUES (TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD'),'" + nowstaffid.Text.ToString().Trim() + "',SYSDATE,'网页','1','" + type2 + "','0','0')";

                            }

                        }
                        else
                        {
                            if (type2 == "")
                            {
                                sql = " UPDATE CS_STAFF_DINNER_NEW_NEW SET FLAG='-1',DINNER_SIGN=SYSDATE,DINNER_TERMINAL='网页'  WHERE FLAG <'1'   AND ISLOCK='0'  AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='3' AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')";
                            }
                            else
                            {
                                sql = "MERGE INTO CS_STAFF_DINNER_NEW_NEW A  USING (SELECT COUNT(*) CO FROM CS_STAFF_DINNER_NEW_NEW WHERE FLAG IN ('0','1') AND STAFFID ='" + nowstaffid.Text.ToString().Trim() + "'  AND DINNER_TYPE='3'   AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD') ) B ON (B.CO<>0 )  WHEN MATCHED THEN UPDATE SET A.DINNER_SMALL_TYPE='" + type2 + "' ,A.BOOK_TERMINAL='网页'   WHERE A.FLAG  IN ('0','1') AND A.STAFFID='" + nowstaffid.Text.ToString().Trim() + "'  AND A.DINNER_TYPE='3'  AND WORK_DAY=TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD')  WHEN NOT MATCHED THEN INSERT   (WORK_DAY,STAFFID,DATE_BOOKING,BOOK_TERMINAL,DINNER_TYPE,DINNER_SMALL_TYPE,FLAG,ISLOCK) VALUES (TO_DATE('" + yyyymmdd_t.Text.ToString().Trim() + "','YYYY-MM-DD'),'" + nowstaffid.Text.ToString().Trim() + "',SYSDATE,'网页','3','" + type2 + "','0','0')";

                            }
                        }
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                    }

                    tran.Commit();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('预约成功。') ;</script>");


                }
                catch
                {
                    tran.Rollback();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('预约失败,稍后重新保存。') ;</script>");


                }
            }


        }
    }
}