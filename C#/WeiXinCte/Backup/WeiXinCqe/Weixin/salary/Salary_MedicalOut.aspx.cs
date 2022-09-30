using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class Salary_MedicalOut : System.Web.UI.Page
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
            string sql = "SELECT D.YYYYMM,B.PATIENTID AS PATIENTID,B.PATIENTNAME AS PATIENTNAME,C.NAME AS MEDICINENAME,TO_CHAR(B.OUT_DATE,'YYYY-MM-DD') AS OUT_DATE, A.QUANTITY AS QUANTITY,A.PRICE AS PRICE,ROUND(A.QUANTITY*A.PRICE,4) AS SUMPRICE,ROUND(A.QUANTITY*A.PRICE*A.P_RATIO,4) AS P_SUMPRICE  FROM CAMS_MEDICINE.WAREHOUSE_OUT_DETAIL A LEFT JOIN CAMS_MEDICINE.WAREHOUSE_OUT B ON A.P_ID=B.ID LEFT JOIN CAMS_MEDICINE.MEDICINE_INFO C ON A.MEDICINEID =C.ID LEFT JOIN SLR_INTERVAL D ON B.OUT_DATE BETWEEN D.BEGIN_DATE AND D.END_DATE WHERE B.PATIENTID='" + label_newstaffid.Text.ToString().Trim() + "' AND D.YYYYMM='" + label_month.Text.ToString().Trim()+ "'  ORDER BY B.OUT_DATE ,A.P_ID DESC,A.MEDICINEID,B.PATIENTID";
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
                    label_error.Text = "您没有" + label_month.Text.ToString().Trim() + "月药费明细";

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
                double dlin = Convert.ToDouble(e.Row.Cells[4].Text);

                sum += dlin;

            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "合计：" +Math.Round(sum,2).ToString().Trim() + "元(保留2位小数)";

                e.Row.Cells[0].ColumnSpan = 5;
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
                e.Row.Cells[3].Visible = false;
                e.Row.Cells[4].Visible = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/salary/MySalary.aspx?oldmonth=" + Server.UrlEncode(label_month.Text.ToString().Trim()) + "&oldvalue=" + Server.UrlEncode("工资信息"));

        }
    }
}