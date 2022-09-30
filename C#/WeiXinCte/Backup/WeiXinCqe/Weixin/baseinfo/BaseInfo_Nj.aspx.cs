using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe.Weixin.baseinfo
{
    public partial class BaseInfo_Nj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request["newstaffid"] == null)
                {
                    string errstr = "非法打开页面";
                    Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
                }
                else
                {
                   
                    label_newstaffid.Text = Request["newstaffid"].ToString().Trim();
                    deviceid.Text =  Request["yyyy"].ToString().Trim();
                    Labelname.Text = deviceid.Text+"年"+ Server.UrlDecode(Request["staffname"].ToString().Trim()) + "已休年假";
                    init_grid(label_newstaffid.Text.ToString().Trim(), deviceid.Text.ToString().Trim());
                }
             

            }

        }
  
        protected void init_grid( string newstaffid,string yyyy)
        {
            try
            {
                DataTable dt1 = OracleOperateHelp.getDataTable("SELECT TO_CHAR(MIN(BEGIN_DATE),'YYYY-MM-DD')  AS MINDATE,TO_CHAR(MAX(END_DATE),'YYYY-MM-DD')  AS MAXDATE FROM SLR_INTERVAL   WHERE SUBSTR(YYYYMM,0,4)='" + yyyy + "'");

                if (dt1.Rows.Count > 0)
                {
                    string mindate = dt1.Rows[0]["MINDATE"].ToString().Trim();
                    string maxdate = dt1.Rows[0]["MAXDATE"].ToString().Trim();
                    DataTable dt = OracleOperateHelp.getDataTable("SELECT '" + yyyy + "' AS YYYY,STAFFID,STAFFNAME,TO_CHAR(BEGIN_DATE,'YYYY-MM-DD') AS BEGIN_DATE,TO_CHAR(END_DATE,'YYYY-MM-DD') AS END_DATE,LEN FROM STAFF_TIMEOFF WHERE  TIMEOFF_TYPE='带薪年假' AND STATUS IN ('0','1') AND  BEGIN_DATE >=TO_DATE('" + mindate + "' ,'YYYY-MM-DD') AND  BEGIN_DATE <=TO_DATE('" + maxdate + "' ,'YYYY-MM-DD') AND  STAFFID='" + newstaffid + "'");

                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    else
                    {
                        GridView1.EmptyDataText = "没有年假明细";
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                   
                }
                else
                {
                    GridView1.EmptyDataText = "未取到明细数据，稍后重试";
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
           
            }
            catch
            {

            }

        }
        private double sum = 0;//
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || //如果设置gridview不显示Header，就不写这个（否则报错）

    e.Row.RowType == DataControlRowType.DataRow ||

    e.Row.RowType == DataControlRowType.Footer)    //如果设置gridview不显示Footer，就不写这个（否则报错）
            {
             

            }
            if (e.Row.RowIndex >= 0)
            {
                sum += Convert.ToDouble(e.Row.Cells[2].Text);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "合计：" + sum.ToString().Trim() + "天" ;
                e.Row.Cells[0].ColumnSpan =3;
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/baseinfo/BaseInfo.aspx?userinfo=" +Server.UrlEncode("年假信息"));
        
        }
    }
}