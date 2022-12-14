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
    public partial class Dvote15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request.Cookies["weixinid"] == null)
                //{
                //    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=https://wechat.mitsumi.com.cn/Weixin/authority/getWeiXinid.aspx&response_type=code&scope=snsapi_base&state=status15#wechat_redirect");

                //}
                //else
                //{
                //    if (Request.Cookies["newstaffid"] != null)
                //    {
                //        staffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                //    }
                //    else
                //    {
                //        staffid.Text = Request.Cookies["weixinid"].Value.ToString().Trim();
                //    } 
                //    init();
                //    Initw();
                //}

                staffid.Text = "171601";
                init();
                Initw();
            }
        }
        public void init()
        {

            a1.Disabled = false;
            a2.Disabled = false;
            a3.Disabled = false;
            a4.Disabled = false;
            a5.Disabled = false;

            b1.Disabled = false;
            b2.Disabled = false;
            b3.Disabled = false;
            b4.Disabled = false;
            b5.Disabled = false;

            c1.Disabled = false;
            c2.Disabled = false;
            c3.Disabled = false;
            c4.Disabled = false;
            c5.Disabled = false;

            d1.Disabled = false;
            d2.Disabled = false;
            d3.Disabled = false;
            d4.Disabled = false;
            d5.Disabled = false;

            e1.Disabled = false;
            e2.Disabled = false;
            e3.Disabled = false;
            e4.Disabled = false;
            e5.Disabled = false;

            f1.Disabled = false;
            f2.Disabled = false;
            f3.Disabled = false;
            f4.Disabled = false;
            f5.Disabled = false;

            g1.Disabled = false;
            g2.Disabled = false;
            g3.Disabled = false;
            g4.Disabled = false;
            g5.Disabled = false;



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
                string answer1 = area_1.InnerText;
                string answer2 ="";
                string answer3 = "";
                string an_s = "";
                string WD = "";
                if (a1.Checked|| a2.Checked||a3.Checked || a4.Checked|| a5.Checked)
                {
                    if (a1.Checked) an_s = "A";
                    if (a2.Checked) an_s = "B";
                    if (a3.Checked) an_s = "C";
                    if (a4.Checked) an_s = "D";
                    if (a5.Checked) an_s = "E";
                }
                else
                {
                    an_s = "F";
                    WD += "1、";
                }
                if (b1.Checked || b2.Checked || b3.Checked || b4.Checked|| b5.Checked)
                {
                    if (b1.Checked) an_s += "A";
                    if (b2.Checked) an_s += "B";
                    if (b3.Checked) an_s += "C";
                    if (b4.Checked) an_s += "D";
                    if (b5.Checked) an_s += "E";
                }
                else
                {
                    an_s += "F";
                    WD += "2、";
                }
                if (c1.Checked || c2.Checked || c3.Checked || c4.Checked|| c5.Checked)
                {
                    if (c1.Checked) an_s += "A";
                    if (c2.Checked) an_s += "B";
                    if (c3.Checked) an_s += "C";
                    if (c4.Checked) an_s += "D";
                    if (c5.Checked) an_s += "E";
                }
                else
                {
                    an_s += "F";
                    WD += "3、";
                }
                if (d1.Checked || d2.Checked || d3.Checked || d4.Checked|| d5.Checked)
                {
                    if (d1.Checked) an_s += "A";
                    if (d2.Checked) an_s += "B";
                    if (d3.Checked) an_s += "C";
                    if (d4.Checked) an_s += "D";
                    if (d5.Checked) an_s += "E";
                }
                else
                {
                    an_s += "F";
                    WD += "4、";
                }
                if (e1.Checked || e2.Checked || e3.Checked || e4.Checked|| e5.Checked)
                {
                    if (e1.Checked) an_s += "A";
                    if (e2.Checked) an_s += "B";
                    if (e3.Checked) an_s += "C";
                    if (e4.Checked) an_s += "D";
                    if (e5.Checked) an_s += "E";
                }
                else
                {
                    an_s += "F";
                    WD += "5、";
                }
                if (f1.Checked || f2.Checked || f3.Checked || f4.Checked|| f5.Checked)
                {
                    if (f1.Checked) an_s += "A";
                    if (f2.Checked) an_s += "B";
                    if (f3.Checked) an_s += "C";
                    if (f4.Checked) an_s += "D";
                    if (f5.Checked) an_s += "E";
                }
                else
                {
                    an_s += "F";
                    WD += "6、";
                }

                if (g1.Checked || g2.Checked || g3.Checked || g4.Checked|| g5.Checked)
                {
                    if (g1.Checked) an_s += "A";
                    if (g2.Checked) an_s += "B";
                    if (g3.Checked) an_s += "C";
                    if (g4.Checked) an_s += "D";
                    if (g5.Checked) an_s += "E";
                }
                else
                {
                    an_s += "F";
                    WD += "7、";
                }


                if (!string.IsNullOrEmpty(WD))
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('" + WD + "题未作答。') ;window.location.href = '#link27';</script>");
                    return;
                }
                else
                {

                    string sql = "  INSERT into T_InvestigationR  (id,staffid,ChoiceQ,Answer1,Answer2,Answer3)VALUES('24','" + staffid.Text + "','" + an_s + "','" + answer1 + "','" + answer2 + "','" + answer3 + "')";
                    MySqlService2.ExecuteSql(sql);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交成功。谢谢参与！') ;window.location.href = '#link27';</script>");
                    Iniddis();
                    Label16.Text = "(已参与)";
                    Label16.ForeColor = Color.Green;

                    Button1.Visible = false;



                }
            }
        }
        #endregion

        #region 判断是否过期，是否答过
        private void Initw()
        {
            string sql = "SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS NOWDATE,TO_CHAR(A.LIMITDATE,'YYYY-MM-DD HH24:MI') AS LIMITDATE,NVL(B.DVOTE,'') AS DVOTE,NVL(B.DTEXT,'') AS DTEXT,NVL(B.DTEXT1,'') AS DTEXT1,NVL(B.DTEXT2,'') AS DTEXT2 FROM WEIXIN_DVOTE A LEFT JOIN WEIXIN_DVOTE_DETAIL B ON A.ID=B.PID AND B.WEIXINID='" + staffid.Text + "'  WHERE A.ID='24'";
           DataTable dt =MySqlService2.GetTb(sql);
            if (dt.Rows.Count > 0)
            {
                string nowdate = dt.Rows[0]["NOWDATE"].ToString().Trim();
                string limitdate = dt.Rows[0]["LIMITDATE"].ToString().Trim();
                string dvote = dt.Rows[0]["DVOTE"].ToString().Trim();
                string text = dt.Rows[0]["DTEXT"].ToString().Trim(); 
                Labellimittime.Text = limitdate;
                if (dvote!="")
                {
                    Initd(dvote, text );
                    Iniddis();
                }
                else
                {
                    if (Convert.ToDateTime(nowdate) > Convert.ToDateTime(limitdate))
                    {
                        Label16.Text = "(已经截止)";
                        Label16.ForeColor = Color.Red;
                        Iniddis();
                        Button1.Visible = false;
                    }
                }
            }
            else
            {
                DateTime dt_now = DateTime.Now;

                if (dt_now > Convert.ToDateTime(Labellimittime.Text))
                {
                    Label16.Text = "(已经截止)";
                    Label16.ForeColor = Color.Red;
                    Iniddis();
                    Button1.Visible = false;

                }

            }
        }

        #endregion

        #region 已过期
        public void Iniddis()
        {
            Button1.Visible = false;
            a1.Disabled = true;
            a2.Disabled = true;
            a3.Disabled = true;
            a4.Disabled = true;
            a5.Disabled = true;

            b1.Disabled = true;
            b2.Disabled = true;
            b3.Disabled = true;
            b4.Disabled = true;
            b5.Disabled = true;

            c1.Disabled = true;
            c2.Disabled = true;
            c3.Disabled = true;
            c4.Disabled = true;
            c5.Disabled = true;

            d1.Disabled = true;
            d2.Disabled = true;
            d3.Disabled = true;
            d4.Disabled = true;
            d5.Disabled = true;

            e1.Disabled = true;
            e2.Disabled = true;
            e3.Disabled = true;
            d4.Disabled = true;
            d5.Disabled = true;

            f1.Disabled = true;
            f2.Disabled = true;
            f3.Disabled = true;
            f4.Disabled = true;
            f5.Disabled = true;

            g1.Disabled = true;
            g2.Disabled = true;
            g3.Disabled = true;
            g4.Disabled = true;
            g5.Disabled = true;

        }
        #endregion

        #region 已答过
        public void Initd(string an_s_old, string answer1   )
        {
            Label16.Text = "(已参与)";
            Label16.ForeColor = Color.Green;
            //an_s.Text = an_s_old;
            area_1.InnerText = answer1; 
            if (an_s_old!="")
            {
                switch (an_s_old.Substring(0, 1))
                {
                    case "A": a1.Checked = true; break;
                    case "B": a2.Checked = true; break;
                    case "C": a3.Checked = true; break;
                    case "D": a4.Checked = true; break;
                    default: a5.Checked = true; break;
                }
                switch (an_s_old.Substring(1, 1))
                {
                    case "A": b1.Checked = true; break;
                    case "B": b2.Checked = true; break;
                    case "C": b3.Checked = true; break;
                    case "D": b4.Checked = true; break;
                    default: b5.Checked = true; break;
                }
                switch (an_s_old.Substring(2, 1))
                {
                    case "A": c1.Checked = true; break;
                    case "B": c2.Checked = true; break;
                    case "C": c3.Checked = true; break;
                    case "D": c4.Checked = true; break;
                    default: c5.Checked = true; break;
                }
                switch (an_s_old.Substring(3, 1))
                {
                    case "A": d1.Checked = true; break;
                    case "B": d2.Checked = true; break;
                    case "C": d3.Checked = true; break;
                    case "D": d4.Checked = true; break;
                    default: d5.Checked = true; break;
                }
                switch (an_s_old.Substring(4, 1))
                {
                    case "A": e1.Checked = true; break;
                    case "B": e2.Checked = true; break;
                    case "C": e3.Checked = true; break;
                    case "D": e4.Checked = true; break;
                    default: e5.Checked = true; break;
                }
                switch (an_s_old.Substring(5, 1))
                {
                    case "A": f1.Checked = true; break;
                    case "B": f2.Checked = true; break;
                    case "C": f3.Checked = true; break;
                    case "D": f4.Checked = true; break;
                    default: f5.Checked = true; break;
                }
                switch (an_s_old.Substring(6, 1))
                {
                    case "A": g1.Checked = true; break;
                    case "B": g2.Checked = true; break;
                    case "C": g3.Checked = true; break;
                    case "D": g4.Checked = true; break;
                    default: g5.Checked = true; break;
                }
            
            }

        }
        #endregion
    }
}