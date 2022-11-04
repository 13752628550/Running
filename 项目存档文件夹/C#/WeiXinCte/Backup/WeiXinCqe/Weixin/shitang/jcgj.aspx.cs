using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class jcgj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["fromsource"] == null)
                {

                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getSource.aspx&response_type=code&scope=snsapi_base&state=shitang2#wechat_redirect");
                }
                else
                {
                    dd_yyyymmdd.Value = DateTime.Today.ToString("yyyy-MM-dd");
                    set(dd_yyyymmdd.Value);
                }
              
            }
        }

        private void set( string yyyymmdd)
        {
            try
            {
                string sql = "     SELECT   TO_CHAR(BEGIN_TIME,'YYYY-MM-DD') AS DINNER_DAY,TIME_GUJI,DINNER_TYPE,DINNER_TYPE_ORDER,DINNER_SMALL_TYPE,COUNT(*) AS DINNER_COUNT,SUM(FLAG)  AS DINNER_JIU_COUNT FROM ( SELECT ID,WORK_DAY,STAFFID,(CASE WHEN   DINNER_TYPE='1' AND  CLASSWORKTYPE <>'夜班' THEN '上班'||TO_CHAR(LILUN_IN_DATE,'HH24:MI')  WHEN   DINNER_TYPE='1' AND  CLASSWORKTYPE ='夜班'  AND CLASSWORKMAKER<>'R' THEN '下班'||TO_CHAR(LILUN_OUT_DATE+OVERTIME_PLAN/24,'HH24:MI')  WHEN   DINNER_TYPE='1' AND  CLASSWORKTYPE ='夜班'  AND CLASSWORKMAKER='R' THEN '下班'||TO_CHAR(LILUN_IN_DATE+(OVERTIME_PLAN+1)/24,'HH24:MI')  WHEN   DINNER_TYPE='3' AND  CLASSWORKTYPE ='夜班' THEN '上班'||TO_CHAR(LILUN_IN_DATE,'HH24:MI')  WHEN   DINNER_TYPE='3' AND  CLASSWORKTYPE <>'夜班'  AND CLASSWORKMAKER<>'R' THEN '下班'||TO_CHAR(LILUN_OUT_DATE+OVERTIME_PLAN/24,'HH24:MI')  WHEN   DINNER_TYPE='3' AND  CLASSWORKTYPE <>'夜班'  AND CLASSWORKMAKER='R' THEN '下班'||TO_CHAR(LILUN_IN_DATE+(OVERTIME_PLAN+1)/24,'HH24:MI')  ELSE '无法估计'  END)  AS TIME_GUJI,(CASE WHEN DINNER_TYPE='1' THEN '早餐'  WHEN DINNER_TYPE='3' THEN '晚餐'  WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='夜班' THEN '夜餐'  ELSE '午餐'   END)  AS DINNER_TYPE,(CASE   WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='夜班' THEN N'4'  ELSE DINNER_TYPE   END)  AS DINNER_TYPE_ORDER,CLASSWORKTYPE,DINNER_SMALL_TYPE,     (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_BEGIN_TIME+1  WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE <>'1'  THEN  Y_BEGIN_TIME   ELSE  BEGIN_TIME  END)  AS BEGIN_TIME,  (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='2'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='3'  THEN  Y_END_TIME  ELSE  END_TIME  END)  AS END_TIME, (CASE WHEN FLAG ='0' THEN '未就餐' WHEN FLAG ='1' THEN '已就餐'  WHEN FLAG ='1' THEN '人工取消' ELSE '自动取消'  END)  AS STATUS,FLAG,ISLOCK,ICID,DATE_OUT,SFZ FROM V_STAFF_DINNER_DETAIL   WHERE WORK_DAY>=TO_DATE('" + yyyymmdd + "','YYYY-MM-DD')-1 AND WORK_DAY<=TO_DATE('" + yyyymmdd + "','YYYY-MM-DD')+1 AND FLAG IN ('0','1') )  WHERE  TO_CHAR(BEGIN_TIME,'YYYY-MM-DD')='" + yyyymmdd + "'   GROUP BY TO_CHAR(BEGIN_TIME,'YYYY-MM-DD'),TIME_GUJI,DINNER_TYPE,DINNER_SMALL_TYPE,DINNER_TYPE_ORDER  ORDER BY DINNER_DAY ,DINNER_TYPE_ORDER,DINNER_SMALL_TYPE,TIME_GUJI";

                DataTable dt = OracleOperateHelp.getDataTable(sql);

                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            catch { }
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                dd_yyyymmdd.Value = Convert.ToDateTime(dd_yyyymmdd.Value.ToString().Trim()).ToString("yyyy-MM-dd");

                set(dd_yyyymmdd.Value);
            }
            catch
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('日期格式不对') ;</script>");

            }

        }

        private double sum1 = 0;//
        private double sum2 = 0;//
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || //如果设置gridview不显示Header，就不写这个（否则报错）

    e.Row.RowType == DataControlRowType.DataRow ||

    e.Row.RowType == DataControlRowType.Footer)    //如果设置gridview不显示Footer，就不写这个（否则报错）
            {


            }
            if (e.Row.RowIndex >= 0)
            {
                double dlin1 = Convert.ToDouble(e.Row.Cells[3].Text);
                double dlin2 = Convert.ToDouble(e.Row.Cells[4].Text);
                sum1 += dlin1;
                sum2 += dlin2;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "合计" ;
                e.Row.Cells[3].Text = sum1.ToString();
                e.Row.Cells[4].Text = sum2.ToString();
       
            }
        }



    }
}
 