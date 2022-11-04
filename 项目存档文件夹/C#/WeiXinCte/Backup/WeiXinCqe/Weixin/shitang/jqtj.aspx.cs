using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinCqe
{
    public partial class jqtj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["fromsource"] == null)
                {

                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getSource.aspx&response_type=code&scope=snsapi_base&state=shitang3#wechat_redirect");
                }
                else
                {
                    dd_yyyymmdd.Value = DateTime.Today.ToString("yyyy-MM-dd");
                    set(dd_yyyymmdd.Value);
                }
               // dd_yyyymmdd.Value = DateTime.Today.ToString("yyyy-MM-dd");
               //set(dd_yyyymmdd.Value);
            }
        }

        private void set(string yyyymmdd)
        {
            try
            {
                string sql = " SELECT DINNER_DAY,DINNER_TYPE,PC_NAME,COUNT(*) AS DINNER_COUNT FROM V_DINNER_JQ WHERE DINNER_DAY='"+yyyymmdd+"'  GROUP BY DINNER_DAY,DINNER_TYPE,PC_NAME  ORDER BY DINNER_DAY,(CASE DINNER_TYPE  WHEN '早餐' THEN 1 WHEN '午餐' THEN 2 WHEN '晚餐'  THEN 3 ELSE 4 END),PC_NAME";

                if (DropDownList1.SelectedIndex > -1)
                {
                    if (DropDownList1.SelectedValue != "")
                    {
                        sql = "SELECT DINNER_DAY,DINNER_TYPE,PC_NAME,COUNT(*) AS DINNER_COUNT FROM V_DINNER_JQ WHERE DINNER_DAY='"+yyyymmdd+"' AND DINNER_TYPE='"+DropDownList1.SelectedValue+"' GROUP BY DINNER_DAY,DINNER_TYPE,PC_NAME  ORDER BY DINNER_DAY,PC_NAME";
                    }
                }
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
        
                sum1 += dlin1;
        
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "合计";
                e.Row.Cells[3].Text = sum1.ToString();


            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button4_Click(null,null);

        }



    }
}