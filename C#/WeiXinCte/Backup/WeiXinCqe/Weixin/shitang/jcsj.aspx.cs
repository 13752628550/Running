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
    public partial class jcsj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["fromsource"] == null)
                {

                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getSource.aspx&response_type=code&scope=snsapi_base&state=shitang4#wechat_redirect");
                }
                else
                {
                    set();
                }
                
            }
        }

        private void set()
        {
            try
            {
                string sql = "SELECT * FROM CS_STAFF_DINNER_TIME_NEW_NEW  ORDER BY DINNER_TYPE";
       
                DataTable dt1 = OracleOperateHelp.getDataTable(sql);

                if (dt1.Rows.Count == 3)
                {
                    TextBox_Zao_BeginTime.Text = dt1.Rows[0]["BEGIN_TIME"].ToString().Trim();
                    TextBox_Zao_EndTime.Text = dt1.Rows[0]["END_TIME"].ToString().Trim();

                    TextBox_Wu_BeginTime.Text = dt1.Rows[1]["BEGIN_TIME"].ToString().Trim();
                    TextBox_Wu_EndTime.Text = dt1.Rows[1]["END_TIME"].ToString().Trim();

                    TextBox_Wan_BeginTime.Text = dt1.Rows[2]["BEGIN_TIME"].ToString().Trim();
                    TextBox_Wan_EndTime.Text = dt1.Rows[2]["END_TIME"].ToString().Trim();

                    TextBox_Ye_BeginTime.Text = dt1.Rows[1]["Y_BEGIN_TIME"].ToString().Trim();
                    TextBox_Ye_EndTime.Text = dt1.Rows[1]["Y_END_TIME"].ToString().Trim();
                    TextBox_Zao_EndTime.ReadOnly = false;
                    Label_Button.Visible = true;
                }
                else
                {
                    TextBox_Zao_BeginTime.Text = "错误";
                    TextBox_Zao_EndTime.Text = "错误";
                    TextBox_Wu_BeginTime.Text = "错误";
                    TextBox_Wu_EndTime.Text = "错误";
                    TextBox_Wan_BeginTime.Text = "错误";
                    TextBox_Wan_EndTime.Text = "错误";
                    TextBox_Ye_BeginTime.Text = "错误";
                    TextBox_Ye_EndTime.Text = "错误";
                    TextBox_Zao_EndTime.ReadOnly = true;
                    Label_Button.Visible = false;
                }
            }
            catch { }

        }

        protected void Label_Button_Click(object sender, EventArgs e)
        {
            string time_end = TextBox_Zao_EndTime.Text.ToString().Trim();
            string time_begin = TextBox_Zao_BeginTime.Text.ToString().Trim();
            DateTime dtend = Convert.ToDateTime("1990-01-01 00:00");
            string flag = "1";
            try
            {
                dtend = Convert.ToDateTime("1990-01-01 " + time_end);
            }
            catch
            {
                flag = "0";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('时间格式错误。') ;</script>");
                TextBox_Zao_EndTime.Focus();

            }

            if (flag == "1")
            {
                TextBox_Zao_EndTime.Text = dtend.ToString("HH:mm");
                string wbegin = TextBox_Wu_BeginTime.Text;
                if (dtend >= Convert.ToDateTime("1990-01-01 " + time_begin))
                {
                    if (dtend >= Convert.ToDateTime("1990-01-01 " + wbegin))
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('时间不能大于等于午饭开始时间。') ;</script>");
                        TextBox_Zao_EndTime.Focus();
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
                                string sql = "UPDATE CS_STAFF_DINNER_TIME_NEW_NEW SET END_TIME='" + TextBox_Zao_EndTime.Text.ToString().Trim() + "',Y_END_TIME ='" + TextBox_Zao_EndTime.Text.ToString().Trim() + "' WHERE DINNER_TYPE='1' ";
                                cmd.Transaction = tran;
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = sql;
                                int result = cmd.ExecuteNonQuery();
                                tran.Commit();
                                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('设定成功。') ;</script>");

                            }
                            catch (Exception ex)
                            {
                                tran.Rollback();
                                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('设定失败。') ;window.location.href = 'MyLimit.aspx';</script>");

                            }
                        }
                    }
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('时间不能小于开始时间。') ;</script>");
                    TextBox_Zao_EndTime.Focus();
                }
            }
        }
    }
}