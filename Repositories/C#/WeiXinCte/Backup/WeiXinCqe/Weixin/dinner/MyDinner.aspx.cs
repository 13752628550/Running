using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

namespace WeiXinCqe
{
    public partial class MyDinner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request.Cookies["newstaffid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status1#wechat_redirect");
                }
                else
                {
                    label_staffid.Text = Request.Cookies["staffid"].Value.ToString().Trim();
                    label_newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    deviceid.Text = "微信:" + Request.Cookies["deviceid"].Value.ToString().Trim();
                    Labelname.Text = Server.UrlDecode(Request.Cookies["staffname"].Value.ToString().Trim()) + "的预约";
                    init_grid(label_staffid.Text.ToString().Trim(), label_newstaffid.Text.ToString().Trim());
                    if (Request["olddate"] != null)
                    {
                        olddate.Text = Server.UrlDecode(Request["olddate"]);

                    }
                }
                // init_grid("092156","0711115");
                //label_staffid.text = "092156";
                //label_newstaffid.text ="092156";
                //deviceid.text = "微信:";
                //labelname.text = "的预约";
                //init_grid(label_staffid.text.tostring().trim(), label_newstaffid.text.tostring().trim());
            
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Button send_btn = sender as Button;
            GridViewRow row = (GridViewRow)send_btn.NamingContainer;
            string id = row.Cells[9].Text.ToString().Trim();
            string flag = row.Cells[10].Text.ToString().Trim();
            string islock = row.Cells[11].Text.ToString().Trim();
            if (flag == "1")
            {
               // Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('已经就餐，不能删除。') ;window.location.href = 'MyBooking.aspx';</script>");
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('已经就餐，不能删除。') ;</script>");
                      
            }
            else if (islock == "1")
            {
                //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('已经超时，不能删除。') ;window.location.href = 'MyBooking.aspx';</script>");
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('已经超时，不能删除。') ;</script>");
             
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
                        string sql = "UPDATE CS_STAFF_DINNER_NEW_NEW  SET DINNER_SIGN=SYSDATE,FLAG='-1',DINNER_TERMINAL='"+deviceid.Text.ToString().Trim()+"' WHERE FLAG ='0' AND ISLOCK='0' AND ID='" + id + "' ";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('取消预约成功。') ;</script>");
                        init_grid(label_staffid.Text.ToString().Trim(), label_newstaffid.Text.ToString().Trim());
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('取消预约失败。') ;</script>");
                        init_grid(label_staffid.Text.ToString().Trim(), label_newstaffid.Text.ToString().Trim());
                    }
                }
            }
        }
        protected void init_grid(string staffid,string newstaffid)
        {
            try
            {
                string sql = " SELECT ID AS SYSID,TO_CHAR(WORK_DAY,'MM-DD') AS WORK_DAY,CLASSWORKTYPE,DINNER_TYPE,DINNER_SMALL_TYPE,TO_CHAR(BEGIN_TIME,'YYYY-MM-DD HH24:MI') AS BEGIN_TIME,TO_CHAR(END_TIME,'YYYY-MM-DD HH24:MI') AS END_TIME,STATUS,FLAG,ISLOCK FROM (SELECT ID,WORK_DAY,STAFFID,(CASE WHEN DINNER_TYPE='1' THEN '早餐'  WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='白班'  THEN '午餐'  WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='夜班'  THEN '夜餐'  ELSE '晚餐' END) AS DINNER_TYPE,CLASSWORKTYPE,DINNER_SMALL_TYPE,     (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_BEGIN_TIME+1  WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE <>'1'  THEN  Y_BEGIN_TIME   ELSE  BEGIN_TIME  END)  AS BEGIN_TIME,  (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='2'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='3'  THEN  Y_END_TIME  ELSE  END_TIME  END)  AS END_TIME, (CASE WHEN FLAG ='0' THEN '未就餐' WHEN FLAG ='1' THEN '已就餐'  WHEN FLAG ='1' THEN '人工取消' ELSE '自动取消'  END)  AS STATUS,FLAG ,ISLOCK FROM V_STAFF_DINNER_DETAIL WHERE WORK_DAY>=TO_DATE(TO_CHAR(SYSDATE-1,'YYYY-MM-DD'),'YYYY-MM-DD') AND STAFFID ='" + newstaffid + "'  AND FLAG IN ('0','1')  AND ISLOCK !='2' )  ORDER BY WORK_DAY  ,BEGIN_TIME";
                if (newstaffid != staffid)
                {
                    sql = " SELECT ID AS SYSID,TO_CHAR(WORK_DAY,'MM-DD') AS WORK_DAY,CLASSWORKTYPE,DINNER_TYPE,DINNER_SMALL_TYPE,TO_CHAR(BEGIN_TIME,'YYYY-MM-DD HH24:MI') AS BEGIN_TIME,TO_CHAR(END_TIME,'YYYY-MM-DD HH24:MI') AS END_TIME,STATUS,FLAG,ISLOCK FROM (SELECT ID,WORK_DAY,STAFFID,(CASE WHEN DINNER_TYPE='1' THEN '早餐'  WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='白班'  THEN '午餐'  WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='夜班'  THEN '夜餐'  ELSE '晚餐' END) AS DINNER_TYPE,CLASSWORKTYPE,DINNER_SMALL_TYPE,     (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_BEGIN_TIME+1  WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE <>'1'  THEN  Y_BEGIN_TIME   ELSE  BEGIN_TIME  END)  AS BEGIN_TIME,  (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='2'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='3'  THEN  Y_END_TIME  ELSE  END_TIME  END)  AS END_TIME, (CASE WHEN FLAG ='0' THEN '未就餐' WHEN FLAG ='1' THEN '已就餐'  WHEN FLAG ='1' THEN '人工取消' ELSE '自动取消'  END)  AS STATUS,FLAG ,ISLOCK FROM V_STAFF_DINNER_DETAIL WHERE WORK_DAY>=TO_DATE(TO_CHAR(SYSDATE-1,'YYYY-MM-DD'),'YYYY-MM-DD') AND STAFFID ='" + newstaffid + "'  AND FLAG IN ('0','1')  AND  ISLOCK !='2' )  ";

                    sql = sql + "UNION ALL SELECT ID AS SYSID,TO_CHAR(WORK_DAY,'MM-DD') AS WORK_DAY,CLASSWORKTYPE,DINNER_TYPE,DINNER_SMALL_TYPE,TO_CHAR(BEGIN_TIME,'YYYY-MM-DD HH24:MI') AS BEGIN_TIME,TO_CHAR(END_TIME,'YYYY-MM-DD HH24:MI') AS END_TIME,STATUS,FLAG,ISLOCK FROM (SELECT ID,WORK_DAY,STAFFID,(CASE WHEN DINNER_TYPE='1' THEN '早餐'  WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='白班'  THEN '午餐'  WHEN DINNER_TYPE='2'  AND CLASSWORKTYPE='夜班'  THEN '夜餐'  ELSE '晚餐' END) AS DINNER_TYPE,CLASSWORKTYPE,DINNER_SMALL_TYPE,     (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_BEGIN_TIME+1  WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE <>'1'  THEN  Y_BEGIN_TIME   ELSE  BEGIN_TIME  END)  AS BEGIN_TIME,  (CASE WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE='1'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='2'  THEN  Y_END_TIME+1   WHEN CLASSWORKTYPE='夜班'  AND DINNER_TYPE ='3'  THEN  Y_END_TIME  ELSE  END_TIME  END)  AS END_TIME, (CASE WHEN FLAG ='0' THEN '未就餐' WHEN FLAG ='1' THEN '已就餐'  WHEN FLAG ='1' THEN '人工取消' ELSE '自动取消'  END)  AS STATUS,FLAG ,ISLOCK FROM V_STAFF_DINNER_DETAIL WHERE WORK_DAY>=TO_DATE(TO_CHAR(SYSDATE-1,'YYYY-MM-DD'),'YYYY-MM-DD') AND STAFFID ='" + staffid + "'  AND FLAG IN ('0','1')  AND ISLOCK !='2' )  ORDER BY WORK_DAY  ,BEGIN_TIME";
                    
                }
                DataTable dt = OracleOperateHelp.getDataTable(sql);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.EmptyDataText = "没有预约就餐明细";
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch
            {
                GridView1.EmptyDataText = "未取到明细数据，稍后重试";
                GridView1.DataSource = null;
                GridView1.DataBind();
            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || //如果设置gridview不显示Header，就不写这个（否则报错）

    e.Row.RowType == DataControlRowType.DataRow ||

    e.Row.RowType == DataControlRowType.Footer)    //如果设置gridview不显示Footer，就不写这个（否则报错）
            {
                e.Row.Cells[4].Visible = false;
                e.Row.Cells[5].Visible = false;
                e.Row.Cells[6].Visible = false;
                e.Row.Cells[9].Visible = false;
                e.Row.Cells[10].Visible = false;
                e.Row.Cells[11].Visible = false;

            }
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            if (olddate.Text.ToString().Trim() != "")
            {
                Response.Redirect("~/Weixin/dinner/MyBooking.aspx?olddate=" + Server.UrlEncode(olddate.Text.ToString().Trim()) + "");
            }
            else
            {
                Response.Redirect("~/Weixin/dinner/MyBooking.aspx");
    
            }
        }
    }
}