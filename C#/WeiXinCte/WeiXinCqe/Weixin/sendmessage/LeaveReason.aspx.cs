using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe.Weixin.sendmessage
{
    public partial class LeaveReason : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["newstaffid"] == null || Request.Cookies["cqe"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww4119ac66ab8de522&redirect_uri=https://ctewechat.mitsumi.com.cn/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status26#wechat_redirect");
                }
                else
                {
                    if (Request.Cookies["newstaffid"] != null)
                    {
                        newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    }
                    else
                    {
                        newstaffid.Text = Request.Cookies["weixinid"].Value.ToString().Trim();
                    }


                    //如果原因存在就隐藏提交页面
                    string sqlt = "SELECT STAFFID,REASON,REASON_D,ADDTIME FROM STAFF_LEAVE_REASON WHERE STAFFID ='" + newstaffid.Text + "'";

                    DataTable dt = OracleOperateHelp.getDataTable(sqlt);
                    if (dt.Rows.Count > 0)
                    {
                        btn_save.Visible = false;

                    }
                    else
                    {
                        btn_save.Visible = true;
                    }


                }

                //newstaffid.Text = "171601";
                ////如果原因存在就隐藏提交页面
                //string sqlt = "SELECT STAFFID,REASON,REASON_D,ADDTIME FROM STAFF_LEAVE_REASON WHERE STAFFID ='" + newstaffid.Text + "'";

                //DataTable dt = OracleOperateHelp.getDataTable(sqlt);
                //if (dt.Rows.Count > 0)
                //{
                //    btn_save.Visible = false;

                //}
                //else
                //{
                //    btn_save.Visible = true;
                //}

            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
           // string select_r = selectB.Items[selectB.SelectedIndex].Value.ToString();
            string select_r = "";

            if (a1.Checked || a2.Checked || a3.Checked || a4.Checked || a5.Checked
                || a6.Checked || a7.Checked || a8.Checked || a9.Checked || a10.Checked
                || a11.Checked || a12.Checked || a13.Checked || a14.Checked || a15.Checked)
            {
                if (a1.Checked) select_r = "其他原因";
                if (a2.Checked) select_r = "工作强度大";
                if (a3.Checked) select_r = "工作难度大";
                if (a4.Checked) select_r = "请假受限";
                if (a5.Checked) select_r = "工作分配不均";
                if (a6.Checked) select_r = "长久站立";
                if (a7.Checked) select_r = "车间噪音";
                if (a8.Checked) select_r = "夜班";
                if (a9.Checked) select_r = "同级同事性格差";
                if (a10.Checked) select_r = "直接领导性格差";
                if (a11.Checked) select_r = "加班多";
                if (a12.Checked) select_r = "加班少";
                if (a13.Checked) select_r = "生活不便利";
                if (a14.Checked) select_r = "交通不便利";
                if (a15.Checked) select_r = "工资低"; 
            }

            if (!string.IsNullOrEmpty(select_r))
            {
                using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                {
                    conn.Open();
                    OracleCommand cmd = conn.CreateCommand();
                    OracleTransaction tran = conn.BeginTransaction();
                    try
                    {
                        string sql = "MERGE INTO STAFF_LEAVE_REASON A  USING (SELECT COUNT(*) CO FROM STAFF_LEAVE_REASON WHERE STAFFID ='" + newstaffid.Text + "' ) B " +
                            " ON (B.CO<>0 )     WHEN NOT MATCHED THEN INSERT  (STAFFID,REASON,REASON_D,ADDTIME)VALUES('" + newstaffid.Text + "','" + select_r + "','" + area_1.InnerText + "',SYSDATE)";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit(); 
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交成功。') ;</script>");

                        btn_save.Visible = false;

                    }
                    catch (Exception ex)
                    {
                        tran.Rollback(); 
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交失败，稍后重试。') ;</script>");

                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('请选择离职原因。') ;</script>");
            }
        }
    }
}