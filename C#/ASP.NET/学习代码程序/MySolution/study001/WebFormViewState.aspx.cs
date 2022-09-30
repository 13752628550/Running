using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace study001
{
    public partial class WebFormViewState : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        int i = 0; 
        protected void btnCount_Click(object sender, EventArgs e)
        {
            //在第一次之后点击时候，需要取得上次保存i值
            if(ViewState["count"] != null)
            {
                i = (int)ViewState["count"];
            }
            i++;

            //将i数值保存至视图状态
            ViewState["count"] = i;
            Response.Write(i);

            //对象数据存储演示代码
        }
        List<Student> listStudents = null; //保存所有学生信息
        protected void btnaddStudent_Click(object sender, EventArgs e)
        {
            if(ViewState["lst"]!=null)
            {
                listStudents = (List<Student>)ViewState["lst"];
            }
            else
            {
                listStudents = new List<Student>();
            }
                
            string name = txtName.Text;
            int age = Convert.ToInt32(txtAge.Text);

            listStudents.Add(new Student { name = name, age = age });
            
            //遍历集合信息数据
            foreach(Student item in listStudents)
            {
                Response.Write("姓名:" + item.name + "<br/>年龄：" + item.age+ " <br/>");
            }
            //学员集合保存至视图状态
            ViewState["lst"] = listStudents;

        }
    }
}










