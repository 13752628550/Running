using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WeiXinWebApp;
using System.Data;
using System.Data.OracleClient;

namespace WeiXinCqe
{
    public partial class LinWuVote : System.Web.UI.Page
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
                    WEIXIN_ID.Text = Request.Cookies["weixinid"].Value.ToString().Trim();
                    Initw();
                }
                  // WEIXIN_ID.Text ="092156";
                  // Initw();
     
            }
        }
        private void Initw()
        {
            string sql = "SELECT NVL(B.F,'0') AS F,NVL(B.E,'0') AS E,NVL(B.A,'0') AS A,NVL(B.B,'0') AS B,NVL(B.C,'0') AS C,NVL(B.D,'0') AS D, A.ID,A.NAME,A.OPER,TO_CHAR(A.OPERDATE,'YYYY-MM-DD') AS OPERDATE,TO_CHAR(A.LIMITDATE,'YYYY-MM-DD HH24:MI') AS LIMITDATE,TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS NOWDATE,B.WEIXINID,NVL((SELECT COUNT(*) FROM WEIXIN_SIGN_DETAIL WHERE PID='0'),0) AS SUMCOUNT FROM WEIXIN_SIGN A LEFT JOIN WEIXIN_SIGN_DETAIL B ON A.ID=B.PID  AND B.WEIXINID='" + WEIXIN_ID.Text + "'  WHERE A.ID='0'";
            DataTable dt= OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                SIGN_ID.Text = "0";
                Label_limittime.Text = dt.Rows[0]["LIMITDATE"].ToString().Trim();
                string nowdate = dt.Rows[0]["NOWDATE"].ToString().Trim();
           
                SIGN_WEIXINID.Text = dt.Rows[0]["WEIXINID"].ToString().Trim();
                string a = dt.Rows[0]["A"].ToString().Trim();
                string b = dt.Rows[0]["B"].ToString().Trim();
                string c= dt.Rows[0]["C"].ToString().Trim();
                string d = dt.Rows[0]["D"].ToString().Trim();
                string e = dt.Rows[0]["E"].ToString().Trim();
                string f = dt.Rows[0]["F"].ToString().Trim();
                //if (a == "0")
                //{
                //    wucan_d.Checked = false;
                //}
                //else
                //{
                //    Label1.Text += "组委会成员  ";
                //    wucan_d.Checked = true;
                //}
                //if (b == "0")
                //{
                //    wucan_dd.Checked = false;
                //}
                //else
                //{
                //    wucan_dd.Checked = true;
                //    Label1.Text += "舞蹈总指挥  ";
                //}
                //if (c == "0")
                //{
                //    wucan_ddd.Checked = false;
                //}
                //else
                //{
                //    wucan_ddd.Checked = true;
                //    Label1.Text += "裁判员  ";
                //}
                //if (d == "0")
                //{
                //    wucan_dddd.Checked = false;
                //}
                //else
                //{
                //    wucan_dddd.Checked = true;
                //    Label1.Text += "分项目负责人  ";
                //}
                //if (e== "0")
                //{
                //    wucan_ddddd.Checked = false;
                //}
                //else
                //{
                //    wucan_ddddd.Checked = true;
                //    Label1.Text += "主持人  ";
                //}
                if (Label1.Text.Trim() == "")
                {
                    Label_Sumcount.Text = "已经报名人数:" + dt.Rows[0]["SUMCOUNT"].ToString().Trim() + "人";
                }
                else
                {
                    Label_Sumcount.Text = "已经报名人数:" + dt.Rows[0]["SUMCOUNT"].ToString().Trim() + "人,您报名了:" + Label1.Text.Trim();
                }
                if (WEIXIN_ID.Text == SIGN_WEIXINID.Text)
                {
                    Image1.Visible = true;
                    Image1.ImageUrl = "~/Weixin/vote/image/1.png";
                    p1.Visible = false;
                    p2.Visible = true;
                    p3.Visible = false;
                    p4.Visible = false;
                    p5.Visible = false;
                    p6.Visible = false;
                    p7.Visible = false;
                    p8.Visible = false;
                    p9.Visible = false;
                    p10.Visible = true;
                    try
                    {
                        DateTime dt_t = Convert.ToDateTime(nowdate);
                        DateTime dt_now = DateTime.Now;
                        DateTime dt_limit = Convert.ToDateTime(Label_limittime.Text.ToString().Trim());
                        if ((dt_limit < dt_t) || (dt_limit < dt_now))
                        {
                            p10.Visible = false;
                        }

                    }
                    catch { }
             
                    //checkdiv.Visible = false;
                    //wucan_d.Disabled = true;
                    //wucan_dd.Disabled = true;
                    //wucan_ddd.Disabled = true;
                    //wucan_dddd.Disabled = true;
                    //wucan_ddddd.Disabled = true;
                }
                else
                {
                    bool flag = false;
                    try
                    {
                        DateTime dt_t = Convert.ToDateTime(nowdate);
                        DateTime dt_now = DateTime.Now;
                        DateTime dt_limit = Convert.ToDateTime(Label_limittime.Text.ToString().Trim());
                        if ((dt_limit < dt_t) || (dt_limit < dt_now))
                        {
                            flag = true;
                        }
                       
                    }
                    catch { }
                    if (flag)
                    {
                        Image1.Visible = true;
                        Image1.ImageUrl = "~/Weixin/vote/image/2.png";
                        p1.Visible = false;
                        p2.Visible = true;
                        p3.Visible = false;
                        p4.Visible = false;
                        p5.Visible = false;
                        p6.Visible = false;
                        p7.Visible = false;
                        p8.Visible = false;
                        p9.Visible = false;
                        p10.Visible = false;
                        //checkdiv.Visible = false;
                        //wucan_d.Disabled = true;
                        //wucan_dd.Disabled = true;
                        //wucan_ddd.Disabled = true;
                        //wucan_dddd.Disabled = true;
                        //wucan_ddddd.Disabled = true;
                    }
                    else
                    {
                        Image1.Visible = false;
                        Image1.ImageUrl = "";
                        p1.Visible = true;
                        p2.Visible = false;
                        p3.Visible = true;
                        p4.Visible = true;
                        p5.Visible = true;
                        p6.Visible = true;
                        p7.Visible = true;
                        p8.Visible = true;
                        p9.Visible = true;
                        p10.Visible = false;
                        //checkdiv.Visible = true;
                        //wucan_d.Disabled = false;
                        //wucan_dd.Disabled = false;
                        //wucan_ddd.Disabled = false;
                        //wucan_dddd.Disabled = false;
                        //wucan_ddddd.Disabled = false;
                    }
                }
            }
            else
            {
                string errstr = "可能由于网络原因，稍后重试";
                Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));
         
            }
        }
        protected void Label_Button1_Click(object sender, EventArgs e)
        {
            bool flag = false;
            try
            {

                DateTime dt_now = DateTime.Now;
                DateTime dt_limit = Convert.ToDateTime(Label_limittime.Text.ToString().Trim());
                if ((dt_limit < dt_now))
                {
                    flag = true;
                }

            }
            catch { }
            if (flag)
            {
                Image1.Visible = true;
                Image1.ImageUrl = "~/Weixin/vote/image/2.png";
                p1.Visible = false;
                p2.Visible = true;
                p3.Visible = false;
                p10.Visible = false;
                return;
            }
        

            using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
            {
                conn.Open();
                OracleCommand cmd = conn.CreateCommand();
                OracleTransaction tran = conn.BeginTransaction();
                try
                {
                    string sql = "DELETE FROM WEIXIN_SIGN_DETAIL WHERE PID='0' AND WEIXINID='" + WEIXIN_ID.Text + "'";
                    cmd.Transaction = tran;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sql;
                    int result = cmd.ExecuteNonQuery();
                    tran.Commit();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('取消报名成功。') ;</script>");
                    Initw();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('取消报名失败，稍后重试。') ;</script>");

                }
            }
        }
        protected void Label_Button_Click(object sender, EventArgs e)
        {
              bool flag = false;
                    try
                    {
                      
                        DateTime dt_now = DateTime.Now;
                        DateTime dt_limit = Convert.ToDateTime(Label_limittime.Text.ToString().Trim());
                        if ((dt_limit < dt_now))
                        {
                            flag = true;
                        }
                       
                    }
                    catch { }
                    if (flag)
                    {
                        Image1.Visible = true;
                        Image1.ImageUrl = "~/Weixin/vote/image/2.png";
                        p1.Visible = false;
                        p2.Visible = true;
                        p3.Visible = false;
                        return;
                    }
                    string a = "0";
                    string b = "0";
                    string c= "0";
                    string d = "0";
                    string ee= "0";
                    string f= "1";
                    //if (wucan_d.Checked)
                    //{
                    //    a = "1";
                    //}
                    //if (wucan_dd.Checked)
                    //{
                    //    b = "1";
                    //}
                    //if (wucan_ddd.Checked)
                    //{
                    //    c = "1";
                    //}
                    //if (wucan_dddd.Checked)
                    //{
                    //    d= "1";
                    //}
                    //if (wucan_ddddd.Checked)
                    //{
                    //    ee = "1";
                    //}

                    if ((a + b + c + d + ee+f) == "000000")
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('请选择至少一个报名的工作人员类别') ;</script>");
                        return;
                    }

            using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
            {
                conn.Open();
                OracleCommand cmd = conn.CreateCommand();
                OracleTransaction tran = conn.BeginTransaction();
                try
                {
                    string sql = "MERGE INTO WEIXIN_SIGN_DETAIL A  USING (SELECT COUNT(*) CO FROM WEIXIN_SIGN_DETAIL WHERE PID='0' AND WEIXINID='" + WEIXIN_ID.Text + "' ) B ON (B.CO<>0 )     WHEN NOT MATCHED THEN INSERT  (PID,WEIXINID,A,B,C,D,E,F)VALUES('0','" + WEIXIN_ID.Text + "','" + a + "','" + b + "','" + c + "','" + d + "','" + ee + "','"+f+"')";
                    cmd.Transaction = tran;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sql;
                    int result = cmd.ExecuteNonQuery();
                    tran.Commit();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('报名成功。') ;</script>");
                    Initw();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('报名失败，稍后重试。') ;</script>");

                }
            }
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            bool flag = false;
            try
            {

                DateTime dt_now = DateTime.Now;
                DateTime dt_limit = Convert.ToDateTime(Label_limittime.Text.ToString().Trim());
                if ((dt_limit < dt_now))
                {
                    flag = true;
                }

            }
            catch { }
            if (flag)
            {
                Image1.Visible = true;
                Image1.ImageUrl = "~/Weixin/vote/image/2.png";
                p1.Visible = false;
                p2.Visible = true;
                p3.Visible = false;
                p10.Visible = false;
                return;
            }


            using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
            {
                conn.Open();
                OracleCommand cmd = conn.CreateCommand();
                OracleTransaction tran = conn.BeginTransaction();
                try
                {
                    string sql = "DELETE FROM WEIXIN_SIGN_DETAIL WHERE PID='0' AND WEIXINID='" + WEIXIN_ID.Text + "'";
                    cmd.Transaction = tran;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sql;
                    int result = cmd.ExecuteNonQuery();
                    tran.Commit();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('取消报名成功。') ;</script>");
                    Initw();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('取消报名失败，稍后重试。') ;</script>");

                }
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            bool flag = false;
            try
            {

                DateTime dt_now = DateTime.Now;
                DateTime dt_limit = Convert.ToDateTime(Label_limittime.Text.ToString().Trim());
                if ((dt_limit < dt_now))
                {
                    flag = true;
                }

            }
            catch { }
            if (flag)
            {
                Image1.Visible = true;
                Image1.ImageUrl = "~/Weixin/vote/image/2.png";
                p1.Visible = false;
                p2.Visible = true;
                p3.Visible = false;
                return;
            }
            string a = "0";
            string b = "0";
            string c = "0";
            string d = "0";
            string ee = "0";
            string f = "1";
            //if (wucan_d.Checked)
            //{
            //    a = "1";
            //}
            //if (wucan_dd.Checked)
            //{
            //    b = "1";
            //}
            //if (wucan_ddd.Checked)
            //{
            //    c = "1";
            //}
            //if (wucan_dddd.Checked)
            //{
            //    d= "1";
            //}
            //if (wucan_ddddd.Checked)
            //{
            //    ee = "1";
            //}

            if ((a + b + c + d + ee + f) == "000000")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('请选择至少一个报名的工作人员类别') ;</script>");
                return;
            }

            using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
            {
                conn.Open();
                OracleCommand cmd = conn.CreateCommand();
                OracleTransaction tran = conn.BeginTransaction();
                try
                {
                    string sql = "MERGE INTO WEIXIN_SIGN_DETAIL A  USING (SELECT COUNT(*) CO FROM WEIXIN_SIGN_DETAIL WHERE PID='0' AND WEIXINID='" + WEIXIN_ID.Text + "' ) B ON (B.CO<>0 )     WHEN NOT MATCHED THEN INSERT  (PID,WEIXINID,A,B,C,D,E,F)VALUES('0','" + WEIXIN_ID.Text + "','" + a + "','" + b + "','" + c + "','" + d + "','" + ee + "','" + f + "')";
                    cmd.Transaction = tran;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sql;
                    int result = cmd.ExecuteNonQuery();
                    tran.Commit();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('报名成功。') ;</script>");
                    Initw();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('报名失败，稍后重试。') ;</script>");

                }
            }
        }
    }
}