using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Attendance_OvertimeInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["staffid"] == null || Request.Cookies["cqe"] == null)
                {
                    string errstr = "非法打开页面";
                    Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
                }
                else
                {
                    //if (Request.Cookies["cqe"].Value.ToString().Trim() == "2")
                    //{
                    //    Response.Redirect("~/Weixin/error/NoRight.aspx");
                    //}
                    //else
                    //{
                        label_newstaffid.Text = Request["staffid"].ToString().Trim();
                        label_month.Text = Server.UrlDecode(Request["oldmonth"].ToString().Trim());
                        label_type.Text = Request["oldtype"].ToString().Trim();
                        InitInfo();
                    //}
                }


            }

        }
        private void InitInfo()
        {
            string vtype = "平日";
            if (label_type.Text == "overtime2")
            {
                vtype = "休日";
            }
            else if (label_type.Text == "overtime3")
            {
                vtype = "祝日";
            }
            labled.Text = label_month.Text.ToString().Trim()+"月"+vtype+"加班明细";
            this.Title = vtype + "加班明细";
            try{
                string sql = "SELECT STAFFID,TO_CHAR(YYYYMMDD,'YYYY-MM-DD') AS YYYYMMDD,OVERTIME_TYPE,(NVL(OVERTIME_FACT,0)+NVL(OVERTIME_FACT_XL,0)) AS OVERTIME FROM EVERYDAY_STAFF_CHECK_INFO_NEW WHERE (NVL(OVERTIME_FACT,0)+NVL(OVERTIME_FACT_XL,0)) >0  AND YYYYMM='" + label_month.Text.ToString().Trim() + "' AND STAFFID ='" + label_newstaffid.Text.ToString().Trim() + "'  AND OVERTIME_TYPE='"+vtype+"'";

               
                sql = sql + "    ORDER BY YYYYMMDD ";
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
                double dlin = Convert.ToDouble(e.Row.Cells[2].Text);
     
                sum += dlin; 
                
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "合计：" + sum.ToString().Trim() + "H";

                e.Row.Cells[0].ColumnSpan = 3;
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/attendance/Attendance.aspx?old1month=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("历史汇总"));

        }
    }
}