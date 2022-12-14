using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Drawing;
using System.Data;

namespace WeiXinCqe.Weixin.vote
{
    public partial class Dvote2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["weixinid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getWeiXinid.aspx&response_type=code&scope=snsapi_base&state=status2#wechat_redirect");

                }
                else
                {
                    staffid.Text = Request.Cookies["weixinid"].Value.ToString().Trim();
                    init();
                    Initw();
                }
           
              //  Label68.Text = yijian.Value.Length.ToString();
              //staffid.Text = "0718885";
              //init();
              // Initw();

            }

            Label68.Text = yijian.Value.Length.ToString();
        }
        private void init()
        {
            z1_a.Checked = false;
            z1_b.Checked = false;
            z2_a.Checked = false;
            z2_b.Checked = false;
            z3_a.Checked = false;
            z3_b.Checked = false;
            z3_c.Checked = false;
            z3_d.Checked = false;
            z3_e.Checked = false;
            z4_a.Checked = false;
            z4_b.Checked = false;
            z4_c.Checked = false;
            z4_d.Checked = false;
            z4_e.Checked = false;
            z5_a.Checked = false;
            z5_b.Checked = false;
            z5_c.Checked = false;
            z5_d.Checked = false;
            z5_e.Checked = false;
            z6_a.Checked = false;
            z6_b.Checked = false;
            z6_c.Checked = false;
            z6_d.Checked = false;
            z6_e.Checked = false;
            z7_a.Checked = false;
            z7_b.Checked = false;
            z7_c.Checked = false;
            z7_d.Checked = false;
            z7_e.Checked = false;
            z8_a.Checked = false;
            z8_b.Checked = false;
            z8_c.Checked = false;
            z8_d.Checked = false;
            z8_e.Checked = false;
            z9_a.Checked = false;
            z9_b.Checked = false;
            z9_c.Checked = false;
            z9_d.Checked = false;
            z9_e.Checked = false;
            z10_a.Checked = false;
            z10_b.Checked = false;
            z10_c.Checked = false;
            z10_d.Checked = false;
            z10_e.Checked = false;
            z11_a.Checked = false;
            z11_b.Checked = false;
            z12_a.Checked = false;
            z12_b.Checked = false;
            z13_a.Checked = false;
            z13_b.Checked = false;
            z14_a.Checked = false;
            z14_b.Checked = false;
            z15_a.Checked = false;
            z15_b.Checked = false;
            z16_a.Checked = false;
            z16_b.Checked = false;
            z16_c.Checked = false;
            z16_d.Checked = false;
            z16_e.Checked = false;
            z17_a.Checked = false;
            z17_b.Checked = false;
            z17_c.Checked = false;
            z17_d.Checked = false;
            z17_e.Checked = false;
            z18_a.Checked = false;
            z18_b.Checked = false;
            z18_c.Checked = false;
            z18_d.Checked = false;
            z18_e.Checked = false;
            z19_a.Checked = false;
            z19_b.Checked = false;
            z19_c.Checked = false;
            z19_d.Checked = false;
            z19_e.Checked = false;
            z20_a.Checked = false;
            z20_b.Checked = false;
            z20_c.Checked = false;
            z20_d.Checked = false;
            z20_e.Checked = false;
            z21_a.Checked = false;
            z21_b.Checked = false;
            z21_c.Checked = false;
            z21_d.Checked = false;
            z21_e.Checked = false;
            z22_a.Checked = false;
            z22_b.Checked = false;
            z23_a.Checked = false;
            z23_b.Checked = false;
            z24_a.Checked = false;
            z24_b.Checked = false;
            z24_c.Checked = false;
            z24_d.Checked = false;
            z24_e.Checked = false;
            z4_f.Checked = false;
            z4_g.Checked = false;
            z4_h.Checked = false;
            z4_i.Checked = false;
            z4_j.Checked = false;
            z4_k.Checked = false;
            z4_l.Checked = false;
            z4_m.Checked = false;
            z4_n.Checked = false;
            z4_o.Checked = false;
            z4_p.Checked = false;
            z4_q.Checked = false;
            z5_f.Checked = false;
            z5_g.Checked = false;
            z5_h.Checked = false;
            z5_i.Checked = false;
            z5_j.Checked = false;
            z5_k.Checked = false;
            z5_l.Checked = false;
            z5_m.Checked = false;
            z5_n.Checked = false;
            z5_o.Checked = false;
            z5_p.Checked = false;
            z5_q.Checked = false;
        }
        private void Initd(string vote,string text)
        {
            init();
            Label16.Text = "(已参与)";
            Label16.ForeColor = Color.Green;
            yijian.InnerText = text;
            Label68.Text = text.Length.ToString().Trim();
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
                string z2 = vote.Substring(1, 1);

                switch (z2)
                {
                    case "A": z2_a.Checked = true; z2_b.Checked = false;  break;
                    case "B": z2_a.Checked = false; z2_b.Checked = true;break;          
                    default: z2_a.Checked = true; z2_b.Checked = false; break;
                }
                
                string z3 = vote.Substring(2, 1);

                switch (z3)
                {
                    case "A": z3_a.Checked = true; z3_b.Checked = false; z3_c.Checked = false; z3_d.Checked = false; z3_e.Checked = false; break;
                    case "B": z3_a.Checked = false; z3_b.Checked = true; z3_c.Checked = false; z3_d.Checked = false; z3_e.Checked = false; break;
                    case "C": z3_a.Checked = false; z3_b.Checked = false; z3_c.Checked = true; z3_d.Checked = false; z3_e.Checked = false; break;
                    case "D": z3_a.Checked = false; z3_b.Checked = false; z3_c.Checked = false; z3_d.Checked = true; z3_e.Checked = false; break;
                    case "E": z3_a.Checked = false; z3_b.Checked = false; z3_c.Checked = false; z3_d.Checked = false; z3_e.Checked = true; break;
                    default: z3_a.Checked = true; z3_b.Checked = false; z3_c.Checked = false; z3_d.Checked = false; z3_e.Checked = false; break;
                }


                string z41 = vote.Substring(3, 1);
                string z42= vote.Substring(4, 1);
                string z43 = vote.Substring(5, 1);
                switch (z41)
                {
                    case "A": z4_a.Checked = true; break;
                    case "B": z4_b.Checked = true; break;
                    case "C": z4_c.Checked = true; break;
                    case "D": z4_d.Checked = true; break;
                    case "E": z4_e.Checked = true; break;
                    case "F": z4_f.Checked = true; break;
                    case "G": z4_g.Checked = true; break;
                    case "H": z4_h.Checked = true; break;
                    case "I": z4_i.Checked = true; break;
                    case "J": z4_j.Checked = true; break;
                    case "K": z4_k.Checked = true; break;
                    case "L": z4_l.Checked = true; break;
                    case "M": z4_m.Checked = true; break;
                    case "N": z4_n.Checked = true; break;
                    case "O": z4_o.Checked = true; break;
                    case "P": z4_p.Checked = true; break;
                    case "Q": z4_q.Checked = true; break;
                    default: z4_a.Checked = true; break;
                }

                switch (z42)
                {
                    case "A": z4_a.Checked = true; break;
                    case "B": z4_b.Checked = true; break;
                    case "C": z4_c.Checked = true; break;
                    case "D": z4_d.Checked = true; break;
                    case "E": z4_e.Checked = true; break;
                    case "F": z4_f.Checked = true; break;
                    case "G": z4_g.Checked = true; break;
                    case "H": z4_h.Checked = true; break;
                    case "I": z4_i.Checked = true; break;
                    case "J": z4_j.Checked = true; break;
                    case "K": z4_k.Checked = true; break;
                    case "L": z4_l.Checked = true; break;
                    case "M": z4_m.Checked = true; break;
                    case "N": z4_n.Checked = true; break;
                    case "O": z4_o.Checked = true; break;
                    case "P": z4_p.Checked = true; break;
                    case "Q": z4_q.Checked = true; break;
                    default: z4_a.Checked = true; break;
                }
                switch (z43)
                {
                    case "A": z4_a.Checked = true; break;
                    case "B": z4_b.Checked = true; break;
                    case "C": z4_c.Checked = true; break;
                    case "D": z4_d.Checked = true; break;
                    case "E": z4_e.Checked = true; break;
                    case "F": z4_f.Checked = true; break;
                    case "G": z4_g.Checked = true; break;
                    case "H": z4_h.Checked = true; break;
                    case "I": z4_i.Checked = true; break;
                    case "J": z4_j.Checked = true; break;
                    case "K": z4_k.Checked = true; break;
                    case "L": z4_l.Checked = true; break;
                    case "M": z4_m.Checked = true; break;
                    case "N": z4_n.Checked = true; break;
                    case "O": z4_o.Checked = true; break;
                    case "P": z4_p.Checked = true; break;
                    case "Q": z4_q.Checked = true; break;
                    default: z4_a.Checked = true; break;
                }
                string z51 = vote.Substring(6, 1);
                string z52= vote.Substring(7, 1);
                string z53 = vote.Substring(8, 1);
                switch (z51)
                {
                    case "A": z5_a.Checked = true; break;
                    case "B": z5_b.Checked = true; break;
                    case "C": z5_c.Checked = true; break;
                    case "D": z5_d.Checked = true; break;
                    case "E": z5_e.Checked = true; break;
                    case "F": z5_f.Checked = true; break;
                    case "G": z5_g.Checked = true; break;
                    case "H": z5_h.Checked = true; break;
                    case "I": z5_i.Checked = true; break;
                    case "J": z5_j.Checked = true; break;
                    case "K": z5_k.Checked = true; break;
                    case "L": z5_l.Checked = true; break;
                    case "M": z5_m.Checked = true; break;
                    case "N": z5_n.Checked = true; break;
                    case "O": z5_o.Checked = true; break;
                    case "P": z5_p.Checked = true; break;
                    case "Q": z5_q.Checked = true; break;
                    default: z5_a.Checked = true; break;
                }

                switch (z52)
                {
                    case "A": z5_a.Checked = true; break;
                    case "B": z5_b.Checked = true; break;
                    case "C": z5_c.Checked = true; break;
                    case "D": z5_d.Checked = true; break;
                    case "E": z5_e.Checked = true; break;
                    case "F": z5_f.Checked = true; break;
                    case "G": z5_g.Checked = true; break;
                    case "H": z5_h.Checked = true; break;
                    case "I": z5_i.Checked = true; break;
                    case "J": z5_j.Checked = true; break;
                    case "K": z5_k.Checked = true; break;
                    case "L": z5_l.Checked = true; break;
                    case "M": z5_m.Checked = true; break;
                    case "N": z5_n.Checked = true; break;
                    case "O": z5_o.Checked = true; break;
                    case "P": z5_p.Checked = true; break;
                    case "Q": z5_q.Checked = true; break;
                    default: z5_a.Checked = true; break;
                }
                switch (z53)
                {
                    case "A": z5_a.Checked = true; break;
                    case "B": z5_b.Checked = true; break;
                    case "C": z5_c.Checked = true; break;
                    case "D": z5_d.Checked = true; break;
                    case "E": z5_e.Checked = true; break;
                    case "F": z5_f.Checked = true; break;
                    case "G": z5_g.Checked = true; break;
                    case "H": z5_h.Checked = true; break;
                    case "I": z5_i.Checked = true; break;
                    case "J": z5_j.Checked = true; break;
                    case "K": z5_k.Checked = true; break;
                    case "L": z5_l.Checked = true; break;
                    case "M": z5_m.Checked = true; break;
                    case "N": z5_n.Checked = true; break;
                    case "O": z5_o.Checked = true; break;
                    case "P": z5_p.Checked = true; break;
                    case "Q": z5_q.Checked = true; break;
                    default: z5_a.Checked = true; break;
                }                
                string z6 = vote.Substring(9, 1);
                switch (z6)
                {
                    case "A": z6_a.Checked = true; z6_b.Checked = false; z6_c.Checked = false; z6_d.Checked = false; z6_e.Checked = false; break;
                    case "B": z6_a.Checked = false; z6_b.Checked = true; z6_c.Checked = false; z6_d.Checked = false; z6_e.Checked = false; break;
                    case "C": z6_a.Checked = false; z6_b.Checked = false; z6_c.Checked = true; z6_d.Checked = false; z6_e.Checked = false; break;
                    case "D": z6_a.Checked = false; z6_b.Checked = false; z6_c.Checked = false; z6_d.Checked = true; z6_e.Checked = false; break;
                    case "E": z6_a.Checked = false; z6_b.Checked = false; z6_c.Checked = false; z6_d.Checked = false; z6_e.Checked = true; break;
                    default: z6_a.Checked = true; z6_b.Checked = false; z6_c.Checked = false; z6_d.Checked = false; z6_e.Checked = false; break;
                }

                string z7 = vote.Substring(10, 1);
                switch (z7)
                {
                    case "A": z7_a.Checked = true; z7_b.Checked = false; z7_c.Checked = false; z7_d.Checked = false; z7_e.Checked = false; break;
                    case "B": z7_a.Checked = false; z7_b.Checked = true; z7_c.Checked = false; z7_d.Checked = false; z7_e.Checked = false; break;
                    case "C": z7_a.Checked = false; z7_b.Checked = false; z7_c.Checked = true; z7_d.Checked = false; z7_e.Checked = false; break;
                    case "D": z7_a.Checked = false; z7_b.Checked = false; z7_c.Checked = false; z7_d.Checked = true; z7_e.Checked = false; break;
                    case "E": z7_a.Checked = false; z7_b.Checked = false; z7_c.Checked = false; z7_d.Checked = false; z7_e.Checked = true; break;
                    default: z7_a.Checked = true; z7_b.Checked = false; z7_c.Checked = false; z7_d.Checked = false; z7_e.Checked = false; break;
                }

                string z8 = vote.Substring(11, 1);

                switch (z8)
                {
                    case "A": z8_a.Checked = true; z8_b.Checked = false; z8_c.Checked = false; z8_d.Checked = false; z8_e.Checked = false; break;
                    case "B": z8_a.Checked = false; z8_b.Checked = true; z8_c.Checked = false; z8_d.Checked = false; z8_e.Checked = false; break;
                    case "C": z8_a.Checked = false; z8_b.Checked = false; z8_c.Checked = true; z8_d.Checked = false; z8_e.Checked = false; break;
                    case "D": z8_a.Checked = false; z8_b.Checked = false; z8_c.Checked = false; z8_d.Checked = true; z8_e.Checked = false; break;
                    case "E": z8_a.Checked = false; z8_b.Checked = false; z8_c.Checked = false; z8_d.Checked = false; z8_e.Checked = true; break;
                    default: z8_a.Checked = true; z8_b.Checked = false; z8_c.Checked = false; z8_d.Checked = false; z8_e.Checked = false; break;
                }

                string z9 = vote.Substring(12, 1);


                switch (z9)
                {
                    case "A": z9_a.Checked = true; z9_b.Checked = false; z9_c.Checked = false; z9_d.Checked = false; z9_e.Checked = false; break;
                    case "B": z9_a.Checked = false; z9_b.Checked = true; z9_c.Checked = false; z9_d.Checked = false; z9_e.Checked = false; break;
                    case "C": z9_a.Checked = false; z9_b.Checked = false; z9_c.Checked = true; z9_d.Checked = false; z9_e.Checked = false; break;
                    case "D": z9_a.Checked = false; z9_b.Checked = false; z9_c.Checked = false; z9_d.Checked = true; z9_e.Checked = false; break;
                    case "E": z9_a.Checked = false; z9_b.Checked = false; z9_c.Checked = false; z9_d.Checked = false; z9_e.Checked = true; break;
                    default: z9_a.Checked = true; z9_b.Checked = false; z9_c.Checked = false; z9_d.Checked = false; z9_e.Checked = false; break;
                }

                string z10 = vote.Substring(13, 1);


                switch (z10)
                {
                    case "A": z10_a.Checked = true; z10_b.Checked = false; z10_c.Checked = false; z10_d.Checked = false; z10_e.Checked = false; break;
                    case "B": z10_a.Checked = false; z10_b.Checked = true; z10_c.Checked = false; z10_d.Checked = false; z10_e.Checked = false; break;
                    case "C": z10_a.Checked = false; z10_b.Checked = false; z10_c.Checked = true; z10_d.Checked = false; z10_e.Checked = false; break;
                    case "D": z10_a.Checked = false; z10_b.Checked = false; z10_c.Checked = false; z10_d.Checked = true; z10_e.Checked = false; break;
                    case "E": z10_a.Checked = false; z10_b.Checked = false; z10_c.Checked = false; z10_d.Checked = false; z10_e.Checked = true; break;
                    default: z10_a.Checked = true; z10_b.Checked = false; z10_c.Checked = false; z10_d.Checked = false; z10_e.Checked = false; break;
                }

                string z11 = vote.Substring(14, 1);
                switch (z11)
                {
                    case "A": z11_a.Checked = true; z11_b.Checked = false; break;
                    case "B": z11_a.Checked = false; z11_b.Checked = true; break;
                    default: z11_a.Checked = true; z11_b.Checked = false; break;
                }
                string z12 = vote.Substring(15, 1);
                switch (z12)
                {
                    case "A": z12_a.Checked = true; z12_b.Checked = false; break;
                    case "B": z12_a.Checked = false; z12_b.Checked = true; break;
                    default: z12_a.Checked = true; z12_b.Checked = false; break;
                }
                string z13 = vote.Substring(16, 1);
                switch (z13)
                {
                    case "A": z13_a.Checked = true; z13_b.Checked = false; break;
                    case "B": z13_a.Checked = false; z13_b.Checked = true; break;
                    default: z13_a.Checked = true; z13_b.Checked = false; break;
                }
                string z14 = vote.Substring(17, 1);
                switch (z14)
                {
                    case "A": z14_a.Checked = true; z14_b.Checked = false; break;
                    case "B": z14_a.Checked = false; z14_b.Checked = true; break;
                    default: z14_a.Checked = true; z14_b.Checked = false; break;
                }
                string z15 = vote.Substring(18, 1);
                switch (z15)
                {
                    case "A": z15_a.Checked = true; z15_b.Checked = false; break;
                    case "B": z15_a.Checked = false; z15_b.Checked = true; break;
                    default: z15_a.Checked = true; z15_b.Checked = false; break;
                }
                string z16 = vote.Substring(19, 1);

                switch (z16)
                {
                    case "A": z16_a.Checked = true; z16_b.Checked = false; z16_c.Checked = false; z16_d.Checked = false; z16_e.Checked = false; break;
                    case "B": z16_a.Checked = false; z16_b.Checked = true; z16_c.Checked = false; z16_d.Checked = false; z16_e.Checked = false; break;
                    case "C": z16_a.Checked = false; z16_b.Checked = false; z16_c.Checked = true; z16_d.Checked = false; z16_e.Checked = false; break;
                    case "D": z16_a.Checked = false; z16_b.Checked = false; z16_c.Checked = false; z16_d.Checked = true; z16_e.Checked = false; break;
                    case "E": z16_a.Checked = false; z16_b.Checked = false; z16_c.Checked = false; z16_d.Checked = false; z16_e.Checked = true; break;
                    default: z16_a.Checked = true; z16_b.Checked = false; z16_c.Checked = false; z16_d.Checked = false; z16_e.Checked = false; break;
                }

                string z17 = vote.Substring(20, 1);


                switch (z17)
                {
                    case "A": z17_a.Checked = true; z17_b.Checked = false; z17_c.Checked = false; z17_d.Checked = false; z17_e.Checked = false; break;
                    case "B": z17_a.Checked = false; z17_b.Checked = true; z17_c.Checked = false; z17_d.Checked = false; z17_e.Checked = false; break;
                    case "C": z17_a.Checked = false; z17_b.Checked = false; z17_c.Checked = true; z17_d.Checked = false; z17_e.Checked = false; break;
                    case "D": z17_a.Checked = false; z17_b.Checked = false; z17_c.Checked = false; z17_d.Checked = true; z17_e.Checked = false; break;
                    case "E": z17_a.Checked = false; z17_b.Checked = false; z17_c.Checked = false; z17_d.Checked = false; z17_e.Checked = true; break;
                    default: z17_a.Checked = true; z17_b.Checked = false; z17_c.Checked = false; z17_d.Checked = false; z17_e.Checked = false; break;
                }

                string z18 = vote.Substring(21, 1);

                switch (z18)
                {
                    case "A": z18_a.Checked = true; z18_b.Checked = false; z18_c.Checked = false; z18_d.Checked = false; z18_e.Checked = false; break;
                    case "B": z18_a.Checked = false; z18_b.Checked = true; z18_c.Checked = false; z18_d.Checked = false; z18_e.Checked = false; break;
                    case "C": z18_a.Checked = false; z18_b.Checked = false; z18_c.Checked = true; z18_d.Checked = false; z18_e.Checked = false; break;
                    case "D": z18_a.Checked = false; z18_b.Checked = false; z18_c.Checked = false; z18_d.Checked = true; z18_e.Checked = false; break;
                    case "E": z18_a.Checked = false; z18_b.Checked = false; z18_c.Checked = false; z18_d.Checked = false; z18_e.Checked = true; break;
                    default: z18_a.Checked = true; z18_b.Checked = false; z18_c.Checked = false; z18_d.Checked = false; z18_e.Checked = false; break;
                }

                string z19 = vote.Substring(22, 1);

                switch (z19)
                {
                    case "A": z19_a.Checked = true; z19_b.Checked = false; z19_c.Checked = false; z19_d.Checked = false; z19_e.Checked = false; break;
                    case "B": z19_a.Checked = false; z19_b.Checked = true; z19_c.Checked = false; z19_d.Checked = false; z19_e.Checked = false; break;
                    case "C": z19_a.Checked = false; z19_b.Checked = false; z19_c.Checked = true; z19_d.Checked = false; z19_e.Checked = false; break;
                    case "D": z19_a.Checked = false; z19_b.Checked = false; z19_c.Checked = false; z19_d.Checked = true; z19_e.Checked = false; break;
                    case "E": z19_a.Checked = false; z19_b.Checked = false; z19_c.Checked = false; z19_d.Checked = false; z19_e.Checked = true; break;
                    default: z19_a.Checked = true; z19_b.Checked = false; z19_c.Checked = false; z19_d.Checked = false; z19_e.Checked = false; break;
                }

                string z20 = vote.Substring(23, 1);

                switch (z20)
                {
                    case "A": z20_a.Checked = true; z20_b.Checked = false; z20_c.Checked = false; z20_d.Checked = false; z20_e.Checked = false; break;
                    case "B": z20_a.Checked = false; z20_b.Checked = true; z20_c.Checked = false; z20_d.Checked = false; z20_e.Checked = false; break;
                    case "C": z20_a.Checked = false; z20_b.Checked = false; z20_c.Checked = true; z20_d.Checked = false; z20_e.Checked = false; break;
                    case "D": z20_a.Checked = false; z20_b.Checked = false; z20_c.Checked = false; z20_d.Checked = true; z20_e.Checked = false; break;
                    case "E": z20_a.Checked = false; z20_b.Checked = false; z20_c.Checked = false; z20_d.Checked = false; z20_e.Checked = true; break;
                    default: z20_a.Checked = true; z20_b.Checked = false; z20_c.Checked = false; z20_d.Checked = false; z20_e.Checked = false; break;
                }

                string z21 = vote.Substring(24, 1);

                switch (z21)
                {
                    case "A": z21_a.Checked = true; z21_b.Checked = false; z21_c.Checked = false; z21_d.Checked = false; z21_e.Checked = false; break;
                    case "B": z21_a.Checked = false; z21_b.Checked = true; z21_c.Checked = false; z21_d.Checked = false; z21_e.Checked = false; break;
                    case "C": z21_a.Checked = false; z21_b.Checked = false; z21_c.Checked = true; z21_d.Checked = false; z21_e.Checked = false; break;
                    case "D": z21_a.Checked = false; z21_b.Checked = false; z21_c.Checked = false; z21_d.Checked = true; z21_e.Checked = false; break;
                    case "E": z21_a.Checked = false; z21_b.Checked = false; z21_c.Checked = false; z21_d.Checked = false; z21_e.Checked = true; break;
                    default: z21_a.Checked = true; z21_b.Checked = false; z21_c.Checked = false; z21_d.Checked = false; z21_e.Checked = false; break;
                }

                string z22 = vote.Substring(25, 1);
                switch (z22)
                {
                    case "A": z22_a.Checked = true; z22_b.Checked = false; break;
                    case "B": z22_a.Checked = false; z22_b.Checked = true; break;
                    default: z22_a.Checked = true; z22_b.Checked = false; break;
                }
                string z23 = vote.Substring(26, 1);
                switch (z23)
                {
                    case "A": z23_a.Checked = true; z23_b.Checked = false; break;
                    case "B": z23_a.Checked = false; z23_b.Checked = true; break;
                    default: z23_a.Checked = true; z23_b.Checked = false; break;
                }
                string z24 = vote.Substring(27, 1);

                switch (z24)
                {
                    case "A": z24_a.Checked = true; z24_b.Checked = false; z24_c.Checked = false; z24_d.Checked = false; z24_e.Checked = false; break;
                    case "B": z24_a.Checked = false; z24_b.Checked = true; z24_c.Checked = false; z24_d.Checked = false; z24_e.Checked = false; break;
                    case "C": z24_a.Checked = false; z24_b.Checked = false; z24_c.Checked = true; z24_d.Checked = false; z24_e.Checked = false; break;
                    case "D": z24_a.Checked = false; z24_b.Checked = false; z24_c.Checked = false; z24_d.Checked = true; z24_e.Checked = false; break;
                    case "E": z24_a.Checked = false; z24_b.Checked = false; z24_c.Checked = false; z24_d.Checked = false; z24_e.Checked = true; break;
                    default: z24_a.Checked = true; z24_b.Checked = false; z24_c.Checked = false; z24_d.Checked = false; z24_e.Checked = false; break;
                }

   


            }
        }
        private void Initw()
        {
            string sql = "SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS NOWDATE,TO_CHAR(A.LIMITDATE,'YYYY-MM-DD HH24:MI') AS LIMITDATE,NVL(B.DVOTE,'') AS DVOTE,NVL(B.DTEXT,'') AS DTEXT FROM WEIXIN_DVOTE A LEFT JOIN WEIXIN_DVOTE_DETAIL B ON A.ID=B.PID AND B.WEIXINID='"+staffid.Text+"'  WHERE A.ID='1'";
            DataTable dt = OracleOperateHelp.getDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                string nowdate = dt.Rows[0]["NOWDATE"].ToString().Trim();
                string limitdate = dt.Rows[0]["LIMITDATE"].ToString().Trim();
                string dvote = dt.Rows[0]["DVOTE"].ToString().Trim();
                string text = dt.Rows[0]["DTEXT"].ToString().Trim();
                Labellimittime.Text = limitdate;
                if (dvote != "")
                {
                    Initd(dvote, text);
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
            z2_a.Disabled = true;
            z2_b.Disabled = true;
            z3_a.Disabled = true;
            z3_b.Disabled = true;
            z3_c.Disabled = true;
            z3_d.Disabled = true;
            z3_e.Disabled = true;
            z4_a.Disabled = true;
            z4_b.Disabled = true;
            z4_c.Disabled = true;
            z4_d.Disabled = true;
            z4_e.Disabled = true;
            z5_a.Disabled = true;
            z5_b.Disabled = true;
            z5_c.Disabled = true;
            z5_d.Disabled = true;
            z5_e.Disabled = true;
            z6_a.Disabled = true;
            z6_b.Disabled = true;
            z6_c.Disabled = true;
            z6_d.Disabled = true;
            z6_e.Disabled = true;
            z7_a.Disabled = true;
            z7_b.Disabled = true;
            z7_c.Disabled = true;
            z7_d.Disabled = true;
            z7_e.Disabled = true;
            z8_a.Disabled = true;
            z8_b.Disabled = true;
            z8_c.Disabled = true;
            z8_d.Disabled = true;
            z8_e.Disabled = true;
            z9_a.Disabled = true;
            z9_b.Disabled = true;
            z9_c.Disabled = true;
            z9_d.Disabled = true;
            z9_e.Disabled = true;
            z10_a.Disabled = true;
            z10_b.Disabled = true;
            z10_c.Disabled = true;
            z10_d.Disabled = true;
            z10_e.Disabled = true;
            z11_a.Disabled = true;
            z11_b.Disabled = true;
            z12_a.Disabled = true;
            z12_b.Disabled = true;
            z13_a.Disabled = true;
            z13_b.Disabled = true;
            z14_a.Disabled = true;
            z14_b.Disabled = true;    
            z15_a.Disabled = true;
            z15_b.Disabled = true;
            z16_a.Disabled = true;
            z16_b.Disabled = true;
            z16_c.Disabled = true;
            z16_d.Disabled = true;
            z16_e.Disabled = true;
            z17_a.Disabled = true;
            z17_b.Disabled = true;
            z17_c.Disabled = true;
            z17_d.Disabled = true;
            z17_e.Disabled = true;
            z18_a.Disabled = true;
            z18_b.Disabled = true;
            z18_c.Disabled = true;
            z18_d.Disabled = true;
            z18_e.Disabled = true;
            z19_a.Disabled = true;
            z19_b.Disabled = true;
            z19_c.Disabled = true;
            z19_d.Disabled = true;
            z19_e.Disabled = true;
            z20_a.Disabled = true;
            z20_b.Disabled = true;
            z20_c.Disabled = true;
            z20_d.Disabled = true;
            z20_e.Disabled = true;
            z21_a.Disabled = true;
            z21_b.Disabled = true;
            z21_c.Disabled = true;
            z21_d.Disabled = true;
            z21_e.Disabled = true;
            z22_a.Disabled = true;
            z22_b.Disabled = true;
            z23_a.Disabled = true;
            z23_b.Disabled = true;
            z24_a.Disabled = true;
            z24_b.Disabled = true;
            z24_c.Disabled = true;
            z24_d.Disabled = true;
            z24_e.Disabled = true;
            z5_f.Disabled = true;
            z5_g.Disabled = true;
            z5_h.Disabled = true;
            z5_i.Disabled = true;
            z5_j.Disabled = true;
            z5_k.Disabled = true;
            z5_l.Disabled = true;
            z5_m.Disabled = true;
            z5_n.Disabled = true;
            z5_o.Disabled = true;
            z5_p.Disabled = true;
            z5_q.Disabled = true;
            z4_f.Disabled = true;
            z4_g.Disabled = true;
            z4_h.Disabled = true;
            z4_i.Disabled = true;
            z4_j.Disabled = true;
            z4_k.Disabled = true;
            z4_l.Disabled = true;
            z4_m.Disabled = true;
            z4_n.Disabled = true;
            z4_o.Disabled = true;
            z4_p.Disabled = true;
            z4_q.Disabled = true;
            yijian.Disabled = true;
            nextdiv.Disabled = true;
            Button1.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dt_now = DateTime.Now;

            string answer = "";
            string text = "";
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
                if (!z1_a.Checked && !z1_b.Checked)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第1题没有作答，不能提交') ;window.location.href = '#link1';</script>");

                    return;
                }
                if (z1_b.Checked)
                {
                    answer = "B";
                }
                else
                {
                    answer = "A";

                    if (z2_a.Checked || z2_b.Checked )
                    {
                        if (z2_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z2_b.Checked)
                        {
                            answer += "B";
                        }
               
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第2题没有作答，不能提交') ;window.location.href = '#link2';</script>");
                        
                        return;
                    }

                    if (z3_a.Checked || z3_b.Checked || z3_c.Checked || z3_d.Checked || z3_e.Checked)
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
                        if (z3_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第3题没有作答，不能提交') ;window.location.href = '#link3';</script>");

                        return;
                    }
                    string answer4 = "";
                    int countflag = 0;
                    if (z4_a.Checked || z4_b.Checked || z4_c.Checked || z4_d.Checked || z4_e.Checked || z4_f.Checked || z4_g.Checked || z4_h.Checked || z4_i.Checked || z4_j.Checked || z4_k.Checked || z4_l.Checked || z4_m.Checked || z4_n.Checked || z4_o.Checked || z4_p.Checked || z4_q.Checked )
                    {
                        countflag = 0;
                        if (z4_a.Checked)
                        {
                            answer += "A";
                            answer4 += "A";
                            countflag++;
                        }
                        if (z4_b.Checked)
                        {
                            answer += "B";
                            answer4 += "B";
                            countflag++;
                        }
                        if (z4_c.Checked)
                        {
                            answer += "C";
                            answer4 += "C";
                            countflag++;
                        }
                        if (z4_d.Checked)
                        {
                            answer += "D";
                            answer4 += "D";
                            countflag++;
                        }
                        if (z4_e.Checked)
                        {
                            answer += "E";
                            answer4 += "E";
                            countflag++;
                        }
                        if (z4_f.Checked)
                        {
                            answer += "F";
                            answer4 += "F";
                            countflag++;
                        }
                        if (z4_g.Checked)
                        {
                            answer += "G";
                            answer4 += "G";
                            countflag++;
                        }
                        if (z4_h.Checked)
                        {
                            answer += "H";
                            answer4 += "H";
                            countflag++;
                        }
                        if (z4_i.Checked)
                        {
                            answer += "I";
                            answer4 += "I";
                            countflag++;
                        }
                        if (z4_j.Checked)
                        {
                            answer += "J";
                            answer4 += "J";
                            countflag++;
                        }
                        if (z4_k.Checked)
                        {
                            answer += "K";
                            answer4 += "K";
                            countflag++;
                        }
                        if (z4_l.Checked)
                        {
                            answer += "L";
                            answer4 += "L";
                            countflag++;
                        }
                        if (z4_m.Checked)
                        {
                            answer += "M";
                            answer4 += "M";
                            countflag++;
                        }
                        if (z4_n.Checked)
                        {
                            answer += "N";
                            answer4 += "N";
                            countflag++;
                        }
                        if (z4_o.Checked)
                        {
                            answer += "O";
                            answer4 += "O";
                            countflag++;
                        }
                        if (z4_p.Checked)
                        {
                            answer += "P";
                            answer4 += "P";
                            countflag++;
                        }
                        if (z4_q.Checked)
                        {
                            answer += "Q";
                            answer4 += "Q";
                            countflag++;
                        }

                        if (countflag != 3)
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第4题必须选三个项目，不能提交') ;window.location.href = '#link4';</script>");

                            return;
                        }

                    }
                    else
                    {
                       // Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第4题没有作答，不能提交') ;document.getElementById('A4link').click();</script>");
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "scroll", "<script languange=javascript>alert('第4题没有作答，不能提交') ; window.location.href = '#link4'; </script>");

                        return;
                    }

                    string answer5 = "";
                    if (z5_a.Checked || z5_b.Checked || z5_c.Checked || z5_d.Checked || z5_e.Checked || z5_f.Checked || z5_g.Checked || z5_h.Checked || z5_i.Checked || z5_j.Checked || z5_k.Checked || z5_l.Checked || z5_m.Checked || z5_n.Checked || z5_o.Checked || z5_p.Checked || z5_q.Checked)
                    {
                        countflag = 0;
                        if (z5_a.Checked)
                        {
                            answer += "A";
                            answer5 += "A";
                            countflag++;
                        }
                        if (z5_b.Checked)
                        {
                            answer += "B";
                            answer5 += "B";
                            countflag++;
                        }
                        if (z5_c.Checked)
                        {
                            answer += "C";
                            answer5 += "C";
                            countflag++;
                        }
                        if (z5_d.Checked)
                        {
                            answer += "D";
                            answer5 += "D";
                            countflag++;
                        }
                        if (z5_e.Checked)
                        {
                            answer += "E";
                            answer5 += "E";
                            countflag++;
                        }
                        if (z5_f.Checked)
                        {
                            answer += "F";
                            answer5 += "F";
                            countflag++;
                        }
                        if (z5_g.Checked)
                        {
                            answer += "G";
                            answer5 += "G";
                            countflag++;
                        }
                        if (z5_h.Checked)
                        {
                            answer += "H";
                            answer5 += "H";
                            countflag++;
                        }
                        if (z5_i.Checked)
                        {
                            answer += "I";
                            answer5 += "I";
                            countflag++;
                        }
                        if (z5_j.Checked)
                        {
                            answer += "J";
                            answer5 += "J";
                            countflag++;
                        }
                        if (z5_k.Checked)
                        {
                            answer += "K";
                            answer5 += "K";
                            countflag++;
                        }
                        if (z5_l.Checked)
                        {
                            answer += "L";
                            answer5 += "L";
                            countflag++;
                        }
                        if (z5_m.Checked)
                        {
                            answer += "M";
                            answer5 += "M";
                            countflag++;
                        }
                        if (z5_n.Checked)
                        {
                            answer += "N";
                            answer5 += "N";
                            countflag++;
                        }
                        if (z5_o.Checked)
                        {
                            answer += "O";
                            answer5 += "O";
                            countflag++;
                        }
                        if (z5_p.Checked)
                        {
                            answer += "P";
                            answer5 += "P";
                            countflag++;
                        }
                        if (z5_q.Checked)
                        {
                            answer += "Q";
                            answer5 += "Q";
                            countflag++;
                        }

                        if (countflag != 3)
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第5题必须选三个项目，不能提交') ;window.location.href = '#link5';</script>");

                            return;
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第5题没有作答，不能提交') ;window.location.href = '#link5';</script>");

                        return;
                    }

                    string answer51 = answer5.Substring(0,1);
                    string answer52 = answer5.Substring(1, 1);
                    string answer53 = answer5.Substring(2, 1);

                    if ((answer4.Contains(answer51)) || (answer4.Contains(answer52)) || (answer4.Contains(answer53)))
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第5题不能选择第4题所选的项目，不能提交') ;window.location.href = '#link5';</script>");

                        return;
                    }

                    if (z6_a.Checked || z6_b.Checked || z6_c.Checked || z6_d.Checked || z6_e.Checked)
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
                        if (z6_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第6题没有作答，不能提交') ;window.location.href = '#link6';</script>");

                        return;
                    }
                    if (z7_a.Checked || z7_b.Checked || z7_c.Checked || z7_d.Checked || z7_e.Checked)
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
                        if (z7_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第7题没有作答，不能提交') ;window.location.href = '#link7';</script>");

                        return;
                    }

                    if (z8_a.Checked || z8_b.Checked || z8_c.Checked || z8_d.Checked || z8_e.Checked)
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
                        if (z8_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第8题没有作答，不能提交') ;window.location.href = '#link8';</script>");

                        return;
                    }

                    if (z9_a.Checked || z9_b.Checked || z9_c.Checked || z9_d.Checked || z9_e.Checked)
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
                        if (z9_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第9题没有作答，不能提交') ;window.location.href = '#link9';</script>");

                        return;
                    }


                    if (z10_a.Checked || z10_b.Checked || z10_c.Checked || z10_d.Checked || z10_e.Checked)
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
                        if (z10_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第10题没有作答，不能提交') ;window.location.href = '#link10';</script>");

                        return;
                    }

                    if (z11_a.Checked || z11_b.Checked)
                    {
                        if (z11_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z11_b.Checked)
                        {
                            answer += "B";
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第11题没有作答，不能提交') ;window.location.href = '#link11';</script>");

                        return;
                    }

                    if (z12_a.Checked || z12_b.Checked)
                    {
                        if (z12_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z12_b.Checked)
                        {
                            answer += "B";
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第12题没有作答，不能提交') ;window.location.href = '#link12';</script>");

                        return;
                    }

                    if (z13_a.Checked || z13_b.Checked)
                    {
                        if (z13_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z13_b.Checked)
                        {
                            answer += "B";
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第13题没有作答，不能提交') ;window.location.href = '#link13';</script>");

                        return;
                    }

                    if (z14_a.Checked || z14_b.Checked)
                    {
                        if (z14_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z14_b.Checked)
                        {
                            answer += "B";
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第14题没有作答，不能提交') ;window.location.href = '#link14';</script>");

                        return;
                    }

                    if (z15_a.Checked || z15_b.Checked)
                    {
                        if (z15_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z15_b.Checked)
                        {
                            answer += "B";
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第15题没有作答，不能提交') ;window.location.href = '#link15';</script>");

                        return;
                    }


                    if (z16_a.Checked || z16_b.Checked || z16_c.Checked || z16_d.Checked || z16_e.Checked)
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
                        if (z16_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第16题没有作答，不能提交') ;window.location.href = '#link16';</script>");

                        return;
                    }

                    if (z17_a.Checked || z17_b.Checked || z17_c.Checked || z17_d.Checked || z17_e.Checked)
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
                        if (z17_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第17题没有作答，不能提交') ;window.location.href = '#link17';</script>");

                        return;
                    }

                    if (z18_a.Checked || z18_b.Checked || z18_c.Checked || z18_d.Checked || z18_e.Checked)
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
                        if (z18_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第18题没有作答，不能提交') ;window.location.href = '#link18';</script>");

                        return;
                    }


                    if (z19_a.Checked || z19_b.Checked || z19_c.Checked || z19_d.Checked || z19_e.Checked)
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
                        if (z19_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第19题没有作答，不能提交') ;window.location.href = '#link19';</script>");

                        return;
                    }
                    if (z20_a.Checked || z20_b.Checked || z20_c.Checked || z20_d.Checked || z20_e.Checked)
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
                        if (z20_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第20题没有作答，不能提交') ;window.location.href = '#link20';</script>");

                        return;
                    }

                    if (z21_a.Checked || z21_b.Checked || z21_c.Checked || z21_d.Checked || z21_e.Checked)
                    {
                        if (z21_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z21_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z21_c.Checked)
                        {
                            answer += "C";
                        }
                        if (z21_d.Checked)
                        {
                            answer += "D";
                        }
                        if (z21_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第21题没有作答，不能提交') ;window.location.href = '#link21';</script>");

                        return;
                    }

                    if (z22_a.Checked || z22_b.Checked)
                    {
                        if (z22_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z22_b.Checked)
                        {
                            answer += "B";
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第22题没有作答，不能提交') ;window.location.href = '#link22';</script>");

                        return;
                    }

                    if (z23_a.Checked || z23_b.Checked)
                    {
                        if (z23_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z23_b.Checked)
                        {
                            answer += "B";
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第23题没有作答，不能提交') ;window.location.href = '#link23';</script>");

                        return;
                    }

                    if (z24_a.Checked || z24_b.Checked || z24_c.Checked || z24_d.Checked || z24_e.Checked)
                    {
                        if (z24_a.Checked)
                        {
                            answer += "A";
                        }
                        if (z24_b.Checked)
                        {
                            answer += "B";
                        }
                        if (z24_c.Checked)
                        {
                            answer += "C";
                        }
                        if (z24_d.Checked)
                        {
                            answer += "D";
                        }
                        if (z24_e.Checked)
                        {
                            answer += "E";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('第24题没有作答，不能提交') ;window.location.href = '#link24';</script>");

                        return;
                    }


                    text = yijian.Value.ToString().Trim();


                }

                using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                {
                    conn.Open();
                    OracleCommand cmd = conn.CreateCommand();
                    OracleTransaction tran = conn.BeginTransaction();
                    try
                    {
                        string sql = "MERGE INTO WEIXIN_DVOTE_DETAIL A  USING (SELECT COUNT(*) CO FROM WEIXIN_DVOTE_DETAIL WHERE PID='1' AND WEIXINID='" + staffid.Text + "' ) B ON (B.CO<>0 )     WHEN NOT MATCHED THEN INSERT  (PID,WEIXINID,DVOTE,DTEXT)VALUES('1','" + staffid.Text + "','" + answer + "','"+text+"')";
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        int result = cmd.ExecuteNonQuery();
                        tran.Commit();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交成功。') ;window.location.href = '#link27';</script>");
                        Iniddis();
                        Label16.Text = "(已参与)";
                        Label16.ForeColor = Color.Green;
                        Label68.Text = yijian.Value.Length.ToString();
                        Button1.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('提交失败，稍后重试。') ;window.location.href = '#link26';</script>");

                    }
                }

            }


        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (z1_a.Checked)
            {
                nextdiv.Visible = true;
                Label68.Text = yijian.Value.Length.ToString();
            }
            else
            {
                nextdiv.Visible = false;
            }
        }
    }
}