using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WeiXinCqe;
using System.Data.OracleClient;

namespace WebApplication7
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["newstaffid"] == null || Request.Cookies["cqe"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww4119ac66ab8de522&redirect_uri=https://ctewechat.mitsumi.com.cn/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&state=status4#wechat_redirect");
                }
                else
                {
                    //if (Request.Cookies["cqe"].Value.ToString().Trim() == "2")
                    //{
                    //    Response.Redirect("~/Weixin/error/NoRight.aspx");
                    //}
                    //else
                    //{
                    staffid.Text = Request.Cookies["staffid"].Value.ToString().Trim();
                    newstaffid.Text = Request.Cookies["newstaffid"].Value.ToString().Trim();
                    deviceid.Text = "微信客户端:" + Request.Cookies["deviceid"].Value.ToString().Trim();
                    staffname.Text = Server.UrlDecode(Request.Cookies["staffname"].Value.ToString().Trim());

                    nowstaffid.Text = newstaffid.Text;//本来想判断来着
                    Hidden1.Value = "个人信息";
                    if (Request["userinfo"] != null)
                    {
                        Hidden1.Value = Server.UrlDecode(Request["userinfo"].ToString().Trim());
                    }
                    ImageButton1_Click(null, null);
                    // }
                }
                //staffid.Text = "171601";
                //newstaffid.Text = "171601";
                //Hidden1.Value = "个人信息";
                //ImageButton1_Click(null, null);
            }
       
        }

        private void Initgeren()
        {
            DataTable dt = OracleOperateHelp.getDataTable(" SELECT NAME,SFZ,SEX,MARRIAGE,TO_CHAR(BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY,HUJI,NATION,HUJILEIBIE FROM V_STAFF_INFO_ALL  WHERE  ID ='" + newstaffid.Text.ToString().Trim() + "'");
            if (dt.Rows.Count > 0)
            {

                DataRow dr = dt.Rows[0];
                Label_JiBen_Birthday.Text = dr["BIRTHDAY"].ToString().Trim();
                Label_JiBen_HuJi.Text = dr["HUJI"].ToString().Trim();
                Label_JiBen_HuJILeiBie.Text = dr["HUJILEIBIE"].ToString().Trim();
                string marriage = dr["MARRIAGE"].ToString().Trim();
                Label_JiBen_Name.Text = dr["NAME"].ToString().Trim();
                Label_JiBen_Name.ForeColor = System.Drawing.Color.Black;
                Label_JiBen_Nation.Text = dr["NATION"].ToString().Trim();
                Label_JiBen_Sex.Text = dr["SEX"].ToString().Trim();
                Label_JiBen_Sfz.Text = dr["SFZ"].ToString().Trim();
                Label_JiBen_Marriage.Text = marriage;
                selectM.Disabled = false;
                switch (marriage)
                {
                    case "未婚": selectM.SelectedIndex = 0; break;
                    case "已婚": selectM.SelectedIndex = 1; break;
                    case "离婚": selectM.SelectedIndex = 2; break;
                    case "丧偶": selectM.SelectedIndex = 3; break;
                    default: selectM.SelectedIndex = 4; break;
                }
                Label_JiBen_Button.Visible = true;
            }
            else
            {
                Label_JiBen_Marriage.Text = "";
                Label_JiBen_Birthday.Text = "";
                Label_JiBen_HuJi.Text = "";
                Label_JiBen_HuJILeiBie.Text = "";
                selectM.SelectedIndex = 4;
                selectM.Disabled = true;
                Label_JiBen_Name.Text = "未取到数据,稍后重试";
                Label_JiBen_Name.ForeColor = System.Drawing.Color.Red;
                Label_JiBen_Nation.Text = "";
                Label_JiBen_Sex.Text = "";
                Label_JiBen_Sfz.Text = "";
                Label_JiBen_Button.Visible = false;
            }
            dt = OracleOperateHelp.getDataTable(" SELECT WELFARE FROM BASE_BIRTHDAY_WELFARE  WHERE  STAFFID ='" + newstaffid.Text.ToString().Trim() + "'");
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string welfare = dr["WELFARE"].ToString().Trim();
                selectB.Disabled = false;
                Label_JiBen_Welfare.Text = dr["WELFARE"].ToString().Trim();
                switch (welfare)
                {
                    case "丹香蛋糕券": selectB.SelectedIndex = 0; break;
                    case "丹香储值卡": selectB.SelectedIndex = 1; break;
                    default: selectB.SelectedIndex = 2; break;
                }
            }
            else
            {
                selectB.SelectedIndex = 2;
                Label_JiBen_Welfare.Text = "";
            }

            if (DateTime.Now.Day > 17)
            {
                dt = OracleOperateHelp.getDataTable(" SELECT 1 FROM BASE_BIRTHDAY_WELFARE_HIS  WHERE  STAFFID ='" + newstaffid.Text.ToString().Trim() + "' AND YYYYMM=TO_CHAR(sysdate+15,'YYYY-MM')");
                if (dt.Rows.Count > 0)
                {
                    selectB.Disabled = true;
                }
            }
        }
        private void Initgongzuo()
        {
            DataTable dt = OracleOperateHelp.getDataTable(" SELECT COMMUTE_TYPE,ID,TO_CHAR(DATE_IN,'YYYY-MM-DD') AS DATE_IN,TO_CHAR(DATE_TEST,'YYYY-MM-DD') AS DATE_TEST,RANK,HF,POST,TECH_POST,(NVL(OWM,0)+NVL(CQM_OWM,0))||'个月' AS OWM,TYPE1,TYPE2,CONTRACT_NUM,TO_CHAR(E_CONTRACT_DATE,'YYYY-MM-DD')  AS E_CONTRACT_DATE,TEL,TOPDEPTNAME,DEPTNAME,DEPTLONGNAME FROM V_STAFF_INFO_ALL    WHERE  ID ='" + newstaffid.Text.ToString().Trim() + "'");
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Label_GongZuo_Id.Text = dr["ID"].ToString().Trim();
                Label_GongZuo_In.Text = dr["DATE_IN"].ToString().Trim();
                Label_GongZuo_Test.Text = dr["DATE_TEST"].ToString().Trim();
                Label_GongZuo_Rank.Text = dr["RANK"].ToString().Trim();
                Label_GongZuo_Hf.Text = dr["HF"].ToString().Trim();
                Label_GongZuo_Post.Text = dr["POST"].ToString().Trim();
                Label_GongZuo_TechPost.Text = dr["TECH_POST"].ToString().Trim();
                Label_GongZuo_Old.Text = dr["OWM"].ToString().Trim();
                Label_GongZuo_Type1.Text = dr["TYPE1"].ToString().Trim();
                Label_GongZuo_Type2.Text = dr["TYPE2"].ToString().Trim();
                Label_GongZuo_Contract_Date.Text = dr["E_CONTRACT_DATE"].ToString().Trim();
                Label_GongZuo_Contract.Text = dr["CONTRACT_NUM"].ToString().Trim()+"次";
                Label_GongZuo_Communication.Text = dr["COMMUTE_TYPE"].ToString().Trim();
                Label_GongZuo_Tel.Text = dr["TEL"].ToString().Trim();
                TextBox_GongZuo_Tel.Value = dr["TEL"].ToString().Trim();
                TextBox_GongZuo_Tel.Visible = true;
                Label_GongZuo_TopDeptName.Text = dr["TOPDEPTNAME"].ToString().Trim();
                Label_GongZuo_DeptName.Text = dr["DEPTNAME"].ToString().Trim();
                Label_GongZuo_DeptLongName.Text = dr["DEPTLONGNAME"].ToString().Trim();
                Label_GongZuo_Button.Visible = true;
                Label_GongZuo_Id.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                Label_GongZuo_Id.Text = "未取到数据,稍后重试";
                Label_GongZuo_Id.ForeColor = System.Drawing.Color.Red;
                Label_GongZuo_In.Text ="";
                Label_GongZuo_Test.Text = "";
                Label_GongZuo_Rank.Text = "";
                Label_GongZuo_Hf.Text = "";
                Label_GongZuo_Post.Text = "";
                Label_GongZuo_TechPost.Text = "";
                Label_GongZuo_Old.Text = "";
                Label_GongZuo_Type1.Text = "";
                Label_GongZuo_Type2.Text = "";
                Label_GongZuo_Contract_Date.Text = "";
                Label_GongZuo_Contract.Text = "";
                Label_GongZuo_Tel.Text = "";
                TextBox_GongZuo_Tel.Value = "";
                Label_GongZuo_TopDeptName.Text = "";
                Label_GongZuo_DeptName.Text = "";
                TextBox_GongZuo_Tel.Visible = false;
                Label_GongZuo_DeptLongName.Text = "";
                Label_GongZuo_Communication.Text ="";
                Label_GongZuo_Button.Visible = false;
 
            }

        }
        private void Initlianluo()
        {
            DataTable dt = OracleOperateHelp.getDataTable("  SELECT  MOBILE,ADDRESS,HOME_CALL,EMERGENCY_CALL,EMERGENCY_CALL_TO  FROM V_STAFF_INFO_ALL   WHERE  ID ='" + newstaffid.Text.ToString().Trim() + "'");
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Label_LianLuo_Home_Tel.Text = dr["HOME_CALL"].ToString().Trim();
                Label_LianLuo_Address.Text = dr["ADDRESS"].ToString().Trim();
                Label_LianLuo_E_Tel.Text = dr["EMERGENCY_CALL"].ToString().Trim();
                Label_LianLuo_Mobile.Text = dr["MOBILE"].ToString().Trim();
                Label_LianLuo_E_To.Text = dr["EMERGENCY_CALL_TO"].ToString().Trim();
                TextBox_LianLuo_Home_Tel.Value = dr["HOME_CALL"].ToString().Trim();
                TextBox_LianLuo_Address.Value = dr["ADDRESS"].ToString().Trim();
                TextBox_LianLuo_E_Tel.Value = dr["EMERGENCY_CALL"].ToString().Trim();
                TextBox_LianLuo_Mobile.Value = dr["MOBILE"].ToString().Trim();
                TextBox_LianLuo_E_To.Value = dr["EMERGENCY_CALL_TO"].ToString().Trim();
                TextBox_LianLuo_Home_Tel.Visible = true;
                TextBox_LianLuo_Address.Visible = true;
                TextBox_LianLuo_E_Tel.Visible = true;
                TextBox_LianLuo_Mobile.Visible = true;
                TextBox_LianLuo_E_To.Visible = true;
                Label_LianLuo_Mobile.Visible = false;
                Label_LianLuo_Button.Visible = true;
            }
            else
            {
                Label_LianLuo_Home_Tel.Text ="";
                Label_LianLuo_Address.Text = "";
                Label_LianLuo_E_Tel.Text = "";
                Label_LianLuo_Mobile.Text = "未取到数据,稍后重试";
                Label_LianLuo_Mobile.ForeColor = System.Drawing.Color.Red;
                Label_LianLuo_Mobile.Visible = true;
                Label_LianLuo_E_To.Text = "";
                TextBox_LianLuo_Home_Tel.Value = "";
                TextBox_LianLuo_Address.Value = "";
                TextBox_LianLuo_E_Tel.Value = "";
                TextBox_LianLuo_Mobile.Value = "";
                TextBox_LianLuo_E_To.Value = "";
                TextBox_LianLuo_Home_Tel.Visible = false;
                TextBox_LianLuo_Address.Visible = false;
                TextBox_LianLuo_E_Tel.Visible = false;
                TextBox_LianLuo_Mobile.Visible = false;
                TextBox_LianLuo_E_To.Visible = false;
                Label_LianLuo_Button.Visible = false;
            }
        }
        private void Initnianjia()
        {
            DataTable dt = OracleOperateHelp.getDataTable(" SELECT YYYY,GL1 AS GL,NJ1 AS NJ,PNJ1 AS PNJ,NJ_MEMO AS NJ_MEMO FROM STAFF_NJ  WHERE YYYY=( SELECT   SUBSTR(YYYYMM,0,4) AS YYYY     FROM   SLR_INTERVAL    WHERE   BEGIN_DATE <= TO_DATE (TO_CHAR(SYSDATE,'YYYY-MM-DD'), 'YYYY-MM-DD')            AND TO_DATE (TO_CHAR(SYSDATE,'YYYY-MM-DD'), 'YYYY-MM-DD') <= END_DATE) AND STAFFID  ='" + newstaffid.Text.ToString().Trim() + "'");
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Label_NianJia_Nj.Text = dr["NJ"].ToString().Trim()+"天";
                Label_NianJia_Memo.Text = dr["NJ_MEMO"].ToString().Trim();
                Label_NianJia_Pnj.Text = dr["PNJ"].ToString().Trim() + "天";
                Label_NianJia_Yyyy.Text = dr["YYYY"].ToString().Trim();
                Label_NianJia_Gl.Text = dr["GL"].ToString().Trim() + "年";
                Label_NianJia_Yyyy.ForeColor = System.Drawing.Color.Black;
                LinkButton_NianJian.Visible = true;
            }
            else
            {
                Label_NianJia_Nj.Text = "";
                Label_NianJia_Memo.Text ="";
                Label_NianJia_Pnj.Text = "";
                Label_NianJia_Yyyy.Text = "未取到数据,稍后重试";
                Label_NianJia_Gl.Text = "";
                Label_NianJia_Yyyy.ForeColor = System.Drawing.Color.Red;
                LinkButton_NianJian.Visible = false;
            }
        }
        private void Initxueli()
        {
            DataTable dt = OracleOperateHelp.getDataTable(" SELECT SCHOOL,TO_CHAR(G_DATE,'YYYY-MM-DD') AS G_DATE,ACADEMIC,DEGREE,MAJOR,ENGLISH,JAPANESE FROM V_STAFF_INFO_ALL  WHERE  ID  ='" + newstaffid.Text.ToString().Trim() + "'");
           
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Label_XueLi_School.Text = dr["SCHOOL"].ToString().Trim();
                Label_XueLi_G_Date.Text = dr["G_DATE"].ToString().Trim();
                Label_XueLi_Academic.Text = dr["ACADEMIC"].ToString().Trim();
                Label_XueLi_Degree.Text = dr["DEGREE"].ToString().Trim();
                Label_XueLi_English.Text = dr["ENGLISH"].ToString().Trim();
                Label_XueLi_Japanese.Text = dr["JAPANESE"].ToString().Trim();
                Label_XueLi_Academic.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                Label_XueLi_School.Text = "";
                Label_XueLi_G_Date.Text = "";
                Label_XueLi_Degree.Text = "";
                Label_XueLi_English.Text = "";
                Label_XueLi_Japanese.Text = "";
                Label_XueLi_Academic.Text = "未取到数据,稍后重试";
                Label_XueLi_Academic.ForeColor = System.Drawing.Color.Red;
            }
        }
        private void Initzhanghao()
        {
            DataTable dt = OracleOperateHelp.getDataTable(" SELECT GJJ_NO,SB_NO, SLR_NO,TO_CHAR(B.LOCKDATE,'YYYY-MM-DD') AS LOCKDATE  FROM V_STAFF_INFO_ALL A  LEFT JOIN SLR_NO_LOCK B ON A.SFZ=B.SFZ AND B.LOCKDATE >SYSDATE  WHERE  A.ID ='" + newstaffid.Text.ToString().Trim() + "'");
           
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Label_ZhangHao_Gjj.Text = dr["GJJ_NO"].ToString().Trim();
                Label_ZhangHao_Sb.Text = dr["SB_NO"].ToString().Trim();
                Label_ZhangHao_Slr.Text = dr["SLR_NO"].ToString().Trim();
                TextBox_ZhangHao_Slr.Value = dr["SLR_NO"].ToString().Trim();
            //    TextBox_ZhangHao_Slr.Visible = true;
                Label_ZhangHao_Gjj.ForeColor = System.Drawing.Color.Black;
                //Label_ZhangHao_Button.Visible = true;

                if (dr["LOCKDATE"].ToString().Trim() != "")
                {
                    Label_ZhangHao_Button.Visible = false;
                    TextBox_ZhangHao_Slr.Visible = false;
                    Label_ZhangHao_Slr.Visible = true;
                    Label_S.Visible = true;
                    Label_S_T.Visible = false;
                }
                else
                {
                    Label_ZhangHao_Button.Visible = true;
                    TextBox_ZhangHao_Slr.Visible = true;
                    Label_ZhangHao_Slr.Visible = false;
                    Label_S.Visible = false;
                    Label_S_T.Visible = true;
                }
            }
            else
            {
                Label_ZhangHao_Sb.Text ="";
                Label_ZhangHao_Slr.Text ="";
                Label_ZhangHao_Gjj.Text = "未取到数据,稍后重试";
                TextBox_ZhangHao_Slr.Visible = false;
                Label_ZhangHao_Gjj.ForeColor = System.Drawing.Color.Red;
                Label_ZhangHao_Button.Visible = false;
                Label_S.Visible = true;
                Label_S_T.Visible = false;
            }
        }
        private void Initjishu()
        {
            DataTable dt = OracleOperateHelp.getDataTable(" SELECT BASE_PAY,BASE_PAY_JS,SB_INDEX,GJJ_INDEX FROM V_STAFF_INFO_ALL   WHERE  ID ='" + newstaffid.Text.ToString().Trim() + "'");

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Label_JiShu_BasePay.Text = dr["BASE_PAY"].ToString().Trim();
                Label_JiShu_BasePayJs.Text = dr["BASE_PAY_JS"].ToString().Trim();
                Label_JiShu_SbIndex.Text = dr["SB_INDEX"].ToString().Trim();
                Label_JiShu_GjjIndex.Text = dr["GJJ_INDEX"].ToString().Trim();
                Label_JiShu_BasePay.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                Label_JiShu_BasePayJs.Text = "";
                Label_JiShu_SbIndex.Text = "";
                Label_JiShu_GjjIndex.Text ="";
                Label_JiShu_BasePay.Text = "未取到数据,稍后重试";               
                Label_JiShu_BasePay.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Labeltitle.Text = Hidden1.Value.ToString().Trim();
            switch (Labeltitle.Text)
            {
                case "个人信息":
                    divlabel1.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divlabel5.Attributes.Add("class", "weui_navbar_item");
                    divlabel6.Attributes.Add("class", "weui_navbar_item");
                    divlabel7.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = true;
                    divjishu.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divxueli.Visible = false;
                    divzhanghao.Visible = false;
                    Initgeren();
                    break;
                case "工作信息":
                    divlabel2.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divlabel5.Attributes.Add("class", "weui_navbar_item");
                    divlabel6.Attributes.Add("class", "weui_navbar_item");
                    divlabel7.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = true;
                    divjiben.Visible = false;
                    divjishu.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divxueli.Visible = false;
                    divzhanghao.Visible = false;
                    Initgongzuo();
                    break;
                case "联络信息":
                    divlabel3.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divlabel5.Attributes.Add("class", "weui_navbar_item");
                    divlabel6.Attributes.Add("class", "weui_navbar_item");
                    divlabel7.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divjishu.Visible = false;
                    divlianluo.Visible = true;
                    divnianji.Visible = false;
                    divxueli.Visible = false;
                    divzhanghao.Visible = false;
                    Initlianluo();
                    break;
                case "年假信息":
                    divlabel4.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel5.Attributes.Add("class", "weui_navbar_item");
                    divlabel6.Attributes.Add("class", "weui_navbar_item");
                    divlabel7.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divjishu.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = true;
                    divxueli.Visible = false;
                    divzhanghao.Visible = false;
                    Initnianjia();
                    break;
                case "学历信息":
                    divlabel5.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel6.Attributes.Add("class", "weui_navbar_item");
                    divlabel7.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divjishu.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divxueli.Visible = true;
                    divzhanghao.Visible = false;
                    Initxueli();
                    break;
                case "账号信息":
                    divlabel6.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divlabel5.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divlabel7.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divjishu.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divxueli.Visible = false;
                    divzhanghao.Visible = true;
                    Initzhanghao();
                    break;
                case "基数信息":
                    divlabel7.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divlabel5.Attributes.Add("class", "weui_navbar_item");
                    divlabel6.Attributes.Add("class", "weui_navbar_item");
                    divlabel1.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = false;
                    divjishu.Visible = true;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divxueli.Visible = false;
                    divzhanghao.Visible = false;
                    Initjishu();
                    break;
                default:
                    divlabel1.Attributes.Add("class", "weui_navbar_item weui_bar_item_on");
                    divlabel2.Attributes.Add("class", "weui_navbar_item");
                    divlabel3.Attributes.Add("class", "weui_navbar_item");
                    divlabel4.Attributes.Add("class", "weui_navbar_item");
                    divlabel5.Attributes.Add("class", "weui_navbar_item");
                    divlabel6.Attributes.Add("class", "weui_navbar_item");
                    divgongzuo.Visible = false;
                    divjiben.Visible = true;
                    divjishu.Visible = false;
                    divlianluo.Visible = false;
                    divnianji.Visible = false;
                    divxueli.Visible = false;
                    divzhanghao.Visible = false;
                    Initgeren();
                    break;
            }
            
        }
        public void chang()
        {
            Labeltitle.Text = Hidden1.Value.ToString().Trim();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            selectM.SelectedIndex = 1;
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label_JiBen_Name.Text = selectM.Items[selectM.SelectedIndex].Value.ToString();
        }

        protected void Label_JiBen_Button_Click(object sender, EventArgs e)
        {//保存婚姻
            //---2015/5/21 HP修改新增生日福利修改

            if (Label_JiBen_Marriage.Text == selectM.Items[selectM.SelectedIndex].Value.ToString()&& Label_JiBen_Welfare.Text == selectB.Items[selectB.SelectedIndex].Value.ToString())
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('没有修改婚姻状态或生日福利，不需要保存') ;</script>");
                selectM.Focus();
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
                       
                        cmd.Transaction = tran;
                        cmd.CommandType = CommandType.Text;
                        if (Label_JiBen_Marriage.Text != selectM.Items[selectM.SelectedIndex].Value.ToString())
                        {
                            string MARRIAGE = selectM.Items[selectM.SelectedIndex].Value.ToString();
                            string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  ' 微信编辑人员(" + newstaffid.Text.ToString().Trim() + ")基本信息:婚姻状况',MARRIAGE,'" + MARRIAGE + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                            string sqlhr = "UPDATE BASE_HR SET  MARRIAGE ='" + MARRIAGE + "'  WHERE ID =( SELECT SFZ FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "')";//编辑人员基本信息表的婚姻状况
                            string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET MARRIAGE ='" + MARRIAGE + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的婚姻状况
                            cmd.CommandText = insertlog;//日志
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sqlhr;//基本信息
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sqlstaffbak;//离职人员
                            cmd.ExecuteNonQuery();
                            Label_JiBen_Marriage.Text = selectM.Items[selectM.SelectedIndex].Value.ToString();
                        }
                        if (Label_JiBen_Welfare.Text != selectB.Items[selectB.SelectedIndex].Value.ToString())
                        {
                            string Welfare = selectB.Items[selectB.SelectedIndex].Value.ToString();
                            if (Label_JiBen_Welfare.Text == "")
                            {
                                string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER) VALUES ( ' 微信编辑人员(" + newstaffid.Text.ToString().Trim() + ")基本信息:生日福利','','" + Welfare + "','" + newstaffid.Text.ToString().Trim() + "')" ;//更新操作日志
                                cmd.CommandText = insertlog;//日志
                                cmd.ExecuteNonQuery();
                                string updatewf = "INSERT INTO BASE_BIRTHDAY_WELFARE (STAFFID,WELFARE) VALUES('" + newstaffid.Text.ToString().Trim() + "','" + Welfare + "')";
                                cmd.CommandText = updatewf;//生日福利表
                                cmd.ExecuteNonQuery();
                                Label_JiBen_Welfare.Text = selectB.Items[selectB.SelectedIndex].Value.ToString();
                            }
                            else
                            {
                                if (string.IsNullOrEmpty( selectB.Items[selectB.SelectedIndex].Value.ToString()) )
                                {
                                    string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER) VALUES ( ' 微信编辑人员(" + newstaffid.Text.ToString().Trim() + ")基本信息:生日福利','"+ Label_JiBen_Welfare.Text + "','" + Welfare + "','" + newstaffid.Text.ToString().Trim() + "')";//更新操作日志
                                    cmd.CommandText = insertlog;//日志
                                    cmd.ExecuteNonQuery();
                                    string updatewf = "DELETE FROM BASE_BIRTHDAY_WELFARE WHERE STAFFID='" + newstaffid.Text.ToString().Trim() + "'";
                                    cmd.CommandText = updatewf;//生日福利表
                                    cmd.ExecuteNonQuery();
                                    Label_JiBen_Welfare.Text = selectB.Items[selectB.SelectedIndex].Value.ToString();
                                }
                                else
                                {
                                    string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER) VALUES ( ' 微信编辑人员(" + newstaffid.Text.ToString().Trim() + ")基本信息:生日福利','" + Label_JiBen_Welfare.Text + "','" + Welfare + "','" + newstaffid.Text.ToString().Trim() + "')";//更新操作日志
                                    cmd.CommandText = insertlog;//日志
                                    cmd.ExecuteNonQuery();
                                    string updatewf = "UPDATE BASE_BIRTHDAY_WELFARE SET  WELFARE='" + Welfare + "' WHERE STAFFID='" + newstaffid.Text.ToString().Trim() + "'";
                                    cmd.CommandText = updatewf;//生日福利表
                                    cmd.ExecuteNonQuery();
                                    Label_JiBen_Welfare.Text = selectB.Items[selectB.SelectedIndex].Value.ToString();
                                }

                            }
                        }
                        tran.Commit();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存成功。') ;</script>");


                    }
                    catch
                    {
                        tran.Rollback();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存失败,稍后重新保存。') ;</script>");


                    }
                }
                //---2015/5/21 HP修改新增生日福利修改end

            }
        }

        protected void Label_GongZuo_Button_Click(object sender, EventArgs e)
        {//保存办公电话
            if (Label_GongZuo_Tel.Text == TextBox_GongZuo_Tel.Value.ToString().Trim())
            {
                
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('没有修改办公电话，不需要保存') ;</script>");
                TextBox_GongZuo_Tel.Focus();  
            }
            else
            {
                bool flag = true;
                string tel = TextBox_GongZuo_Tel.Value.ToString().Trim();
             
                if (tel != "")
                {
                    if (!(System.Text.RegularExpressions.Regex.IsMatch(tel, @"^\d{3}$")))
       
                    {
                       Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('不是合法的办公电话(3位数字)') ;</script>");
                       TextBox_GongZuo_Tel.Focus();                       
                       flag = false;
                   }

                }
                if (flag)
                {
                    using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                    {
                        conn.Open();
                        OracleCommand cmd = conn.CreateCommand();
                        OracleTransaction tran = conn.BeginTransaction();
                        try
                        {

                            cmd.Transaction = tran;
                            cmd.CommandType = CommandType.Text;
                            string TEL = TextBox_GongZuo_Tel.Value.ToString().Trim();

                            string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  '微信编辑人员(" + newstaffid.Text.ToString().Trim() + ")基本信息:公司电话',TEL,'" + TEL + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                            string sqlstaff = "UPDATE BASE_STAFF  SET TEL ='" + TEL + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑在职人员表中的公司电话
                            string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET TEL ='" + TEL + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的公司电话
                            cmd.CommandText = insertlog;//日志
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sqlstaff;//在职人员
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sqlstaffbak;//离职人员
                            cmd.ExecuteNonQuery();
                            Label_GongZuo_Tel.Text = TextBox_GongZuo_Tel.Value.ToString().Trim();
                            tran.Commit();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('办公电话保存成功。') ;</script>");


                        }
                        catch
                        {
                            tran.Rollback();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('办公电话保存失败,稍后重新保存。') ;</script>");


                        }
                    }
                }

            }
        }

        protected void Label_LianLuo_Button_Click(object sender, EventArgs e)
        {//保存联络信息
            if ((Label_LianLuo_Mobile.Text == TextBox_LianLuo_Mobile.Value.ToString().Trim()) && (Label_LianLuo_Home_Tel.Text == TextBox_LianLuo_Home_Tel.Value.ToString().Trim()) && (Label_LianLuo_E_To.Text == TextBox_LianLuo_E_To.Value.ToString().Trim()) && (Label_LianLuo_E_Tel.Text == TextBox_LianLuo_E_Tel.Value.ToString().Trim()) && (Label_LianLuo_Address.Text == TextBox_LianLuo_Address.Value.ToString().Trim()))
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('没有修改联络信息，不需要保存') ;</script>");
                TextBox_LianLuo_Mobile.Focus();
            }
            else
            {
                bool flag1 = true;
                bool flag2 = true;
                bool flag3 = true;
                bool flag4 = true;
                bool flag5 = true;

                if (Label_LianLuo_Mobile.Text == TextBox_LianLuo_Mobile.Value.ToString().Trim())
                {//手机没有修改
                    flag1 = false;
                }
                else
                {
                    string strflag = TextBox_LianLuo_Mobile.Value.ToString().Trim();

                    if (strflag != "")
                    {
                        if (!(System.Text.RegularExpressions.Regex.IsMatch(strflag, @"^\d{11}$")))
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('不是合法的手机号(11位数字)') ;</script>");
                            TextBox_LianLuo_Mobile.Focus();
                            flag1 = false;
                            return;
                        }

                    }
                   
                }

                if (Label_LianLuo_Home_Tel.Text == TextBox_LianLuo_Home_Tel.Value.ToString().Trim())
                {//家庭电话没有修改
                    flag2 = false;
                }
                else
                {
                    string strflag = TextBox_LianLuo_Home_Tel.Value.ToString().Trim();

                    if (strflag != "")
                    {
                        if (!(System.Text.RegularExpressions.Regex.IsMatch(strflag, @"^\d+$")))
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('不是合法的家庭电话(区号电话号，纯数字)') ;</script>");
                            TextBox_LianLuo_Home_Tel.Focus();
                            flag2 = false;
                            return;
                        }

                    }

                }

                if (Label_LianLuo_E_To.Text == TextBox_LianLuo_E_To.Value.ToString().Trim())
                {//紧急联络人没有修改
                    flag3 = false;
                }

                if (Label_LianLuo_E_Tel.Text == TextBox_LianLuo_E_Tel.Value.ToString().Trim())
                {//紧急电话没有修改
                    flag4 = false;
                }
                else
                {
                    string strflag = TextBox_LianLuo_E_Tel.Value.ToString().Trim();

                    if (strflag != "")
                    {
                        if (!(System.Text.RegularExpressions.Regex.IsMatch(strflag, @"^\d+$")))
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('不是合法的家庭电话(区号电话号，纯数字)') ;</script>");
                            TextBox_LianLuo_E_Tel.Focus();
                            flag4 = false;
                            return;
                        }

                    }

                }

                if (Label_LianLuo_Address.Text == TextBox_LianLuo_Address.Value.ToString().Trim())
                {//地址没有修改
                    flag5 = false;
                }

                if (flag1 || flag2 || flag3 || flag4 || flag5)
                {
                    
                    using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                    {
                        conn.Open();
                        OracleCommand cmd = conn.CreateCommand();
                        OracleTransaction tran = conn.BeginTransaction();
                        try
                        {

                            cmd.Transaction = tran;
                            cmd.CommandType = CommandType.Text;

                            if (flag1)
                            {//手机修改了
                                string MOBILE = TextBox_LianLuo_Mobile.Value.ToString().Trim();
                                string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  ' 人员(" + newstaffid.Text.ToString().Trim() + ")基本信息编辑:手机号码',MOBILE,'" + MOBILE + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                                string sqlhr = "UPDATE BASE_HR SET  MOBILE ='" + MOBILE + "'  WHERE ID =( SELECT SFZ FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "')";//编辑人员基本信息表的手机能力
                                string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET MOBILE ='" + MOBILE + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的手机能力
                                cmd.CommandText = insertlog;//日志
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlhr;//基本信息
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlstaffbak;//离职人员
                                cmd.ExecuteNonQuery();
                            }
                            if (flag2)
                            {//家庭电话修改了
                                string HOME_CALL = TextBox_LianLuo_Home_Tel.Value.ToString().Trim();
                                string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  ' 人员(" + newstaffid.Text.ToString().Trim() + ")基本信息编辑:家庭电话',HOME_CALL,'" + HOME_CALL + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                                string sqlhr = "UPDATE BASE_HR SET  HOME_CALL ='" + HOME_CALL + "'  WHERE ID =( SELECT SFZ FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "')";//编辑人员基本信息表的家庭电话
                                string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET HOME_CALL ='" + HOME_CALL + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的家庭电话
                                cmd.CommandText = insertlog;//日志
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlhr;//基本信息
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlstaffbak;//离职人员
                                cmd.ExecuteNonQuery();
                            }
                            if (flag3)
                            {//紧急联络人修改了
                                string EMERGENCY_CALL_TO = TextBox_LianLuo_E_To.Value.ToString().Trim();
                                string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  ' 人员(" + newstaffid.Text.ToString().Trim() + ")基本信息编辑:紧急联络人',EMERGENCY_CALL_TO,'" + EMERGENCY_CALL_TO + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                                string sqlhr = "UPDATE BASE_HR SET  EMERGENCY_CALL_TO ='" + EMERGENCY_CALL_TO + "'  WHERE ID =( SELECT SFZ FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "')";//编辑人员基本信息表的紧急联络人
                                string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET EMERGENCY_CALL_TO ='" + EMERGENCY_CALL_TO + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的紧急联络人
                                cmd.CommandText = insertlog;//日志
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlhr;//基本信息
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlstaffbak;//离职人员
                                cmd.ExecuteNonQuery();
                            }
                            if (flag4)
                            {//紧急联络电话修改了
                                string EMERGENCY_CALL = TextBox_LianLuo_E_Tel.Value.ToString().Trim();
                                string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  ' 人员(" + newstaffid.Text.ToString().Trim() + ")基本信息编辑:紧急联络电话',EMERGENCY_CALL,'" + EMERGENCY_CALL + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                                string sqlhr = "UPDATE BASE_HR SET  EMERGENCY_CALL ='" + EMERGENCY_CALL + "'  WHERE ID =( SELECT SFZ FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "')";//编辑人员基本信息表的紧急联络电话
                                string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET EMERGENCY_CALL ='" + EMERGENCY_CALL + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的紧急联络电话
                                cmd.CommandText = insertlog;//日志
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlhr;//基本信息
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlstaffbak;//离职人员
                                cmd.ExecuteNonQuery();
                            }
                            if (flag5)
                            {//家庭住址修改了
                                string ADDRESS = TextBox_LianLuo_Address.Value.ToString().Trim();
                                string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  ' 人员(" + newstaffid.Text.ToString().Trim() + ")基本信息编辑:家庭住址',ADDRESS,'" + ADDRESS + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                                string sqlhr = "UPDATE BASE_HR SET  ADDRESS ='" + ADDRESS + "'  WHERE ID =( SELECT SFZ FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "')";//编辑人员基本信息表的家庭住址
                                string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET ADDRESS ='" + ADDRESS + "' WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的家庭住址
                                cmd.CommandText = insertlog;//日志
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlhr;//基本信息
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = sqlstaffbak;//离职人员
                                cmd.ExecuteNonQuery();
                            }
                            tran.Commit();
                            Label_LianLuo_Mobile.Text = TextBox_LianLuo_Mobile.Value.ToString().Trim();
                            Label_LianLuo_Home_Tel.Text = TextBox_LianLuo_Home_Tel.Value.ToString().Trim();
                            Label_LianLuo_E_To.Text = TextBox_LianLuo_E_To.Value.ToString().Trim();
                            Label_LianLuo_E_Tel.Text = TextBox_LianLuo_E_Tel.Value.ToString().Trim();
                            Label_LianLuo_Address.Text = TextBox_LianLuo_Address.Value.ToString().Trim();
         
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('联络信息保存成功。') ;</script>");


                        }
                        catch
                        {
                            tran.Rollback();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('联络信息保存失败,稍后重新保存。') ;</script>");


                        }
                    }
                }
            }
        }

        protected void Label_ZhangHao_Button_Click(object sender, EventArgs e)
        {//保存工资卡号
            if (Label_ZhangHao_Slr.Text == TextBox_ZhangHao_Slr.Value.ToString().Trim())
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('没有修改工资卡号，不需要保存') ;</script>");
                TextBox_ZhangHao_Slr.Focus();
            }
            else
            {
                bool flag = true;
                string slr = TextBox_ZhangHao_Slr.Value.ToString().Trim();
                System.Text.RegularExpressions.Regex rex =
      new System.Text.RegularExpressions.Regex(@"^\d+$");



                if (TextBox_ZhangHao_Slr.Value.ToString().Trim() != "")
                {
                    if (!(rex.IsMatch(slr)))
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('不是合法的工资卡号') ;</script>");
                        TextBox_ZhangHao_Slr.Focus();
                        flag = false;
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('工资卡号不能为空。') ;</script>");
                    flag = false;

                }
                if (flag)
                {
                    using (OracleConnection conn = new OracleConnection(OracleOperateHelp.ConnectionStringLocalTransaction))
                    {
                        conn.Open();
                        OracleCommand cmd = conn.CreateCommand();
                        OracleTransaction tran = conn.BeginTransaction();
                        try
                        {

                            cmd.Transaction = tran;
                            cmd.CommandType = CommandType.Text;


                            string slr_no = TextBox_ZhangHao_Slr.Value.ToString().Trim();
                            string insertlog = "INSERT INTO OPER_LOG(OPERNAME,OLDVALUE,NEWVALUE,OPERUSER)SELECT  '微信编辑人员(" + newstaffid.Text.ToString().Trim() + ")基本信息:工资卡号',SLR_NO,'" + slr_no + "','" + newstaffid.Text.ToString().Trim() + "' FROM V_STAFF_INFO_ALL  WHERE ID ='" + newstaffid.Text.ToString().Trim() + "'";//更新操作日志
                            string sqlstaff = "UPDATE BASE_STAFF SET  SLR_NO='" + slr_no + "'  WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑在职人员表中的工资卡号
                            string sqlstaffbak = "UPDATE BASE_STAFF_BAK SET SLR_NO='" + slr_no + "'  WHERE ID='" + newstaffid.Text.ToString().Trim() + "'"; //编辑离职人员表中的工资卡号
                            cmd.CommandText = insertlog;//日志
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sqlstaff;//在职人员
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sqlstaffbak;//离职人员
                            cmd.ExecuteNonQuery();
                            Label_ZhangHao_Slr.Text = TextBox_ZhangHao_Slr.Value.ToString().Trim();
                            tran.Commit();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('工资卡号保存成功。') ;</script>");


                        }
                        catch
                        {
                            tran.Rollback();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('工资卡号保存失败,稍后重新保存。') ;</script>");


                        }
                    }
                }

            }
        }

        protected void LinkButton_NianJian_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weixin/baseinfo/BaseInfo_Nj.aspx?newstaffid="+newstaffid.Text.ToString().Trim()+"&yyyy="+Label_NianJia_Yyyy.Text.ToString().Trim()+"&staffname=" + Server.UrlEncode(staffname.Text.ToString().Trim()));
        
        }
    }
}