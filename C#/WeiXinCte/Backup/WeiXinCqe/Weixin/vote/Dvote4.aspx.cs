using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.OracleClient;

namespace WeiXinCqe.Weixin.vote
{
    public partial class Dvote4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["weixinid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getWeiXinid.aspx&response_type=code&scope=snsapi_base&state=status3#wechat_redirect");

                }
                else
                {
                    staffid.Text = Request.Cookies["weixinid"].Value.ToString().Trim();
                    init();
                    Initw();
                }

                Label68.Text = yijian.Value.Length.ToString();
                Label2999.Text = yijian1.Value.Length.ToString();
                //staffid.Text = "092156";
                //init();
                //Initw();

            }

            Label68.Text = yijian.Value.Length.ToString();
            Label2999.Text = yijian1.Value.Length.ToString();
        }
        private void init()
        {
            z1_a.Checked = false;
            z1_b.Checked = false;
            z1_c.Checked = false;
            z1_d.Checked = false;
            z2_a.Checked = false;
            z2_b.Checked = false;
            z2_c.Checked = false;
            z2_d.Checked = false;
            z3_a.Checked = false;
            z3_b.Checked = false;
            z3_c.Checked = false;
            z3_d.Checked = false;
            z4_a.Checked = false;
            z4_b.Checked = false;
            z4_c.Checked = false;
            z4_d.Checked = false;
            z5_a.Checked = false;
            z5_b.Checked = false;
            z5_c.Checked = false;
            z5_d.Checked = false;
            z6_a.Checked = false;
            z6_b.Checked = false;
            z6_c.Checked = false;
            z6_d.Checked = false;
            z7_a.Checked = false;
            z7_b.Checked = false;
            z7_c.Checked = false;
            z7_d.Checked = false;
            z8_a.Checked = false;
            z8_b.Checked = false;
            z8_c.Checked = false;
            z8_d.Checked = false;
            z9_a.Checked = false;
            z9_b.Checked = false;
            z9_c.Checked = false;
            z9_d.Checked = false;
            z10_a.Checked = false;
            z10_b.Checked = false;
            z10_c.Checked = false;
            z10_d.Checked = false;
            z11_a.Checked = false;
            z11_b.Checked = false;
            z11_c.Checked = false;
            z11_d.Checked = false;
            z12_a.Checked = false;
            z12_b.Checked = false;
            z12_c.Checked = false;
            z12_d.Checked = false;
            z13_a.Checked = false;
            z13_b.Checked = false;
            z13_c.Checked = false;
            z13_d.Checked = false;
            z14_a.Checked = false;
            z14_b.Checked = false;
            z14_c.Checked = false;
            z14_d.Checked = false;
            z15_a.Checked = false;
            z15_b.Checked = false;
            z15_c.Checked = false;
            z15_d.Checked = false;
            z16_a.Checked = false;
            z16_b.Checked = false;
            z16_c.Checked = false;
            z16_d.Checked = false;
            z17_a.Checked = false;
            z17_b.Checked = false;
            z17_c.Checked = false;
            z17_d.Checked = false;
            z18_a.Checked = false;
            z18_b.Checked = false;
            z18_c.Checked = false;
            z18_d.Checked = false;
            z19_a.Checked = false;
            z19_b.Checked = false;
            z19_c.Checked = false;
            z19_d.Checked = false;
            z20_a.Checked = false;
            z20_b.Checked = false;
            z20_c.Checked = false;
            z20_d.Checked = false;

        }
        private void Initd(string vote, string text, string text1)
        {
            init();
            Label16.Text = "(已参与)";
            Label16.ForeColor = Color.Green;
            yijian.InnerText = text;
            Label68.Text = text.Length.ToString().Trim();
            yijian1.InnerText = text1;
            Label2999.Text = text1.Length.ToString().Trim();
            Button1.Visible = false;

            string z1 = vote.Substring(0, 1);
            switch (z1)
            {
                case "A": z1_a.Checked = true; z1_b.Checked = false; z1_c.Checked = false; z1_d.Checked = false; break;
                case "B": z1_a.Checked = false; z1_b.Checked = true; z1_c.Checked = false; z1_d.Checked = false; break;
                case "C": z1_a.Checked = false; z1_b.Checked = false; z1_c.Checked = true; z1_d.Checked = false; break;
                case "D": z1_a.Checked = false; z1_b.Checked = false; z1_c.Checked = false; z1_d.Checked = true; break;
                default: z1_a.Checked = true; z1_b.Checked = false; z1_c.Checked = false; z1_d.Checked = false; break;
            }

            string z2 = vote.Substring(1, 1);
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
                case "A": z7_a.Checked = true; z7_b.Checked = false; z7_c.Checked = false; z7_d.Checked = false; break;
                case "B": z7_a.Checked = false; z7_b.Checked = true; z7_c.Checked = false; z7_d.Checked = false; break;
                case "C": z7_a.Checked = false; z7_b.Checked = false; z7_c.Checked = true; z7_d.Checked = false; break;
                case "D": z7_a.Checked = false; z7_b.Checked = false; z7_c.Checked = false; z7_d.Checked = true; break;
                default: z7_a.Checked = true; z7_b.Checked = false; z7_c.Checked = false; z7_d.Checked = false; break;
            }

            string z8 = vote.Substring(7, 1);
            switch (z8)
            {
                case "A": z8_a.Checked = true; z8_b.Checked = false; z8_c.Checked = false; z8_d.Checked = false; break;
                case "B": z8_a.Checked = false; z8_b.Checked = true; z8_c.Checked = false; z8_d.Checked = false; break;
                case "C": z8_a.Checked = false; z8_b.Checked = false; z8_c.Checked = true; z8_d.Checked = false; break;
                case "D": z8_a.Checked = false; z8_b.Checked = false; z8_c.Checked = false; z8_d.Checked = true; break;
                default: z8_a.Checked = true; z8_b.Checked = false; z8_c.Checked = false; z8_d.Checked = false; break;
            }

            string z9 = vote.Substring(8, 1);
            switch (z9)
            {
                case "A": z9_a.Checked = true; z9_b.Checked = false; z9_c.Checked = false; z9_d.Checked = false; break;
                case "B": z9_a.Checked = false; z9_b.Checked = true; z9_c.Checked = false; z9_d.Checked = false; break;
                case "C": z9_a.Checked = false; z9_b.Checked = false; z9_c.Checked = true; z9_d.Checked = false; break;
                case "D": z9_a.Checked = false; z9_b.Checked = false; z9_c.Checked = false; z9_d.Checked = true; break;
                default: z9_a.Checked = true; z9_b.Checked = false; z9_c.Checked = false; z9_d.Checked = false; break;
            }

            string z10 = vote.Substring(9, 1);
            switch (z10)
            {
                case "A": z10_a.Checked = true; z10_b.Checked = false; z10_c.Checked = false; z10_d.Checked = false; break;
                case "B": z10_a.Checked = false; z10_b.Checked = true; z10_c.Checked = false; z10_d.Checked = false; break;
                case "C": z10_a.Checked = false; z10_b.Checked = false; z10_c.Checked = true; z10_d.Checked = false; break;
                case "D": z10_a.Checked = false; z10_b.Checked = false; z10_c.Checked = false; z10_d.Checked = true; break;
                default: z10_a.Checked = true; z10_b.Checked = false; z10_c.Checked = false; z10_d.Checked = false; break;
            }

            string z11 = vote.Substring(10, 1);
            switch (z11)
            {
                case "A": z11_a.Checked = true; z11_b.Checked = false; z11_c.Checked = false; z11_d.Checked = false; break;
                case "B": z11_a.Checked = false; z11_b.Checked = true; z11_c.Checked = false; z11_d.Checked = false; break;
                case "C": z11_a.Checked = false; z11_b.Checked = false; z11_c.Checked = true; z11_d.Checked = false; break;
                case "D": z11_a.Checked = false; z11_b.Checked = false; z11_c.Checked = false; z11_d.Checked = true; break;
                default: z11_a.Checked = true; z11_b.Checked = false; z11_c.Checked = false; z11_d.Checked = false; break;
            }

            string z12 = vote.Substring(11, 1);
            switch (z12)
            {
                case "A": z12_a.Checked = true; z12_b.Checked = false; z12_c.Checked = false; z12_d.Checked = false; break;
                case "B": z12_a.Checked = false; z12_b.Checked = true; z12_c.Checked = false; z12_d.Checked = false; break;
                case "C": z12_a.Checked = false; z12_b.Checked = false; z12_c.Checked = true; z12_d.Checked = false; break;
                case "D": z12_a.Checked = false; z12_b.Checked = false; z12_c.Checked = false; z12_d.Checked = true; break;
                default: z12_a.Checked = true; z12_b.Checked = false; z12_c.Checked = false; z12_d.Checked = false; break;
            }

            string z13 = vote.Substring(12, 1);
            switch (z13)
            {
                case "A": z13_a.Checked = true; z13_b.Checked = false; z13_c.Checked = false; z13_d.Checked = false; break;
                case "B": z13_a.Checked = false; z13_b.Checked = true; z13_c.Checked = false; z13_d.Checked = false; break;
                case "C": z13_a.Checked = false; z13_b.Checked = false; z13_c.Checked = true; z13_d.Checked = false; break;
                case "D": z13_a.Checked = false; z13_b.Checked = false; z13_c.Checked = false; z13_d.Checked = true; break;
                default: z13_a.Checked = true; z13_b.Checked = false; z13_c.Checked = false; z13_d.Checked = false; break;
            }

            string z14 = vote.Substring(13, 1);
            switch (z14)
            {
                case "A": z14_a.Checked = true; z14_b.Checked = false; z14_c.Checked = false; z14_d.Checked = false; break;
                case "B": z14_a.Checked = false; z14_b.Checked = true; z14_c.Checked = false; z14_d.Checked = false; break;
                case "C": z14_a.Checked = false; z14_b.Checked = false; z14_c.Checked = true; z14_d.Checked = false; break;
                case "D": z14_a.Checked = false; z14_b.Checked = false; z14_c.Checked = false; z14_d.Checked = true; break;
                default: z14_a.Checked = true; z14_b.Checked = false; z14_c.Checked = false; z14_d.Checked = false; break;
            }

            string z15 = vote.Substring(14, 1);
            switch (z15)
            {
                case "A": z15_a.Checked = true; z15_b.Checked = false; z15_c.Checked = false; z15_d.Checked = false; break;
                case "B": z15_a.Checked = false; z15_b.Checked = true; z15_c.Checked = false; z15_d.Checked = false; break;
                case "C": z15_a.Checked = false; z15_b.Checked = false; z15_c.Checked = true; z15_d.Checked = false; break;
                case "D": z15_a.Checked = false; z15_b.Checked = false; z15_c.Checked = false; z15_d.Checked = true; break;
                default: z15_a.Checked = true; z15_b.Checked = false; z15_c.Checked = false; z15_d.Checked = false; break;
            }

            string z16 = vote.Substring(15, 1);
            switch (z16)
            {
                case "A": z16_a.Checked = true; z16_b.Checked = false; z16_c.Checked = false; z16_d.Checked = false; break;
                case "B": z16_a.Checked = false; z16_b.Checked = true; z16_c.Checked = false; z16_d.Checked = false; break;
                case "C": z16_a.Checked = false; z16_b.Checked = false; z16_c.Checked = true; z16_d.Checked = false; break;
                case "D": z16_a.Checked = false; z16_b.Checked = false; z16_c.Checked = false; z16_d.Checked = true; break;
                default: z16_a.Checked = true; z16_b.Checked = false; z16_c.Checked = false; z16_d.Checked = false; break;
            }

            string z17 = vote.Substring(16, 1);
            switch (z17)
            {
                case "A": z17_a.Checked = true; z17_b.Checked = false; z17_c.Checked = false; z17_d.Checked = false; break;
                case "B": z17_a.Checked = false; z17_b.Checked = true; z17_c.Checked = false; z17_d.Checked = false; break;
                case "C": z17_a.Checked = false; z17_b.Checked = false; z17_c.Checked = true; z17_d.Checked = false; break;
                case "D": z17_a.Checked = false; z17_b.Checked = false; z17_c.Checked = false; z17_d.Checked = true; break;
                default: z17_a.Checked = true; z17_b.Checked = false; z17_c.Checked = false; z17_d.Checked = false; break;
            }

            string z18 = vote.Substring(17, 1);
            switch (z18)
            {
                case "A": z18_a.Checked = true; z18_b.Checked = false; z18_c.Checked = false; z18_d.Checked = false; break;
                case "B": z18_a.Checked = false; z18_b.Checked = true; z18_c.Checked = false; z18_d.Checked = false; break;
                case "C": z18_a.Checked = false; z18_b.Checked = false; z18_c.Checked = true; z18_d.Checked = false; break;
                case "D": z18_a.Checked = false; z18_b.Checked = false; z18_c.Checked = false; z18_d.Checked = true; break;
                default: z18_a.Checked = true; z18_b.Checked = false; z18_c.Checked = false; z18_d.Checked = false; break;
            }

            string z19 = vote.Substring(18, 1);
            switch (z19)
            {
                case "A": z19_a.Checked = true; z19_b.Checked = false; z19_c.Checked = false; z19_d.Checked = false; break;
                case "B": z19_a.Checked = false; z19_b.Checked = true; z19_c.Checked = false; z19_d.Checked = false; break;
                case "C": z19_a.Checked = false; z19_b.Checked = false; z19_c.Checked = true; z19_d.Checked = false; break;
                case "D": z19_a.Checked = false; z19_b.Checked = false; z19_c.Checked = false; z19_d.Checked = true; break;
                default: z19_a.Checked = true; z19_b.Checked = false; z19_c.Checked = false; z19_d.Checked = false; break;
            }

            string z20 = vote.Substring(19, 1);
            switch (z20)
            {
                case "A": z20_a.Checked = true; z20_b.Checked = false; z20_c.Checked = false; z20_d.Checked = false; break;
                case "B": z20_a.Checked = false; z20_b.Checked = true; z20_c.Checked = false; z20_d.Checked = false; break;
                case "C": z20_a.Checked = false; z20_b.Checked = false; z20_c.Checked = true; z20_d.Checked = false; break;
                case "D": z20_a.Checked = false; z20_b.Checked = false; z20_c.Checked = false; z20_d.Checked = true; break;
                default: z20_a.Checked = true; z20_b.Checked = false; z20_c.Checked = false; z20_d.Checked = false; break;
            }


        }
        private void Initw()
        {
            string sql = "SELECT A.OPER AS OPER,TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS NOWDATE,TO_CHAR(A.LIMITDATE,'YYYY-MM-DD HH24:MI') AS LIMITDATE,NVL(B.DVOTE,'') AS DVOTE,NVL(B.DTEXT,'') AS DTEXT,NVL(B.DTEXT1,'') AS DTEXT1 FROM WEIXIN_DVOTE A LEFT JOIN WEIXIN_DVOTE_DETAIL B ON A.ID=B.PID AND B.WEIXINID='" + staffid.Text + "'  WHERE A.ID='2'";
            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                string nowdate = dt.Rows[0]["NOWDATE"].ToString().Trim();
                string limitdate = dt.Rows[0]["LIMITDATE"].ToString().Trim();
                string voteoper = dt.Rows[0]["OPER"].ToString().Trim();
                string dvote = dt.Rows[0]["DVOTE"].ToString().Trim();
                string text = dt.Rows[0]["DTEXT"].ToString().Trim() ;
                string text1 = dt.Rows[0]["DTEXT1"].ToString().Trim() ;
                Labellimittime.Text = limitdate;
                Labelvoteoper.Text = voteoper;
                if (dvote != "")
                {
                    Initd(dvote, text, text1);
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
                //string errstr = "可能由于网络原因，稍后重试";
                //   Response.Redirect("~/Weixin/error/Error.aspx?errstring=" + Server.UrlEncode(errstr));

            }
        }
        private void Iniddis()
        {
            z1_a.Disabled = true;
            z1_b.Disabled = true;
            z1_c.Disabled = true;
            z1_d.Disabled = true;
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
            z7_c.Disabled = true;
            z7_d.Disabled = true;
            z8_a.Disabled = true;
            z8_b.Disabled = true;
            z8_c.Disabled = true;
            z8_d.Disabled = true;
            z9_a.Disabled = true;
            z9_b.Disabled = true;
            z9_c.Disabled = true;
            z9_d.Disabled = true;
            z10_a.Disabled = true;
            z10_b.Disabled = true;
            z10_c.Disabled = true;
            z10_d.Disabled = true;
            z11_a.Disabled = true;
            z11_b.Disabled = true;
            z11_c.Disabled = true;
            z11_d.Disabled = true;
            z12_a.Disabled = true;
            z12_b.Disabled = true;
            z12_c.Disabled = true;
            z12_d.Disabled = true;
            z13_a.Disabled = true;
            z13_b.Disabled = true;
            z13_c.Disabled = true;
            z13_d.Disabled = true;
            z14_a.Disabled = true;
            z14_b.Disabled = true;
            z14_c.Disabled = true;
            z14_d.Disabled = true;
            z15_a.Disabled = true;
            z15_b.Disabled = true;
            z15_c.Disabled = true;
            z15_d.Disabled = true;
            z16_a.Disabled = true;
            z16_b.Disabled = true;
            z16_c.Disabled = true;
            z16_d.Disabled = true;
            z17_a.Disabled = true;
            z17_b.Disabled = true;
            z17_c.Disabled = true;
            z17_d.Disabled = true;
            z18_a.Disabled = true;
            z18_b.Disabled = true;
            z18_c.Disabled = true;
            z18_d.Disabled = true;
            z19_a.Disabled = true;
            z19_b.Disabled = true;
            z19_c.Disabled = true;
            z19_d.Disabled = true;
            z20_a.Disabled = true;
            z20_b.Disabled = true;
            z20_c.Disabled = true;
            z20_d.Disabled = true;
            yijian.Disabled = true;
            yijian1.Disabled = true;
            Button1.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dt_now = DateTime.Now;

            string answer = "";
            string text = "";
            string text1 = "";
            if (dt_now > Convert.ToDateTime(Labellimittime.Text))
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('已经超时，不能提交了') ;window.location.href = '#link28';</script>");
                Button1.Visible = false;
                Label16.Text = "(已经截止)";
                Label16.ForeColor = Color.Red;
                return;
            }
            else
            {
                if (z1_a.Checked || z1_b.Checked || z1_c.Checked || z1_d.Checked)
                {
                    if (z1_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z1_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z1_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z1_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第1题没有作答，不能提交') ;window.location.href = '#link1';</script>");

                    return;
                }


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
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第2题没有作答，不能提交') ;window.location.href = '#link2';</script>");

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
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第3题没有作答，不能提交') ;window.location.href = '#link3';</script>");

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
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第4题没有作答，不能提交') ;window.location.href = '#link4';</script>");

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
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第5题没有作答，不能提交') ;window.location.href = '#link5';</script>");

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
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第6题没有作答，不能提交') ;window.location.href = '#link6';</script>");

                    return;
                }

                if (z7_a.Checked || z7_b.Checked || z7_c.Checked || z7_d.Checked)
                {
                    if (z7_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z7_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z7_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z7_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第7题没有作答，不能提交') ;window.location.href = '#link7';</script>");

                    return;
                }


                if (z8_a.Checked || z8_b.Checked || z8_c.Checked || z8_d.Checked)
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
                    if (z8_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第8题没有作答，不能提交') ;window.location.href = '#link8';</script>");

                    return;
                }

                if (z9_a.Checked || z9_b.Checked || z9_c.Checked || z9_d.Checked)
                {
                    if (z9_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z9_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z9_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z9_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第9题没有作答，不能提交') ;window.location.href = '#link9';</script>");

                    return;
                }


                if (z10_a.Checked || z10_b.Checked || z10_c.Checked || z10_d.Checked)
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
                    if (z10_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第10题没有作答，不能提交') ;window.location.href = '#link10';</script>");

                    return;
                }

                if (z11_a.Checked || z11_b.Checked || z11_c.Checked || z11_d.Checked)
                {
                    if (z11_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z11_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z11_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z11_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第11题没有作答，不能提交') ;window.location.href = '#link11';</script>");

                    return;
                }

                if (z12_a.Checked || z12_b.Checked || z12_c.Checked || z12_d.Checked)
                {
                    if (z12_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z12_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z12_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z12_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第12题没有作答，不能提交') ;window.location.href = '#link12';</script>");

                    return;
                }

                if (z13_a.Checked || z13_b.Checked || z13_c.Checked || z13_d.Checked)
                {
                    if (z13_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z13_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z13_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z13_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第13题没有作答，不能提交') ;window.location.href = '#link13';</script>");

                    return;
                }

                if (z14_a.Checked || z14_b.Checked || z14_c.Checked || z14_d.Checked)
                {
                    if (z14_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z14_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z14_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z14_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第14题没有作答，不能提交') ;window.location.href = '#link14';</script>");

                    return;
                }


                if (z15_a.Checked || z15_b.Checked || z15_c.Checked || z15_d.Checked)
                {
                    if (z15_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z15_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z15_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z15_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第15题没有作答，不能提交') ;window.location.href = '#link15';</script>");

                    return;
                }

                if (z16_a.Checked || z16_b.Checked || z16_c.Checked || z16_d.Checked)
                {
                    if (z16_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z16_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z16_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z16_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第16题没有作答，不能提交') ;window.location.href = '#link16';</script>");

                    return;
                }

                if (z17_a.Checked || z17_b.Checked || z17_c.Checked || z17_d.Checked)
                {
                    if (z17_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z17_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z17_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z17_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第17题没有作答，不能提交') ;window.location.href = '#link17';</script>");

                    return;
                }

                if (z18_a.Checked || z18_b.Checked || z18_c.Checked || z18_d.Checked)
                {
                    if (z18_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z18_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z18_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z18_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第18题没有作答，不能提交') ;window.location.href = '#link18';</script>");

                    return;
                }

                if (z19_a.Checked || z19_b.Checked || z19_c.Checked || z19_d.Checked)
                {
                    if (z19_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z19_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z19_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z19_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第19题没有作答，不能提交') ;window.location.href = '#link19';</script>");

                    return;
                }


                if (z20_a.Checked || z20_b.Checked || z20_c.Checked || z20_d.Checked)
                {
                    if (z20_a.Checked)
                    {
                        answer += "A";
                    }
                    if (z20_b.Checked)
                    {
                        answer += "B";
                    }
                    if (z20_c.Checked)
                    {
                        answer += "C";
                    }
                    if (z20_d.Checked)
                    {
                        answer += "D";
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第20题没有作答，不能提交') ;window.location.href = '#link20';</script>");

                    return;
                }

                text = yijian.Value.ToString().Trim().Replace("'","''");

                text1 = yijian1.Value.ToString().Trim().Replace("'", "''");



                using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                {
                    conn.Open();
                    OracleCommand cmd = conn.CreateCommand();
                    OracleTransaction tran = conn.BeginTransaction();
                    try
                    {
                        string sql = "MERGE INTO WEIXIN_DVOTE_DETAIL A  USING (SELECT COUNT(*) CO FROM WEIXIN_DVOTE_DETAIL WHERE PID='2' AND WEIXINID='" + staffid.Text + "' ) B ON (B.CO<>0 )     WHEN NOT MATCHED THEN INSERT  (PID,WEIXINID,DVOTE,DTEXT,DTEXT1)VALUES('2','" + staffid.Text + "','" + answer + "','" + text + "','"+text1+"')";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交成功。') ;window.location.href = '#link28';</script>");
                        Iniddis();
                        Label16.Text = "(已参与)";
                        Label16.ForeColor = Color.Green;
                        Label68.Text = yijian.Value.Length.ToString();
                        Label2999.Text = yijian1.Value.Length.ToString();
                        Button1.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交失败，稍后重试。') ;window.location.href = '#link28';</script>");

                    }
                }

            }


        }


    }
}