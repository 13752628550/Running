using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe.Weixin.vote
{
    public partial class Dvote01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["weixinid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww4119ac66ab8de522&redirect_uri=https://ctewechat.mitsumi.com.cn/Weixin/authority/getWeiXinid.aspx&response_type=code&scope=snsapi_base&state=status1#wechat_redirect");

                }
                else
                {
                    if (Request.Cookies["newstaffid"] != null)
                    {
                        staffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    }
                    else
                    {
                        staffid.Text = Request.Cookies["weixinid"].Value.ToString().Trim();
                    }

                    init();
                    Initw();
                }

                //staffid.Text = "171601";

                //init();
                //Initw();
                
            }
        }
        public void init()
        {
            c1.Disabled = false;
            c2.Disabled = false;
        }

        #region 提交答案
        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dt_now = DateTime.Now;

            if (dt_now > Convert.ToDateTime(Labellimittime.Text))
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('已经超时，不能提交了') ;window.location.href = '#link27';</script>");
                Button1.Visible = false;
                Label16.Text = "(已经截止)";
                Label16.ForeColor = Color.Red;
                return;
            }
            else
            { 
                string Q3 = "";
                string WD = "";


                if (c1.Checked || c2.Checked  )
                {
                    if (c1.Checked) Q3 = "是";
                    if (c2.Checked) Q3 = "否"; 
                }
                else
                {
                    WD += "是否自愿未选择";
                } 

                if (!string.IsNullOrEmpty(WD))
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('" + WD + "。') ;</script>");
                    return;
                }
                else
                {
                    //提交答案
                    using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                    {
                        conn.Open();
                        OracleCommand cmd = conn.CreateCommand();
                        OracleTransaction tran = conn.BeginTransaction();
                        try
                        {
                            cmd.Transaction = tran;
                            cmd.CommandType = CommandType.Text;  
                           string sql = "MERGE INTO WEIXIN_DVOTE_DETAIL A  USING (SELECT COUNT(*) CO FROM WEIXIN_DVOTE_DETAIL  WHERE PID='1' AND   WEIXINID='" + staffid.Text + "' ) B ON (B.CO<>0 )  " +
                                " WHEN  MATCHED THEN  UPDATE SET A.DVOTE='" + Q3 + "',ADDTIME=SYSDATE WHERE PID='1' AND  WEIXINID='" + staffid.Text + "' " +
                                "  WHEN NOT MATCHED THEN INSERT  (PID,WEIXINID,DVOTE,ADDTIME) VALUES (1,'" + staffid.Text + "','" + Q3 + "',SYSDATE)";

                            cmd.CommandText = sql;
                            int result = cmd.ExecuteNonQuery();
                            tran.Commit();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交成功。谢谢参与！') ;window.location.href = '#link27';</script>");
                            //   Iniddis();
                            Label16.Text = "(已参与)";
                            Label16.ForeColor = Color.Green;
                            Initw();
                            Button1.Visible = false;
                           // Button2.Visible = true;
                        }
                        catch (Exception ex)
                        {
                            tran.Rollback();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交失败，稍后重试。" + ex.Message + "'); </script>");

                        }

                    }
                }
            }
        }
        #endregion

        #region 判断是否过期，是否答过
        private void Initw()
        {
            string sql = "SELECT  DVOTE FROM WEIXIN_DVOTE_DETAIL  WHERE PID=1 AND  WEIXINID='" + staffid.Text + "'  ";
            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count > 0)
            { 
                string limitdate = Labellimittime.Text;
                string Q3 = dt.Rows[0]["DVOTE"].ToString().Trim();
                 
                if (Q3 != "")
                {
                    Button1.Visible = false; 
                    Label16.Text = "(已参与)";
                    Label16.ForeColor = Color.Green; 

                  
                    switch (Q3)
                    {
                        case "是": c1.Checked = true; break;
                        case "否": c2.Checked = true; break; 
                    }

                    Button1.Visible = false;
                }
                else
                {

                    Button1.Visible = true;
                 //   Button2.Visible = false;
                    if (DateTime.Now > Convert.ToDateTime(limitdate))
                    {
                        Label16.Text = "(已经截止)";
                        Label16.ForeColor = Color.Red;
                        Iniddis();
                        Button1.Visible = false;
                       // Button2.Visible = false;
                    }
                }
            }
            else
            {
                DateTime dt_now = DateTime.Now;

                Button1.Visible = true;
                if (dt_now > Convert.ToDateTime(Labellimittime.Text))
                {
                    Label16.Text = "(已经截止)";
                    Label16.ForeColor = Color.Red;
                    Iniddis();
                    Button1.Visible = false;
                    //Button2.Visible = false;

                }

            }
        }

        #endregion

        #region 已过期
        public void Iniddis()
        {
            Button1.Visible = false;
            

            c1.Disabled = true;
            c2.Disabled = true; 
        }
        #endregion

    
    }
}