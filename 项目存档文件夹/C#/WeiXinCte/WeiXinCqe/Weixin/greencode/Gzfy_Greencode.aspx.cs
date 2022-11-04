using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinCqe.Weixin.greencode
{
    public partial class Gzfy_Greencode : System.Web.UI.Page
    {

        public static string Rccimage = ""; 
        public static string Rccimage1 = "";
        public static string Rccimage2 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["weixinid"] == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww4119ac66ab8de522&redirect_uri=https://ctewechat.mitsumi.com.cn/Weixin/authority/getStaffid.aspx&response_type=code&scope=snsapi_base&agentid=1000002&state=status5#wechat_redirect");
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
                    lbl_staffid.Text = staffid.Text;
                    Hidden2.Value = staffid.Text;
                    string sqlt = "SELECT NAME,TOPDEPTNAME FROM BASE_STAFF WHERE ID='" + staffid.Text + "' AND (DATE_OUT IS NULL OR DATE_OUT>SYSDATE)";
                    DataTable dt = OracleOperateHelp.getDataTable(sqlt);
                    if (dt.Rows.Count > 0)
                    {
                        lbl_name.Text = dt.Rows[0]["NAME"].ToString();
                        lbl_dept.Text = dt.Rows[0]["TOPDEPTNAME"].ToString();
                    }
                    else
                    {
                        lbl_name.Text = "";
                        lbl_dept.Text = "";
                        Button1.Visible = false;
                    }
                    if (Request.QueryString["Hidden"] != null && Request.QueryString["Hidden"].ToString() == "核酸结果")
                    {
                        Hidden1.Value = "核酸结果";
                    }
                    else
                    {
                        Hidden1.Value = "健康码";
                    }
                    ImageButton1_Click(null, null);



                }
                //staffid.Text = "171601";
                //    lbl_staffid.Text = staffid.Text;
                //Hidden2.Value = staffid.Text;
                //string sqlt = "SELECT NAME,TOPDEPTNAME FROM BASE_STAFF WHERE ID='" + staffid.Text + "' AND (DATE_OUT IS NULL OR DATE_OUT>SYSDATE)";
                //DataTable dt = OracleOperateHelp.getDataTable(sqlt);
                //if (dt.Rows.Count > 0)
                //{
                //    lbl_name.Text = dt.Rows[0]["NAME"].ToString();
                //    lbl_dept.Text = dt.Rows[0]["TOPDEPTNAME"].ToString();
                //}
                //else
                //{
                //    lbl_name.Text = "";
                //    lbl_dept.Text = "";
                //    Button1.Visible = false;
                //}
                //Hidden1.Value = "健康码";
                //ImageButton1_Click(null, null);

            }
        }


        #region 提交答案
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Rccimage))
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('健康码上传失败，请重新上传。') ;window.location.href = '#link27';</script>");
                return;
            }
            else
            {
                string imgid = Rccimage.Split('>')[0].ToString(); 

                string flag = decodeBase64ToImage(Rccimage.Split('>')[1].ToString(), "C:\\WebSite\\wechat.cte.mitsumi.com.cn\\GZFY_GREENCODE"  , imgid);
                if (flag == "OK")
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
                            string sql = "MERGE INTO GZFY_GREEN_HS A  USING ( SELECT COUNT(*) CO FROM GZFY_GREEN_HS WHERE STAFFID='" + staffid.Text + "' ) B ON (B.CO<>0 )   " +
                                "  WHEN NOT MATCHED THEN INSERT  (STAFFID,GREEN_DATE,GH_STATUS) VALUES ('" + staffid.Text + "',SYSDATE,1) " +
                                "  WHEN  MATCHED THEN UPDATE SET A.GH_STATUS=1,A.GREEN_DATE=SYSDATE WHERE   A.STAFFID='" + staffid.Text + "' ";
                            cmd.CommandText = sql;
                            int result = cmd.ExecuteNonQuery();
                            tran.Commit();
                            Get_s();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存成功。谢谢参与！') ;window.location.href = '#';</script>");
                            
                        }
                        catch (Exception ex)
                        {
                            tran.Rollback();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存失败，稍后重试。') ;window.location.href = '#';</script>");

                        } 
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('上传失败，图片过大。') ;window.location.href = '#link27';</script>");
                    return;
                } 

            }
        }
        #endregion

        public void Get_s()
        {
            string sqlt = "SELECT GREEN_DATE,XC_DATE,HS_STATUS,JGHS_STATUS,GH_STATUS FROM GZFY_GREEN_HS WHERE STAFFID='" + staffid.Text + "' ";
            DataTable dt = OracleOperateHelp.getDataTable(sqlt); 
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["GH_STATUS"].ToString() == "0")
                {
                    lbl_status.Text = "（健康码、行程码、核酸结果未提交） ";
                    lbl_status.ForeColor = Color.Red;
                    lbl_status.BackColor = Color.Transparent;
                    lbl_status.Font.Size = 17;
                }
                if (dt.Rows[0]["GH_STATUS"].ToString() == "1")
                {
                    if (!string.IsNullOrEmpty(dt.Rows[0]["GREEN_DATE"].ToString()))
                    {
                        lbl_status.Text = "（健康码已提交、";
                    }
                    else
                    {
                        lbl_status.Text = "（健康码未提交、";
                    }
                    if (!string.IsNullOrEmpty(dt.Rows[0]["XC_DATE"].ToString()))
                    {
                        lbl_status.Text += "行程码已提交、";
                    }
                    else
                    {
                        lbl_status.Text += "行程码未提交、";
                    }
                    if (dt.Rows[0]["HS_STATUS"].ToString() == "阴性" || dt.Rows[0]["JGHS_STATUS"].ToString() == "阴性")
                    {
                        lbl_status.Text += "核酸结果已提交）";
                    }
                    else
                    {
                        lbl_status.Text += "核酸结果未提交）";
                    }
                    if (lbl_status.Text == "（健康码已提交、行程码已提交、核酸结果已提交）")
                    {
                        lbl_status.ForeColor = Color.Black; 
                    }
                    else
                    {
                        lbl_status.ForeColor = Color.Red;
                    }
                    lbl_status.BackColor = Color.Transparent;
                    lbl_status.Font.Size = 17;
                }
                if (dt.Rows[0]["GH_STATUS"].ToString() == "2")
                {
                    lbl_status.Text = "（允许出勤） ";
                    lbl_status.BackColor = Color.Green; 
                    lbl_status.ForeColor = Color.White;
                    lbl_status.Font.Size = 45;
                }
            }
            else
            {
                lbl_status.Text = "（健康码、行程码、核酸结果未提交） ";
                lbl_status.ForeColor = Color.Red;
                lbl_status.BackColor = Color.Transparent;
            }
           

        }
    


        /// <summary>
        /// 图片上传 Base64解码
        /// </summary>
        /// <param name="dataURL">Base64数据</param>
        /// <param name="path">保存路径</param>
        /// <param name="imgName">图片名字</param> 

        public string decodeBase64ToImage(string dataURL, string path, string imgName)
        {

            string filename = ""; 
            String base64 = dataURL.Substring(dataURL.IndexOf("," ) + 1);      //将‘，’以前的多余字符串删除
            Bitmap bitmap = null;//定义一个Bitmap对象，接收转换完成的图片
            
            try 
            {
                byte[] arr = Convert.FromBase64String(base64);//将纯净资源Base64转换成等效的8位无符号整形数组 
                MemoryStream ms = new MemoryStream(arr);//转换成无法调整大小的MemoryStream对象
                Bitmap bmp = new Bitmap(ms);//将MemoryStream对象转换成Bitmap对象 
                ms.Close();//关闭当前流，并释放所有与之关联的资源
                bitmap = bmp;
                filename = path + "\\" + imgName + ".png";//所要保存的相对路径及名字 

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                bitmap.Save(filename, ImageFormat.Png);//保存到服务器路径

            }
            catch (Exception ex)
            {
                return ex.Message + ">>" + filename ;
            }
            return "OK";//返回相对路径
        }

        [WebMethod]
        public static string KongJian(string c_image,string staffid )
        {
            if (!string.IsNullOrEmpty(c_image))
            {
                Rccimage = staffid+">"+c_image; 
                return "{\"res\":\"ok\"}"; 
            }
            else
            {
                return "{\"res\":\"err\"}";
            }
        }
        [WebMethod]
        public static string HeSuan(string c_image, string staffid)
        {
            if (!string.IsNullOrEmpty(c_image))
            {
                Rccimage1 = staffid + ">" + c_image;
                return "{\"res\":\"ok\"}";
            }
            else
            {
                return "{\"res\":\"err\"}";
            }
        }
        [WebMethod]
        public static string XingCheng(string c_image, string staffid)
        {
            if (!string.IsNullOrEmpty(c_image))
            {
                Rccimage2 = staffid + ">" + c_image;
                return "{\"res\":\"ok\"}";
            }
            else
            {
                return "{\"res\":\"err\"}";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string an_s = "";
            if (a1.Checked || a2.Checked || a3.Checked || a4.Checked)
            {
                if (a1.Checked) an_s = "未做核酸检测";
                if (a2.Checked) an_s = "阴性";
                if (a3.Checked) an_s = "未出结果";
                if (a4.Checked) an_s = "阳性";

                if (string.IsNullOrEmpty(Rccimage1)&&(an_s == "阴性"|| an_s == "阳性"))
                {

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('核酸结果上传失败，请重新上传。') ;window.location.href = '#link27';</script>");
                    return;
                }
                else
                {
                    string imgid = Rccimage1.Split('>')[0].ToString(); 

                    string flag = decodeBase64ToImage(Rccimage1.Split('>')[1].ToString(), "C:\\WebSite\\wechat.cte.mitsumi.com.cn\\GZFY_HS" , imgid);
                    if (flag == "OK" ||an_s == "未做核酸检测" || an_s == "未出结果")
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
                                string sql = "MERGE INTO GZFY_GREEN_HS A  USING (SELECT COUNT(*) CO FROM GZFY_GREEN_HS WHERE   STAFFID='" + staffid.Text + "' ) B ON (B.CO<>0 )   " +
                                "  WHEN NOT MATCHED THEN INSERT  (STAFFID,HS_DATE,HS_STATUS,GH_STATUS) VALUES('" + staffid.Text + "',SYSDATE,'" + an_s + "',1)" +
                                "  WHEN  MATCHED THEN UPDATE SET A.GH_STATUS=1,A.HS_STATUS='" + an_s + "',HS_DATE=SYSDATE WHERE   A.STAFFID='" + staffid.Text + "' ";
                                cmd.CommandText = sql;
                                int result = cmd.ExecuteNonQuery();
                                tran.Commit();
                                Get_s();
                                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存成功。谢谢参与！') ;window.location.href = '#';</script>");

                            }
                            catch (Exception ex)
                            {
                                tran.Rollback();
                                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存失败，稍后重试。') ;window.location.href = '#';</script>");

                            }
                        }

                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('上传失败，图片过大。') ;window.location.href = '#link27';</script>");
                        return;
                    }

                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('核酸结果未选择。') ;window.location.href = '#link27';</script>");
                return;

            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            Labeltitle.Text = Hidden1.Value.ToString().Trim();
            switch (Labeltitle.Text)
            {
                case "健康码":
                    divlabel1.Attributes.Add("class", "weui-navbar__item weui-bar__item_on");
                    divlabel2.Attributes.Add("class", "weui-navbar__item");
                    divlabel3.Attributes.Add("class", "weui-navbar__item");
                    JK.Visible = true;
                    HS.Visible = false;
                    XC.Visible = false;
                    break;
                case "核酸结果":
                    divlabel2.Attributes.Add("class", "weui-navbar__item weui-bar__item_on");
                    divlabel1.Attributes.Add("class", "weui-navbar__item");
                    divlabel3.Attributes.Add("class", "weui-navbar__item");
                    HS.Visible = true;
                    JK.Visible = false;
                    XC.Visible = false;
                    break;
                case "行程卡":
                    divlabel3.Attributes.Add("class", "weui-navbar__item weui-bar__item_on");
                    divlabel1.Attributes.Add("class", "weui-navbar__item");
                    divlabel2.Attributes.Add("class", "weui-navbar__item");
                    HS.Visible = false;
                    JK.Visible = false;
                    XC.Visible = true;
                    break;
                default:
                    divlabel1.Attributes.Add("class", "weui-navbar__item weui-bar__item_on");
                    divlabel2.Attributes.Add("class", "weui-navbar__item");
                    divlabel3.Attributes.Add("class", "weui-navbar__item");
                    JK.Visible = true;
                    HS.Visible = false;
                    XC.Visible = false;
                    break;
            }
            Get_s();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Rccimage2))
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('行程码上传失败，请重新上传。') ;window.location.href = '#link27';</script>");
                return;
            }
            else
            {
                string imgid = Rccimage2.Split('>')[0].ToString();


                string flag = decodeBase64ToImage(Rccimage2.Split('>')[1].ToString(), "C:\\WebSite\\wechat.cte.mitsumi.com.cn\\GZFY_XingCheng" , imgid);
                if (flag == "OK")
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
                            string sql = "MERGE INTO GZFY_GREEN_HS A  USING ( SELECT COUNT(*) CO FROM GZFY_GREEN_HS WHERE STAFFID='" + staffid.Text + "' ) B ON (B.CO<>0 )   " +
                                "  WHEN NOT MATCHED THEN INSERT  (STAFFID,XC_DATE,GH_STATUS) VALUES ('" + staffid.Text + "',SYSDATE,1) " +
                                "  WHEN  MATCHED THEN UPDATE SET A.GH_STATUS=1,A.XC_DATE=SYSDATE WHERE   A.STAFFID='" + staffid.Text + "' ";
                            cmd.CommandText = sql;
                            int result = cmd.ExecuteNonQuery();
                            tran.Commit();
                            Get_s();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存成功。谢谢参与！') ;window.location.href = '#';</script>");

                        }
                        catch (Exception ex)
                        {
                            tran.Rollback();
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('保存失败，稍后重试。') ;window.location.href = '#';</script>");

                        }
                    }

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script languange=javascript>alert('上传失败，图片过大。') ;window.location.href = '#link27';</script>");
                    return;
                }

            }

        }
    }
}