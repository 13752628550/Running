using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

namespace WeiXinCqe.Weixin.rewardpunishment
{
    public partial class RewardPunishment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["newstaffid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxba0960da7da41224&redirect_uri=http://wechat.fortest.ren/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status5#wechat_redirect");
                }
                else
                {
                    staffid.Text = Request.Cookies["staffid"].Value.ToString().Trim();
                    newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    deviceid.Text = "微信客户端:" + Request.Cookies["deviceid"].Value.ToString().Trim();
                    staffname.Text = Server.UrlDecode(Request.Cookies["staffname"].Value.ToString().Trim());

                    nowstaffid.Text = newstaffid.Text;//本来想判断来着
                    Hidden1.Value = "升格评定";                  
                    ImageButton1_Click(null, null);
                }
                //staffid.Text = "023980";
                //newstaffid.Text = "092156";
                //Hidden1.Value = "升格评定";
                //ImageButton1_Click(null, null);
            }

        }

        private void Initgeren()
        {
            try
            {
                string sql = "SELECT TO_DATE(E_DATE||'-01-01','YYYY-MM-DD') AS YYYYMMDD,TOPDEPTNAME,E_DATE,STAFFID,EVALUATE FROM STAFF_EVALUATE  WHERE E_TYPE='升格' AND STATUS ='0' AND STAFFID='" + newstaffid.Text.ToString().Trim() + "' ";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = sql + "  UNION ALL SELECT TO_DATE(E_DATE||'-01-01','YYYY-MM-DD') AS YYYYMMDD,TOPDEPTNAME,E_DATE,STAFFID,EVALUATE FROM STAFF_EVALUATE  WHERE E_TYPE='升格' AND STATUS ='0' AND STAFFID='" + staffid.Text.ToString().Trim() + "' AND E_DATE NOT IN (SELECT  E_DATE  FROM STAFF_EVALUATE  WHERE E_TYPE='升格' AND STATUS ='0' AND STAFFID='"+newstaffid.Text.ToString().Trim()+"' )  ";

                }
                sql = sql + "    ORDER BY YYYYMMDD DESC";
                DataTable dt = OracleOperateHelp.getDataTable(sql);

                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    else
                    {
                        GridView1.EmptyDataText = "没有升格评定记录";
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }

               

            }
            catch
            {
                GridView1.EmptyDataText = "网络错误，稍后重试";
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }
        private void Initgongzuo()
        {

            try
            {
                string sql = "SELECT TO_DATE(E_DATE||'-01','YYYY-MM-DD') AS YYYYMMDD,TOPDEPTNAME,E_DATE,STAFFID,EVALUATE FROM STAFF_EVALUATE  WHERE E_TYPE='奖金' AND STATUS ='0' AND STAFFID='" + newstaffid.Text.ToString().Trim() + "' ";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = sql + "  UNION ALL SELECT TO_DATE(E_DATE||'-01','YYYY-MM-DD') AS YYYYMMDD,TOPDEPTNAME,E_DATE,STAFFID,EVALUATE FROM STAFF_EVALUATE  WHERE E_TYPE='奖金' AND STATUS ='0' AND STAFFID='" + staffid.Text.ToString().Trim() + "' AND E_DATE NOT IN (SELECT  E_DATE  FROM STAFF_EVALUATE  WHERE E_TYPE='奖金' AND STATUS ='0' AND STAFFID='" + newstaffid.Text.ToString().Trim() + "' )  ";

                }
                sql = sql + "    ORDER BY YYYYMMDD DESC";
                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }
                else
                {
                    GridView2.EmptyDataText = "没有奖金评定记录";
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }



            }
            catch
            {
                GridView2.EmptyDataText = "网络错误，稍后重试";
                GridView2.DataSource = null;
                GridView2.DataBind();
            }

        }
        private void Initlianluo()
        {
            try
            {
                string sql = " SELECT  STAFFID,SMALLTYPE, REASON, TO_CHAR(EFFECTDATE,'YYYY-MM-DD') AS EFFECTDATE,TOPDEPTNAME   FROM STAFF_REWARDS_PUNISHMENT   WHERE BIGTYPE='奖励' AND STATUS !='-2' AND STAFFID='" + newstaffid.Text.ToString().Trim() + "' ";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = sql + "  UNION ALL  SELECT  STAFFID,SMALLTYPE, REASON,TO_CHAR(EFFECTDATE,'YYYY-MM-DD') AS EFFECTDATE,TOPDEPTNAME   FROM STAFF_REWARDS_PUNISHMENT   WHERE BIGTYPE='奖励' AND STATUS !='-2' AND STAFFID ='" + staffid.Text.ToString().Trim() + "'  ";

                }
                sql = sql + "    ORDER BY EFFECTDATE DESC";
                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    GridView3.DataSource = dt;
                    GridView3.DataBind();
                }
                else
                {
                    GridView3.EmptyDataText = "没有奖励记录,努力争取！！！";
                    GridView3.DataSource = dt;
                    GridView3.DataBind();
                }



            }
            catch
            {
                GridView3.EmptyDataText = "网络错误，稍后重试";
                GridView3.DataSource = null;
                GridView3.DataBind();
            }
        }
        private void Initnianjia()
        {
            try
            {
                string sql = " SELECT  STAFFID,SMALLTYPE, REASON, TO_CHAR(EFFECTDATE,'YYYY-MM-DD') AS EFFECTDATE,TOPDEPTNAME   FROM STAFF_REWARDS_PUNISHMENT   WHERE BIGTYPE='惩罚' AND STATUS !='-2' AND STAFFID='" + newstaffid.Text.ToString().Trim() + "' ";

                if (newstaffid.Text.ToString().Trim() != staffid.Text.ToString().Trim())
                {
                    sql = sql + "  UNION ALL  SELECT  STAFFID,SMALLTYPE, REASON,TO_CHAR(EFFECTDATE,'YYYY-MM-DD') AS EFFECTDATE,TOPDEPTNAME   FROM STAFF_REWARDS_PUNISHMENT   WHERE BIGTYPE='惩罚' AND STATUS !='-2' AND STAFFID ='" + staffid.Text.ToString().Trim() + "'  ";

                }
                sql = sql + "    ORDER BY EFFECTDATE DESC";
                DataTable dt = OracleOperateHelp.getDataTable(sql);

                if (dt.Rows.Count > 0)
                {
                    GridView4.DataSource = dt;
                    GridView4.DataBind();
                }
                else
                {
                    GridView4.EmptyDataText = "没有惩罚记录,继续保持！！！";
                    GridView4.DataSource = dt;
                    GridView4.DataBind();
                }



            }
            catch
            {
                GridView3.EmptyDataText = "网络错误，稍后重试";
                GridView3.DataSource = null;
                GridView3.DataBind();
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Labeltitle.Text = Hidden1.Value.ToString().Trim();
            switch (Labeltitle.Text)
            {
                case "升格评定":
                    divlabel1.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                     divgongzuo.Visible = false;
                    divjiben.Visible = true;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    Initgeren();
                    break;
                case "奖金评定":
                    divlabel2.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = true;
                    divjiben.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    Initgongzuo();
                    break;
                case "奖励":
                    divlabel3.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divlianluo.Visible = true;
                    divnianji.Visible = false;
                    Initlianluo();
                    break;
                case "惩罚":
                    divlabel4.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = true;
                    Initnianjia();
                    break;

              
                default:
                    divlabel1.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");            
                    divgongzuo.Visible = false;
                    divjiben.Visible = true;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    Initgeren();
                    break;
            }

        }
        public void chang()
        {
            Labeltitle.Text = Hidden1.Value.ToString().Trim();
        }


   
  
       
    }
}