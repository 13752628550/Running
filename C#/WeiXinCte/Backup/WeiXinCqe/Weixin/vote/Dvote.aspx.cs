using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OracleClient;

namespace WeiXinCqe
{
    public partial class Dvote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["weixinid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getWeiXinid.aspx&response_type=code&scope=snsapi_base&state=status1#wechat_redirect");

                }
                else
                {
                    staffid.Text = Request.Cookies["weixinid"].Value.ToString().Trim();
                    Initw();
                }
               // staffid.Text = "071889";
            //    Initw();

            }
        }
        private void Initw()
        {
            string sql = "SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS NOWDATE,WEIXINID,DVOTE FROM WEIXIN_DVOTE  WHERE PID='0' AND WEIXINID='" + staffid.Text + "'";
            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                Initd(dt.Rows[0]["DVOTE"].ToString().Trim());

                Iniddis();
            }
            else
            {
                DateTime dt_now = DateTime.Now;

                if (dt_now > Convert.ToDateTime("2016-09-29 13:00"))
                {
                     Label16.Text = "(已经截止)";
                    Label16.ForeColor = Color.Red;

                    Button1.Visible = false;
         
                }
                //string errstr = "可能由于网络原因，稍后重试";
             //   Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));

            }
        }

        private void Initd(string vote)
        {
            Label16.Text = "(已参与)";
            Label16.ForeColor = Color.Green;

            Button1.Visible = false;
            if (vote == "B")
            { 
                z1_a.Checked = false;
                z1_b.Checked = true;
                    nextdiv.Visible = false;
            }
            else
            {
                nextdiv.Visible = true;
                z1_a.Checked = true;
                z1_b.Checked = false;
                string z2 = vote.Substring(1,1);

                switch (z2)
                {
                    case "A": z2_a.Checked = true; z2_b.Checked = false; z2_c.Checked = false; z2_d.Checked = false; break;
                    case "B": z2_a.Checked = false; z2_b.Checked = true; z2_c.Checked = false; z2_d.Checked = false; break;
                    case "C": z2_a.Checked = false; z2_b.Checked = false; z2_c.Checked = true; z2_d.Checked = false; break;
                    case "D": z2_a.Checked = false; z2_b.Checked = false; z2_c.Checked = false; z2_d.Checked = true; break;
                    default: z2_a.Checked = true; z2_b.Checked = false; z2_c.Checked = false; z2_d.Checked = false; break;
                }


                string z3 = vote.Substring(2, 1);

                switch (z3)
                {
                    case "A": z3_a.Checked = true; z3_b.Checked = false; z3_c.Checked = false; z3_d.Checked = false; break;
                    case "B": z3_a.Checked = false; z3_b.Checked = true; z3_c.Checked = false; z3_d.Checked = false; break;
                    case "C": z3_a.Checked = false; z3_b.Checked = false; z3_c.Checked = true; z3_d.Checked = false; break;
                    case "D": z3_a.Checked = false; z3_b.Checked = false; z3_c.Checked = false; z3_d.Checked = true; break;
                    default: z3_a.Checked = true; z3_b.Checked = false; z3_c.Checked = false; z3_d.Checked = false; break;
                }


                string z4 = vote.Substring(3, 1);

                switch (z4)
                {
                    case "A": z4_a.Checked = true; z4_b.Checked = false; z4_c.Checked = false; z4_d.Checked = false; break;
                    case "B": z4_a.Checked = false; z4_b.Checked = true; z4_c.Checked = false; z4_d.Checked = false; break;
                    case "C": z4_a.Checked = false; z4_b.Checked = false; z4_c.Checked = true; z4_d.Checked = false; break;
                    case "D": z4_a.Checked = false; z4_b.Checked = false; z4_c.Checked = false; z4_d.Checked = true; break;
                    default: z4_a.Checked = true; z4_b.Checked = false; z4_c.Checked = false; z4_d.Checked = false; break;
                }


                string z5 = vote.Substring(4, 1);

                switch (z5)
                {
                    case "A": z5_a.Checked = true; z5_b.Checked = false; z5_c.Checked = false; z5_d.Checked = false; break;
                    case "B": z5_a.Checked = false; z5_b.Checked = true; z5_c.Checked = false; z5_d.Checked = false; break;
                    case "C": z5_a.Checked = false; z5_b.Checked = false; z5_c.Checked = true; z5_d.Checked = false; break;
                    case "D": z5_a.Checked = false; z5_b.Checked = false; z5_c.Checked = false; z5_d.Checked = true; break;
                    default: z5_a.Checked = true; z5_b.Checked = false; z5_c.Checked = false; z5_d.Checked = false; break;
                }


                string z6 = vote.Substring(5, 1);

                switch (z6)
                {
                    case "A": z6_a.Checked = true; z6_b.Checked = false; z6_c.Checked = false; z6_d.Checked = false; break;
                    case "B": z6_a.Checked = false; z6_b.Checked = true; z6_c.Checked = false; z6_d.Checked = false; break;
                    case "C": z6_a.Checked = false; z6_b.Checked = false; z6_c.Checked = true; z6_d.Checked = false; break;
                    case "D": z6_a.Checked = false; z6_b.Checked = false; z6_c.Checked = false; z6_d.Checked = true; break;
                    default: z6_a.Checked = true; z6_b.Checked = false; z6_c.Checked = false; z6_d.Checked = false; break;
                }


                string z7 = vote.Substring(6, 1);

                switch (z7)
                {
                    case "A": z7_a.Checked = true; z7_b.Checked = false; break;
                    case "B": z7_a.Checked = false; z7_b.Checked = true;  break;                
                    default: z7_a.Checked = true; z7_b.Checked = false; break;
                }


                string z8 = vote.Substring(7, 1);

                switch (z8)
                {
                    case "A": z8_a.Checked = true; z8_b.Checked = false; z8_c.Checked = false;  break;
                    case "B": z8_a.Checked = false; z8_b.Checked = true; z8_c.Checked = false; break;
                    case "C": z8_a.Checked = false; z8_b.Checked = false; z8_c.Checked = true; break;
                    case "D": z8_a.Checked = false; z8_b.Checked = false; z8_c.Checked = false; break;
                    default: z8_a.Checked = true; z8_b.Checked = false; z8_c.Checked = false; break;
                }


                string z9 = vote.Substring(8, 1);

                switch (z9)
                {
                    case "A": z9_a.Checked = true; z9_b.Checked = false; break;
                    case "B": z9_a.Checked = false; z9_b.Checked = true; break;
          
                    default: z9_a.Checked = true; z9_b.Checked = false;break;
                }


                string z10 = vote.Substring(9, 1);

                switch (z10)
                {
                    case "A": z10_a.Checked = true; z10_b.Checked = false; z10_c.Checked = false;break;
                    case "B": z10_a.Checked = false; z10_b.Checked = true; z10_c.Checked = false; break;
                    case "C": z10_a.Checked = false; z10_b.Checked = false; z10_c.Checked = true; break;
                    default: z10_a.Checked = true; z10_b.Checked = false; z10_c.Checked = false; break;
                }

            
            }
        }

        private void Iniddis()
        {
            z1_a.Disabled = true;
            z1_b.Disabled = true;
            z2_a.Disabled = true;
            z2_b.Disabled = true;
            z2_c.Disabled = true;
            z2_d.Disabled = true;
            z3_a.Disabled = true;
            z3_b.Disabled = true;
            z3_c.Disabled = true;
            z3_d.Disabled = true;
            z4_a.Disabled = true;
            z4_b.Disabled = true;
            z4_c.Disabled = true;
            z4_d.Disabled = true;
            z5_a.Disabled = true;
            z5_b.Disabled = true;
            z5_c.Disabled = true;
            z5_d.Disabled = true;
            z6_a.Disabled = true;
            z6_b.Disabled = true;
            z6_c.Disabled = true;
            z6_d.Disabled = true;
            z7_a.Disabled = true;
            z7_b.Disabled = true;

            z8_a.Disabled = true;
            z8_b.Disabled = true;
            z8_c.Disabled = true;

            z9_a.Disabled = true;
            z9_b.Disabled = true;

            z10_a.Disabled = true;
            z10_b.Disabled = true;
            z10_c.Disabled = true;
   
            nextdiv.Disabled = true;
            Button1.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dt_now = DateTime.Now;

            string answer = "";
            if (dt_now > Convert.ToDateTime("2016-09-29 13:00"))
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('已经超时，不能提交了') ;</script>");
                Button1.Visible = false;
                Label16.Text = "(已经截止)";
                Label16.ForeColor = Color.Red;
                return;
            }
            else
            {
                if (!z1_a.Checked && !z1_b.Checked)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第1题没有作答，不能提交') ;</script>");

                    return;
                }
                if (z1_b.Checked)
                {
                    answer = "B";
                }
                else
                {
                    answer = "A";

                    if (z2_a.Checked || z2_b.Checked || z2_c.Checked || z2_d.Checked)
                    {
                        if (z2_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z2_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z2_c.Checked)
                        {
                            answer += "C";
                        }
                        if (z2_d.Checked)
                        {
                            answer += "D";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第2题没有作答，不能提交') ;</script>");
      
                        return;
                    }

                    if (z3_a.Checked || z3_b.Checked || z3_c.Checked || z3_d.Checked)
                    {
                        if (z3_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z3_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z3_c.Checked)
                        {
                            answer += "C";
                        }
                        if (z3_d.Checked)
                        {
                            answer += "D";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第3题没有作答，不能提交') ;</script>");

                        return;
                    }

                    if (z4_a.Checked || z4_b.Checked || z4_c.Checked || z4_d.Checked)
                    {
                        if (z4_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z4_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z4_c.Checked)
                        {
                            answer += "C";
                        }
                        if (z4_d.Checked)
                        {
                            answer += "D";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第4题没有作答，不能提交') ;</script>");

                        return;
                    }


                    if (z5_a.Checked || z5_b.Checked || z5_c.Checked || z5_d.Checked)
                    {
                        if (z5_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z5_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z5_c.Checked)
                        {
                            answer += "C";
                        }
                        if (z5_d.Checked)
                        {
                            answer += "D";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第5题没有作答，不能提交') ;</script>");

                        return;
                    }


                    if (z6_a.Checked || z6_b.Checked || z6_c.Checked || z6_d.Checked)
                    {
                        if (z6_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z6_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z6_c.Checked)
                        {
                            answer += "C";
                        }
                        if (z6_d.Checked)
                        {
                            answer += "D";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第6题没有作答，不能提交') ;</script>");

                        return;
                    }

                    if (z7_a.Checked || z7_b.Checked )
                    {
                        if (z7_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z7_b.Checked)
                        {
                            answer += "B";
                        }
               
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第7题没有作答，不能提交') ;</script>");

                        return;
                    }


                    if (z8_a.Checked || z8_b.Checked || z8_c.Checked )
                    {
                        if (z8_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z8_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z8_c.Checked)
                        {
                            answer += "C";
                        }
                  
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第8题没有作答，不能提交') ;</script>");

                        return;
                    }


                    if (z9_a.Checked || z9_b.Checked)
                    {
                        if (z9_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z9_b.Checked)
                        {
                            answer += "B";
                        }
                                     
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第9题没有作答，不能提交') ;</script>");

                        return;
                    }

                    if (z10_a.Checked || z10_b.Checked || z10_c.Checked )
                    {
                        if (z10_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z10_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z10_c.Checked)
                        {
                            answer += "C";
                        }
               
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第10题没有作答，不能提交') ;</script>");

                        return;
                    }


          


                }

                using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                {
                    conn.Open();
                    OracleCommand cmd = conn.CreateCommand();
                    OracleTransaction tran = conn.BeginTransaction();
                    try
                    {
                        string sql = "MERGE INTO WEIXIN_DVOTE A  USING (SELECT COUNT(*) CO FROM WEIXIN_DVOTE WHERE PID='0' AND WEIXINID='" + staffid.Text + "' ) B ON (B.CO<>0 )     WHEN NOT MATCHED THEN INSERT  (PID,WEIXINID,DVOTE)VALUES('0','" + staffid.Text + "','" + answer + "')";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交成功。') ;</script>");
                        Iniddis();
                        Label16.Text = "(已参与)";
                        Label16.ForeColor = Color.Green;

                        Button1.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交失败，稍后重试。') ;</script>");

                    }
                }

            }

        
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (z1_a.Checked)
            {
                nextdiv.Visible = true;
            }
            else
            {
                nextdiv.Visible = false;
            }
        }
    }
}